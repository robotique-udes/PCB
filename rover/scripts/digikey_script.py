#!/usr/bin/env python3
import csv
import argparse
import math
import os
import sys
import re
from datetime import datetime
from pathlib import Path

# Define ANSI color codes with fallback for systems that don't support colors
def supports_color():
    """Check if the terminal supports color output"""
    plat = sys.platform
    supported_platform = plat != 'win32' or 'ANSICON' in os.environ
    is_a_tty = hasattr(sys.stdout, 'isatty') and sys.stdout.isatty()
    return supported_platform and is_a_tty

if supports_color():
    RESET = "\033[0m"
    BLUE = "\033[94m"
    GREEN = "\033[92m"
    YELLOW = "\033[93m"
    RED = "\033[91m"
else:
    RESET = BLUE = GREEN = YELLOW = RED = ""

def validate_filename(filename):
    """Validate filename for illegal characters and replace them"""
    if not filename:
        return False
    # Remove illegal characters for Windows and Unix systems
    sanitized = re.sub(r'[<>:"/\\|?*]', '_', filename)
    return sanitized == filename

def sanitize_filename(filename):
    """Sanitize filename by replacing illegal characters"""
    if not filename:
        return f"output_{datetime.now().strftime('%Y%m%d_%H%M%S')}"
    # Remove illegal characters for Windows and Unix systems
    sanitized = re.sub(r'[<>:"/\\|?*]', '_', filename)
    return sanitized

def validate_numeric_input(value, type_func, min_value=0, error_msg=None):
    """Validate a numeric input with range checking"""
    try:
        if value is None:
            return None
        converted = type_func(value)
        if converted <= min_value:
            raise ValueError(f"Value must be greater than {min_value}")
        return converted
    except ValueError as e:
        if error_msg:
            print(f"{RED}{error_msg}: {e}{RESET}")
        return None

# Backup function for output files
def create_backup(file_path):
    """Create backup of existing file before overwriting"""
    if os.path.exists(file_path):
        backup_path = f"{file_path}.bak"
        try:
            os.rename(file_path, backup_path)
            print(f"{YELLOW}Created backup of existing file: {backup_path}{RESET}")
            return True
        except Exception as e:
            print(f"{YELLOW}Warning: Could not create backup: {e}{RESET}")
    return False

# Get part number with retry until valid input or explicit skip
def get_part_number(suggested_part=""):
    """Prompt user for part number with retry until valid input or explicit skip"""
    skip_keywords = ["skip", "s"]
    prompt = f"Enter Part Number [{suggested_part}] (or 'skip'/'s' to skip): " if suggested_part else "Enter Part Number (or 'skip'/'s' to skip): "
    
    while True:
        try:
            user_input = input(prompt).strip()
            
            # Use suggested part if user just presses Enter and suggestion exists
            if not user_input and suggested_part:
                return suggested_part
                
            # Check if user wants to skip
            if user_input.lower() in skip_keywords:
                return None
                
            # Ensure input isn't just whitespace
            if user_input:
                return user_input
                
            # If we get here, input was empty and no suggested part
            print(f"{YELLOW}Please enter a valid part number or type 'skip' to skip this item.{RESET}")
            
        except KeyboardInterrupt:
            print(f"\n{RED}Operation cancelled by user{RESET}")
            sys.exit(0)

# Parse command-line arguments with more options
parser = argparse.ArgumentParser(description="Convert BOM CSV to ordering format")
parser.add_argument("input_file", help="Path to the input CSV file")
parser.add_argument("-p", "--prefix", help="Customer Reference Prefix")
parser.add_argument("-n", "--pcb-count", type=str, help="Number of PCBs to order")
parser.add_argument("-a", "--attrition", type=str, help="Part quantity multiplier")
parser.add_argument("-o", "--output", help="Output filename (without path, will be saved in BomAutoGen folder)")
parser.add_argument("-s", "--skipped", help="Skipped parts filename (without path, will be saved in BomAutoGen folder)")
parser.add_argument("-b", "--batch", action="store_true", help="Run in batch mode with saved part numbers")
parser.add_argument("--force", action="store_true", help="Force overwrite without backup")
parser.add_argument("--validate-only", action="store_true", help="Validate the input file without processing")
args = parser.parse_args()

# Get script directory for cache file
script_dir = os.path.dirname(os.path.abspath(__file__))
if not script_dir:  # Fallback if script directory can't be determined
    script_dir = os.getcwd()
    print(f"{YELLOW}Warning: Using current directory for script path: {script_dir}{RESET}")

# Validate input file exists and is readable
if not os.path.exists(args.input_file):
    print(f"{RED}Error: Input file '{args.input_file}' not found{RESET}")
    sys.exit(1)

if not os.path.isfile(args.input_file):
    print(f"{RED}Error: '{args.input_file}' is not a file{RESET}")
    sys.exit(1)

if not os.access(args.input_file, os.R_OK):
    print(f"{RED}Error: Input file '{args.input_file}' is not readable{RESET}")
    sys.exit(1)

# Verify input file is a CSV
try:
    with open(args.input_file, 'r', encoding='utf-8-sig') as test_file:
        dialect = csv.Sniffer().sniff(test_file.read(4096))
        test_file.seek(0)
        has_header = csv.Sniffer().has_header(test_file.read(4096))
        if not has_header:
            print(f"{YELLOW}Warning: Input CSV appears to be missing headers{RESET}")
except csv.Error:
    print(f"{RED}Error: Input file does not appear to be a valid CSV{RESET}")
    sys.exit(1)
except UnicodeDecodeError:
    # Try alternate encodings
    encodings = ['latin-1', 'cp1252', 'iso-8859-1']
    success = False
    for encoding in encodings:
        try:
            with open(args.input_file, 'r', encoding=encoding) as test_file:
                test_file.read()
                print(f"{YELLOW}Warning: Input file appears to be in {encoding} encoding, not UTF-8{RESET}")
                success = True
                break
        except UnicodeDecodeError:
            continue
    if not success:
        print(f"{RED}Error: Input file has encoding issues and cannot be read{RESET}")
        sys.exit(1)

# Get input file directory for output files
try:
    input_file_path = os.path.abspath(args.input_file)
    input_file_dir = os.path.dirname(input_file_path)
except Exception as e:
    print(f"{RED}Error determining input file path: {e}{RESET}")
    input_file_dir = os.getcwd()
    print(f"{YELLOW}Falling back to current directory: {input_file_dir}{RESET}")

# Create BomAutoGen directory in the same folder as the input file
output_dir = os.path.join(input_file_dir, "BomAutoGen")
try:
    os.makedirs(output_dir, exist_ok=True)
    print(f"{GREEN}Output directory created/verified: {output_dir}{RESET}")
except PermissionError:
    print(f"{RED}Error: No permission to create output directory: {output_dir}{RESET}")
    output_dir = os.getcwd()
    print(f"{YELLOW}Falling back to current directory: {output_dir}{RESET}")
    try:
        # Try to create BomAutoGen in current directory as fallback
        output_dir = os.path.join(os.getcwd(), "BomAutoGen")
        os.makedirs(output_dir, exist_ok=True)
        print(f"{GREEN}Created fallback output directory: {output_dir}{RESET}")
    except Exception as e:
        print(f"{RED}Failed to create fallback directory. Using current directory.{RESET}")
        output_dir = os.getcwd()
except Exception as e:
    print(f"{RED}Error creating output directory: {e}{RESET}")
    print(f"{YELLOW}Falling back to input file directory{RESET}")
    output_dir = input_file_dir

# Check write permissions for output directory
if not os.access(output_dir, os.W_OK):
    print(f"{RED}Error: No write permission for output directory: {output_dir}{RESET}")
    temp_dir = os.path.join(os.path.expanduser("~"), "BomAutoGen_output")
    try:
        os.makedirs(temp_dir, exist_ok=True)
        output_dir = temp_dir
        print(f"{YELLOW}Using home directory for output instead: {output_dir}{RESET}")
    except Exception:
        print(f"{RED}Cannot create alternative output directory. Exiting.{RESET}")
        sys.exit(1)

# Create a part number cache file in the script directory
part_cache_file = os.path.join(script_dir, "known_part_cache.csv")
part_cache = {}

# Verify cache directory is writable
cache_dir_writable = os.access(script_dir, os.W_OK)
if not cache_dir_writable:
    print(f"{YELLOW}Warning: Cannot write to cache directory {script_dir}{RESET}")
    # Try to use user's home directory for cache
    try:
        home_cache_dir = os.path.join(os.path.expanduser("~"), ".bomautogen")
        os.makedirs(home_cache_dir, exist_ok=True)
        part_cache_file = os.path.join(home_cache_dir, "known_part_cache.csv")
        print(f"{YELLOW}Using alternative cache location: {part_cache_file}{RESET}")
        cache_dir_writable = True
    except Exception as e:
        print(f"{YELLOW}Warning: Cannot create alternative cache: {e}{RESET}")
        print(f"{YELLOW}Will run without persistent part cache{RESET}")

# Load existing part number cache if available
if os.path.exists(part_cache_file):
    try:
        with open(part_cache_file, newline='', encoding='utf-8') as cachefile:
            cache_reader = csv.reader(cachefile)
            for row in cache_reader:
                if len(row) >= 2:
                    key = f"{row[0]}|{row[1]}"  # Value|Footprint as key
                    part_cache[key] = row[2]
        print(f"{GREEN}Loaded {len(part_cache)} entries from part cache{RESET}")
    except UnicodeDecodeError:
        # Try alternate encodings
        encodings = ['latin-1', 'cp1252', 'iso-8859-1']
        for encoding in encodings:
            try:
                with open(part_cache_file, newline='', encoding=encoding) as cachefile:
                    cache_reader = csv.reader(cachefile)
                    for row in cache_reader:
                        if len(row) >= 2:
                            key = f"{row[0]}|{row[1]}"  # Value|Footprint as key
                            part_cache[key] = row[2]
                print(f"{YELLOW}Loaded part cache using {encoding} encoding{RESET}")
                break
            except Exception:
                continue
    except Exception as e:
        print(f"{YELLOW}Warning: Could not load part cache: {e}{RESET}")
        print(f"{YELLOW}Creating new part cache{RESET}")

# Validation mode - check input file structure and exit
if args.validate_only:
    print(f"{GREEN}Validating input file structure...{RESET}")
    try:
        with open(args.input_file, newline='', encoding='utf-8-sig') as csvfile:
            reader = csv.DictReader(csvfile)
            required_fields = ['Reference', 'Value', 'Footprint', 'Qty']
            
            # Validate CSV structure
            missing = [f for f in required_fields if f not in reader.fieldnames]
            if missing:
                print(f"{RED}Error: Input CSV missing required fields: {', '.join(missing)}{RESET}")
                sys.exit(1)
                
            print(f"{GREEN}CSV headers found: {', '.join(reader.fieldnames)}{RESET}")
            
            # Check for empty rows or problematic data
            row_count = 0
            empty_refs = 0
            invalid_qty = 0
            
            for row_num, row in enumerate(reader, 1):
                row_count += 1
                if not row['Reference'] or row['Reference'].strip() == "":
                    empty_refs += 1
                    print(f"{YELLOW}Row {row_num}: Empty Reference{RESET}")
                
                try:
                    if row['Qty'] and row['Qty'].strip():
                        int(row['Qty'])
                except ValueError:
                    invalid_qty += 1
                    print(f"{YELLOW}Row {row_num}: Invalid Qty value '{row['Qty']}'{RESET}")
            
            print(f"\n{GREEN}Validation Summary:{RESET}")
            print(f"  - Total rows: {row_count}")
            if empty_refs == 0 and invalid_qty == 0:
                print(f"  - {GREEN}No critical issues found{RESET}")
            else:
                print(f"  - {YELLOW}Empty references: {empty_refs}{RESET}")
                print(f"  - {YELLOW}Invalid quantities: {invalid_qty}{RESET}")
                
            print(f"\n{GREEN}Input file structure is valid.{RESET}")
            sys.exit(0)
    except Exception as e:
        print(f"{RED}Validation failed: {e}{RESET}")
        sys.exit(1)

# Get user inputs
print(f"{GREEN}Welcome to the BOM CSV Converter!{RESET}")

# Use command line args if provided, otherwise prompt
customer_reference_prefix = args.prefix
while not customer_reference_prefix:
    customer_reference_prefix = input("Enter the Customer Reference Prefix (ex:<PREFIX>|<Reference>): ").strip()
    if not customer_reference_prefix:
        print(f"{YELLOW}Customer reference prefix cannot be empty.{RESET}")

# Validate PCB count with retries
pcb_count = validate_numeric_input(args.pcb_count, int, 0, "Invalid PCB count")
while pcb_count is None:
    try:
        pcb_input = input("Please enter the number of PCBs you are ordering (positive integer): ").strip()
        pcb_count = validate_numeric_input(pcb_input, int, 0, "Invalid PCB count")
    except KeyboardInterrupt:
        print(f"\n{RED}Operation cancelled by user{RESET}")
        sys.exit(0)

# Validate attrition rate with retries
attrition_rate = validate_numeric_input(args.attrition, float, 0, "Invalid attrition rate")
while attrition_rate is None:
    try:
        attrition_input = input("Please enter the part qty multiplier (positive number): ").strip()
        attrition_rate = validate_numeric_input(attrition_input, float, 0, "Invalid attrition rate")
    except KeyboardInterrupt:
        print(f"\n{RED}Operation cancelled by user{RESET}")
        sys.exit(0)

print("Processing your file...\n")

# Create output filenames with timestamps
timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
input_filename = os.path.splitext(os.path.basename(args.input_file))[0]
if args.output:
    output_filename = sanitize_filename(args.output)
    if output_filename != args.output:
        print(f"{YELLOW}Output filename contains invalid characters. Using: {output_filename}{RESET}")
else:
    output_filename = f"{input_filename}-{timestamp}.csv"

if args.skipped:
    skipped_filename = sanitize_filename(args.skipped)
    if skipped_filename != args.skipped:
        print(f"{YELLOW}Skipped parts filename contains invalid characters. Using: {skipped_filename}{RESET}")
else:
    skipped_filename = f"{input_filename}-{timestamp}_skipped_parts.csv"

# Create full paths for output files
output_file = os.path.join(output_dir, output_filename)
skipped_file = os.path.join(output_dir, skipped_filename)

# Check if output files already exist and create backups if needed
if not args.force:
    if os.path.exists(output_file):
        if create_backup(output_file):
            print(f"{YELLOW}Output file already exists. Creating backup.{RESET}")
        
    if os.path.exists(skipped_file):
        if create_backup(skipped_file):
            print(f"{YELLOW}Skipped parts file already exists. Creating backup.{RESET}")

skipped_items = []
processed_items = []
new_cache_entries = []

# Read input CSV and process with better error handling
output_data = [("Part Number", "Customer Reference", "Quantity 1")]

try:
    encoding = 'utf-8-sig'
    try:
        with open(args.input_file, 'r', encoding=encoding) as test:
            test.read(1024)  # Test reading with this encoding
    except UnicodeDecodeError:
        encoding = 'latin-1'  # Fallback encoding
        print(f"{YELLOW}Falling back to {encoding} encoding for input file{RESET}")
        
    with open(args.input_file, newline='', encoding=encoding) as csvfile:
        reader = csv.DictReader(csvfile)
        required_fields = ['Reference', 'Value', 'Footprint', 'Qty']
        
        # Validate CSV structure
        if not all(field in reader.fieldnames for field in required_fields):
            missing = [f for f in required_fields if f not in reader.fieldnames]
            print(f"{RED}Error: Input CSV missing required fields: {', '.join(missing)}{RESET}")
            sys.exit(1)
            
        for row_num, row in enumerate(reader, 1):
            try:
                # Skip rows with empty references or quantities
                if not row['Reference'] or row['Reference'].strip() == "":
                    print(f"{YELLOW}Warning: Row {row_num} has empty Reference. Skipping.{RESET}")
                    skip_data = {
                        'Reference': '(Empty)',
                        'Value': row.get('Value', ''),
                        'Footprint': row.get('Footprint', ''),
                        'Qty': row.get('Qty', ''),
                        'Skip_Reason': 'Empty Reference field'
                    }
                    skipped_items.append(skip_data)
                    continue
                
                if not row.get('Qty') or row['Qty'].strip() == "":
                    print(f"{YELLOW}Warning: Row {row_num} has empty Qty. Skipping.{RESET}")
                    skip_data = {
                        'Reference': row['Reference'],
                        'Value': row.get('Value', ''),
                        'Footprint': row.get('Footprint', ''),
                        'Qty': '(Empty)',
                        'Skip_Reason': 'Empty Quantity field'
                    }
                    skipped_items.append(skip_data)
                    continue
                
                # Fill in empty fields with placeholder values to prevent errors
                if not row.get('Value') or row['Value'].strip() == "":
                    row['Value'] = "(No Value)"
                    print(f"{YELLOW}Warning: Row {row_num} has empty Value. Using placeholder.{RESET}")
                
                if not row.get('Footprint') or row['Footprint'].strip() == "":
                    row['Footprint'] = "(No Footprint)"
                    print(f"{YELLOW}Warning: Row {row_num} has empty Footprint. Using placeholder.{RESET}")
                
                # Sanitize reference to avoid escape sequences
                row['Reference'] = row['Reference'].replace('\n', ' ').replace('\r', ' ')
                
                # Display part info with better formatting
                print(f"\n{BLUE}Processing Item #{row_num}:{RESET}")
                print(f"  Reference: {row['Reference']}")
                print(f"  Value: {row['Value']}")
                print(f"  Footprint: {row['Footprint']}")
                print(f"  Quantity: {row['Qty']}")
                digikey_info = f"  Digikey: {row['Digikey']}" if 'Digikey' in row and row['Digikey'] else "  Digikey: N/A"
                print(digikey_info)
                description_info = f"  Description: {row['Description']}" if 'Description' in row and row['Description'] else "  Description: N/A"
                print(description_info)
                
                # Check if we have this part in cache
                cache_key = f"{row['Value']}|{row['Footprint']}"
                suggested_part = part_cache.get(cache_key, "")
                
                if suggested_part and args.batch:
                    print(f"{GREEN}Using cached part number: {suggested_part}{RESET}")
                    part_number = suggested_part
                else:
                    # Using the new get_part_number function for persistent prompting
                    part_number = get_part_number(suggested_part)
                
                if not part_number:
                    print(f"{YELLOW}Skipping this entry by user request.{RESET}")
                    # Store the complete row data for skipped items
                    skip_data = {
                        'Reference': row['Reference'],
                        'Value': row['Value'],
                        'Footprint': row['Footprint'],
                        'Qty': row['Qty'],
                        'Skip_Reason': 'Explicitly skipped by user'
                    }
                    
                    # Add optional fields if they exist
                    for field in ['Digikey', 'Description']:
                        if field in row:
                            skip_data[field] = row[field]
                            
                    skipped_items.append(skip_data)
                    continue
                
                # Save to cache if it's a new entry and cache is writable
                if cache_dir_writable and (cache_key not in part_cache or part_cache[cache_key] != part_number):
                    part_cache[cache_key] = part_number
                    new_cache_entries.append([row['Value'], row['Footprint'], part_number])
                
                # Calculate required quantity with proper error handling
                try:
                    base_qty = int(row['Qty'])
                    if base_qty <= 0:
                        print(f"{YELLOW}Warning: Non-positive quantity '{row['Qty']}' for {row['Reference']}. Using 1.{RESET}")
                        base_qty = 1
                    total_qty = str(math.ceil(base_qty * pcb_count * attrition_rate))
                except ValueError:
                    print(f"{YELLOW}Warning: Invalid quantity '{row['Qty']}' for {row['Reference']}. Using 1.{RESET}")
                    total_qty = str(math.ceil(1 * pcb_count * attrition_rate))
                
                # Sanitize customer reference - replace commas with dots and remove any problematic characters
                clean_ref = row['Reference'].replace(',', '.').replace(';', '_').replace('"', '_')
                customer_reference = f"{customer_reference_prefix}|{clean_ref}"
                output_data.append((part_number, customer_reference, total_qty))
                processed_items.append(row['Reference'])
                
            except KeyError as e:
                print(f"{RED}Error in row {row_num}: Missing field {e}{RESET}")
                continue
            except Exception as e:
                print(f"{RED}Error processing row {row_num}: {e}{RESET}")
                continue
except Exception as e:
    print(f"{RED}Error reading CSV file: {e}{RESET}")
    sys.exit(1)

# Check if any data was processed
if len(output_data) <= 1:
    print(f"{RED}Error: No parts were processed. Check your input file.{RESET}")
    sys.exit(1)

# Write to output CSV with error handling
output_write_success = False
try:
    with open(output_file, "w", newline='', encoding='utf-8') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerows(output_data)
    output_write_success = True
except PermissionError:
    print(f"{RED}Error: Permission denied when writing to {output_file}{RESET}")
    # Try writing to the user's home directory as a fallback
    home_output = os.path.join(os.path.expanduser("~"), output_filename)
    try:
        with open(home_output, "w", newline='', encoding='utf-8') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerows(output_data)
        output_file = home_output
        output_write_success = True
        print(f"{YELLOW}Wrote output to home directory instead: {output_file}{RESET}")
    except Exception as e:
        print(f"{RED}Failed to write output even to home directory: {e}{RESET}")
except Exception as e:
    print(f"{RED}Error writing output file: {e}{RESET}")

# Write skipped items to separate CSV
skipped_write_success = False
if skipped_items:
    try:
        with open(skipped_file, "w", newline='', encoding='utf-8') as csvfile:
            fieldnames = list(skipped_items[0].keys())
            writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
            writer.writeheader()
            writer.writerows(skipped_items)
        skipped_write_success = True
    except PermissionError:
        print(f"{RED}Error: Permission denied when writing to {skipped_file}{RESET}")
        # Try writing to the user's home directory as a fallback
        home_skipped = os.path.join(os.path.expanduser("~"), skipped_filename)
        try:
            with open(home_skipped, "w", newline='', encoding='utf-8') as csvfile:
                fieldnames = list(skipped_items[0].keys())
                writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
                writer.writeheader()
                writer.writerows(skipped_items)
            skipped_file = home_skipped
            skipped_write_success = True
            print(f"{YELLOW}Wrote skipped items to home directory instead: {skipped_file}{RESET}")
        except Exception as e:
            print(f"{RED}Failed to write skipped items even to home directory: {e}{RESET}")
    except Exception as e:
        print(f"{RED}Error writing skipped items file: {e}{RESET}")

# Update the part number cache with new entries
if new_cache_entries and cache_dir_writable:
    try:
        # Read existing entries to keep them
        existing_entries = []
        if os.path.exists(part_cache_file):
            try:
                with open(part_cache_file, 'r', newline='', encoding='utf-8') as f:
                    reader = csv.reader(f)
                    existing_entries = list(reader)
            except UnicodeDecodeError:
                # Try alternate encodings
                for encoding in ['latin-1', 'cp1252', 'iso-8859-1']:
                    try:
                        with open(part_cache_file, 'r', newline='', encoding=encoding) as f:
                            reader = csv.reader(f)
                            existing_entries = list(reader)
                        break
                    except Exception:
                        continue
                
        # Create unique entries based on Value|Footprint
        cache_dict = {}
        for entry in existing_entries:
            if len(entry) >= 3:
                key = f"{entry[0]}|{entry[1]}"
                cache_dict[key] = entry
                
        # Add new entries
        for entry in new_cache_entries:
            key = f"{entry[0]}|{entry[1]}"
            cache_dict[key] = entry
        
        # Create backup of cache file if it exists
        if os.path.exists(part_cache_file) and not args.force:
            create_backup(part_cache_file)
            
        # Write back all entries
        with open(part_cache_file, 'w', newline='', encoding='utf-8') as f:
            writer = csv.writer(f)
            writer.writerows(cache_dict.values())
            
        print(f"{GREEN}Updated part number cache with {len(new_cache_entries)} new entries{RESET}")
    except Exception as e:
        print(f"{YELLOW}Warning: Could not update part cache: {e}{RESET}")

# Print output summary
if output_write_success:
    print(f"{GREEN}\nConversion complete! Summary:{RESET}")
    print(f"  - Processed: {len(processed_items)} parts")
    print(f"  - Skipped: {len(skipped_items)} parts")
    print(f"  - Output file: {output_file}")
    print(f"  - Skipped parts file: {skipped_file if skipped_write_success else 'Failed to write'}")
    print(f"  - Part cache: {part_cache_file if cache_dir_writable else 'Not updated (no write permission)'}")

    # Print detailed output preview (limited to first 10 rows)
    if len(output_data) > 1:
        print(f"\n{GREEN}Preview of output data:{RESET}")
        for i, line in enumerate(output_data):
            if i == 0 or i <= 5:  # Header + 5 rows
                print(", ".join(line))
            if i == 6 and len(output_data) > 7:
                print("...")
        if len(output_data) > 6:
            print(", ".join(output_data[-1]))  # Show last line

    # Print skipped items detailed summary (limited)
    if skipped_items and skipped_write_success:
        print(f"\n{YELLOW}Skipped Parts Summary:{RESET}")
        print(f"Detailed information saved to '{skipped_file}'")
        
        # Show only first 3 skipped items in detail
        for i, item in enumerate(skipped_items[:3], 1):
            print(f"\n{RED}Skipped Item #{i}/{len(skipped_items)}:{RESET}")
            for key, value in item.items():
                print(f"  - {key}: {value}")
        
        if len(skipped_items) > 3:
            print(f"\n{YELLOW}...and {len(skipped_items)-3} more skipped items{RESET}")
else:
    print(f"{RED}\nConversion failed to write output files!{RESET}")
