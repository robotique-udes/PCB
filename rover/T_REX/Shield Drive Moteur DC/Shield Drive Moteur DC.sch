EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 1_My_Lib_ER:TJA1050 U2
U 1 1 65FE1549
P 6450 1700
F 0 "U2" H 6250 2150 50  0000 C CNN
F 1 "TJA1050" H 6700 2150 50  0000 C CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 6200 2100 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/nxp-usa-inc/TJA1050T-CM-118/4020551" H 6200 2100 50  0001 C CNN
	1    6450 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR022
U 1 1 65FE2708
P 6450 950
F 0 "#PWR022" H 6450 800 50  0001 C CNN
F 1 "+5V" H 6465 1123 50  0000 C CNN
F 2 "" H 6450 950 50  0001 C CNN
F 3 "" H 6450 950 50  0001 C CNN
	1    6450 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR023
U 1 1 65FE2EB3
P 6450 2350
F 0 "#PWR023" H 6450 2100 50  0001 C CNN
F 1 "GND" H 6455 2177 50  0000 C CNN
F 2 "" H 6450 2350 50  0001 C CNN
F 3 "" H 6450 2350 50  0001 C CNN
	1    6450 2350
	1    0    0    -1  
$EndComp
NoConn ~ 6800 1800
Wire Wire Line
	6450 1050 6450 950 
Connection ~ 6450 1050
Wire Wire Line
	6450 1050 6450 1250
Wire Wire Line
	6450 2150 6450 2250
Wire Wire Line
	7000 2250 6450 2250
Connection ~ 6450 2250
Wire Wire Line
	6450 2250 6450 2350
Wire Wire Line
	6800 1600 6900 1600
Wire Wire Line
	6900 1600 6900 1450
Wire Wire Line
	6800 1700 6900 1700
Wire Wire Line
	6900 1700 6900 1850
$Comp
L power:GND #PWR019
U 1 1 65FE9D94
P 5750 1150
F 0 "#PWR019" H 5750 900 50  0001 C CNN
F 1 "GND" H 5755 977 50  0000 C CNN
F 2 "" H 5750 1150 50  0001 C CNN
F 3 "" H 5750 1150 50  0001 C CNN
	1    5750 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 1050 5750 1150
Wire Wire Line
	6100 1800 6050 1800
Wire Wire Line
	6050 1800 6050 2250
Wire Wire Line
	6050 2250 6450 2250
Text Notes 6200 700  0    79   ~ 16
CAN BUS
Text GLabel 1100 1200 2    39   Input ~ 8
SCLK
Text GLabel 1100 1300 2    39   Input ~ 8
MOSI
Text GLabel 1100 1500 2    39   Input ~ 8
MISO
$Comp
L Connector:Conn_01x06_Male J1
U 1 1 65FF0583
P 750 1300
F 0 "J1" H 858 1681 50  0000 C CNN
F 1 "Conn_01x06_Male" H 858 1590 50  0000 C CNN
F 2 "1_My_Lib_FootPrint_ER:JST-6-Pos-Horizontal" H 750 1300 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/molex/0022232061/26675" H 750 1300 50  0001 C CNN
	1    750  1300
	1    0    0    -1  
$EndComp
Text GLabel 1100 1600 2    39   Input ~ 8
CS_1
Wire Wire Line
	950  1600 1100 1600
Wire Wire Line
	1100 1500 950  1500
Wire Wire Line
	1100 1300 950  1300
Wire Wire Line
	950  1200 1100 1200
$Comp
L power:GND #PWR06
U 1 1 65FF2AD3
P 1400 1500
F 0 "#PWR06" H 1400 1250 50  0001 C CNN
F 1 "GND" H 1405 1327 50  0000 C CNN
F 2 "" H 1400 1500 50  0001 C CNN
F 3 "" H 1400 1500 50  0001 C CNN
	1    1400 1500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 65FF302F
P 1400 1000
F 0 "#PWR05" H 1400 850 50  0001 C CNN
F 1 "+5V" H 1415 1173 50  0000 C CNN
F 2 "" H 1400 1000 50  0001 C CNN
F 3 "" H 1400 1000 50  0001 C CNN
	1    1400 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 1000 1400 1100
Wire Wire Line
	1400 1100 950  1100
Wire Wire Line
	1400 1500 1400 1400
Wire Wire Line
	1400 1400 950  1400
$Comp
L 1_My_Lib_ER:ESP32_DEV_KIT_V1 U1
U 1 1 65FF92ED
P 4600 2150
F 0 "U1" H 4850 3200 39  0000 C CNN
F 1 "ESP32_DEV_KIT_V1" H 4150 3200 39  0000 C CNN
F 2 "1_My_Lib_FootPrint_ER:MODULE_DEVKIT_V1_ESP32-WROOM-32" H 5150 3150 39  0001 C CNN
F 3 "" H 5150 3150 39  0001 C CNN
	1    4600 2150
	1    0    0    -1  
$EndComp
Text Notes 600  700  0    79   ~ 16
Encodeur AMT222
Text GLabel 2150 2850 2    39   Input ~ 8
SDA
Text GLabel 2800 2700 2    39   Input ~ 8
SCL
Wire Wire Line
	5200 2250 5050 2250
Wire Wire Line
	5200 2350 5050 2350
Wire Wire Line
	6100 1600 6000 1600
Wire Wire Line
	6000 1700 6100 1700
Text GLabel 5200 1650 2    39   Input ~ 8
SCLK
Text GLabel 5200 1450 2    39   Input ~ 8
MOSI
Text GLabel 5200 1550 2    39   Input ~ 8
MISO
Text GLabel 5200 1750 2    39   Input ~ 8
CS_1
Text GLabel 5200 1950 2    39   Input ~ 8
SDA
Text GLabel 5200 1850 2    39   Input ~ 8
SCL
Wire Wire Line
	5050 1450 5200 1450
Wire Wire Line
	5050 1550 5200 1550
Wire Wire Line
	5050 1650 5200 1650
Wire Wire Line
	5050 1750 5200 1750
Wire Wire Line
	5050 1850 5200 1850
Wire Wire Line
	5050 1950 5200 1950
Text GLabel 2200 3900 2    39   Input ~ 8
INTERRUPT_A
Text GLabel 2850 3750 2    39   Input ~ 8
INTERRUPT_B
Text GLabel 4000 2550 0    39   Input ~ 8
INTERRUPT_A
Text GLabel 4000 2650 0    39   Input ~ 8
INTERRUPT_B
Wire Wire Line
	4000 1550 4150 1550
Wire Wire Line
	4150 1650 4000 1650
Wire Wire Line
	4000 1750 4150 1750
Wire Wire Line
	4150 2550 4000 2550
Wire Wire Line
	4000 2650 4150 2650
$Comp
L Connector:Conn_01x02_Male J8
U 1 1 66085B38
P 3850 5000
F 0 "J8" H 3958 5181 50  0000 C CNN
F 1 "Conn_01x02_Male" H 3958 5090 50  0000 C CNN
F 2 "1_My_Lib_FootPrint_ER:AMASS_XT60PW-M" H 3850 5000 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/sparkfun-electronics/PRT-10474/8258064" H 3850 5000 50  0001 C CNN
	1    3850 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 5000 4300 5000
Wire Wire Line
	4050 5100 4400 5100
Wire Wire Line
	4300 5000 4300 5400
Wire Wire Line
	4300 5400 4050 5400
Connection ~ 4300 5000
Wire Wire Line
	4300 5000 4050 5000
Wire Wire Line
	4400 5500 4400 5100
Connection ~ 4400 5100
Wire Wire Line
	4400 5100 5050 5100
Text Label 4300 5000 0    39   ~ 8
Power+
Text Label 4400 5100 0    39   ~ 8
Power-
Text GLabel 7150 1450 2    39   Input ~ 8
CAN_H
Text GLabel 7150 1850 2    39   Input ~ 8
CAN_L
$Comp
L power:GND #PWR026
U 1 1 660B2903
P 10450 6000
F 0 "#PWR026" H 10450 5750 50  0001 C CNN
F 1 "GND" H 10455 5827 50  0000 C CNN
F 2 "" H 10450 6000 50  0001 C CNN
F 3 "" H 10450 6000 50  0001 C CNN
	1    10450 6000
	1    0    0    -1  
$EndComp
Text GLabel 10450 5800 2    39   Input ~ 8
PWM_Moteur
Wire Wire Line
	10450 5800 10150 5800
Wire Wire Line
	10150 5900 10450 5900
Wire Wire Line
	10450 5900 10450 6000
Text GLabel 4000 2250 0    39   Input ~ 8
PWM_Moteur
Wire Wire Line
	4000 2150 4150 2150
$Comp
L power:GND #PWR025
U 1 1 660E9252
P 6950 5850
F 0 "#PWR025" H 6950 5600 50  0001 C CNN
F 1 "GND" H 6955 5677 50  0000 C CNN
F 2 "" H 6950 5850 50  0001 C CNN
F 3 "" H 6950 5850 50  0001 C CNN
	1    6950 5850
	1    0    0    -1  
$EndComp
Text GLabel 7750 4500 1    39   Input ~ 8
CAN_H
Text GLabel 7650 4500 1    39   Input ~ 8
CAN_L
$Comp
L Device:C_Small C1
U 1 1 661389A0
P 6000 1050
F 0 "C1" V 6229 1050 50  0000 C CNN
F 1 "0.1uF" V 6138 1050 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 6000 1050 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/yageo/CC0603ZRY5V9BB104/2103081" H 6000 1050 50  0001 C CNN
	1    6000 1050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5750 1050 5900 1050
Wire Wire Line
	6100 1050 6450 1050
$Comp
L Device:C_Small C2
U 1 1 6614C71B
P 6100 3950
F 0 "C2" H 6008 3996 50  0000 R CNN
F 1 "10nF" H 6008 3905 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 6100 3950 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/yageo/CC0603KRX7R9BB103/302819" H 6100 3950 50  0001 C CNN
	1    6100 3950
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR021
U 1 1 6615A7C3
P 6100 4200
F 0 "#PWR021" H 6100 3950 50  0001 C CNN
F 1 "GND" H 6105 4027 50  0000 C CNN
F 2 "" H 6100 4200 50  0001 C CNN
F 3 "" H 6100 4200 50  0001 C CNN
	1    6100 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR024
U 1 1 66161744
P 6450 4200
F 0 "#PWR024" H 6450 3950 50  0001 C CNN
F 1 "GND" H 6455 4027 50  0000 C CNN
F 2 "" H 6450 4200 50  0001 C CNN
F 3 "" H 6450 4200 50  0001 C CNN
	1    6450 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 4200 6100 4050
Wire Wire Line
	6450 4200 6450 4050
Wire Wire Line
	6100 3850 6100 3750
Wire Wire Line
	6450 3750 6450 3850
$Comp
L power:+5V #PWR020
U 1 1 661817CC
P 6000 3650
F 0 "#PWR020" H 6000 3500 50  0001 C CNN
F 1 "+5V" H 6015 3823 50  0000 C CNN
F 2 "" H 6000 3650 50  0001 C CNN
F 3 "" H 6000 3650 50  0001 C CNN
	1    6000 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 3650 6000 3750
Wire Wire Line
	6000 3750 6100 3750
Connection ~ 6100 3750
$Comp
L power:+5V #PWR015
U 1 1 66192A84
P 4500 1000
F 0 "#PWR015" H 4500 850 50  0001 C CNN
F 1 "+5V" H 4515 1173 50  0000 C CNN
F 2 "" H 4500 1000 50  0001 C CNN
F 3 "" H 4500 1000 50  0001 C CNN
	1    4500 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 66196A66
P 4600 3100
F 0 "#PWR016" H 4600 2850 50  0001 C CNN
F 1 "GND" H 4605 2927 50  0000 C CNN
F 2 "" H 4600 3100 50  0001 C CNN
F 3 "" H 4600 3100 50  0001 C CNN
	1    4600 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 2950 4500 3050
Wire Wire Line
	4600 3050 4600 3100
Wire Wire Line
	4600 3050 4700 3050
Wire Wire Line
	4700 3050 4700 2950
Connection ~ 4600 3050
Wire Wire Line
	4500 3050 4600 3050
Wire Wire Line
	4500 1000 4500 1100
$Comp
L Device:LED D1
U 1 1 661B3DFE
P 750 5250
F 0 "D1" V 697 5132 50  0000 R CNN
F 1 "LED" V 788 5132 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 750 5250 50  0001 C CNN
F 3 "https://www.we-online.com/components/products/datasheet/150080VS75000.pdf" H 750 5250 50  0001 C CNN
	1    750  5250
	0    -1   1    0   
$EndComp
$Comp
L Device:R_US R1
U 1 1 661BCEE5
P 750 4800
F 0 "R1" H 818 4846 50  0000 L CNN
F 1 "200" H 818 4755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 790 4790 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/yageo/AC0805FR-07200RL/5896662" H 750 4800 50  0001 C CNN
	1    750  4800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 661C22A8
P 750 4500
F 0 "#PWR01" H 750 4350 50  0001 C CNN
F 1 "+5V" H 765 4673 50  0000 C CNN
F 2 "" H 750 4500 50  0001 C CNN
F 3 "" H 750 4500 50  0001 C CNN
	1    750  4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	750  4500 750  4650
Wire Wire Line
	750  4950 750  5100
$Comp
L power:GND #PWR02
U 1 1 661D7BFE
P 750 5550
F 0 "#PWR02" H 750 5300 50  0001 C CNN
F 1 "GND" H 755 5377 50  0000 C CNN
F 2 "" H 750 5550 50  0001 C CNN
F 3 "" H 750 5550 50  0001 C CNN
	1    750  5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	750  5400 750  5550
$Comp
L Device:R_US R2
U 1 1 661E5D36
P 1100 4800
F 0 "R2" H 1168 4846 50  0000 L CNN
F 1 "100" H 1168 4755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1140 4790 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/yageo/RC0805FR-07100RL/727543" H 1100 4800 50  0001 C CNN
	1    1100 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R3
U 1 1 661EA4F4
P 1450 4800
F 0 "R3" H 1518 4846 50  0000 L CNN
F 1 "100" H 1518 4755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1490 4790 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/yageo/RC0805FR-07100RL/727543" H 1450 4800 50  0001 C CNN
	1    1450 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 661F3242
P 1100 5550
F 0 "#PWR04" H 1100 5300 50  0001 C CNN
F 1 "GND" H 1105 5377 50  0000 C CNN
F 2 "" H 1100 5550 50  0001 C CNN
F 3 "" H 1100 5550 50  0001 C CNN
	1    1100 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 5400 1100 5550
$Comp
L power:GND #PWR09
U 1 1 661F7845
P 1450 5550
F 0 "#PWR09" H 1450 5300 50  0001 C CNN
F 1 "GND" H 1455 5377 50  0000 C CNN
F 2 "" H 1450 5550 50  0001 C CNN
F 3 "" H 1450 5550 50  0001 C CNN
	1    1450 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 5400 1450 5550
Wire Wire Line
	1100 4950 1100 5100
Wire Wire Line
	1450 4950 1450 5100
Text GLabel 1100 4550 1    39   Input ~ 8
LED_1
Text GLabel 1450 4550 1    39   Input ~ 8
LED_2
Wire Wire Line
	1100 4550 1100 4650
Wire Wire Line
	1450 4550 1450 4650
Text GLabel 4000 1950 0    39   Input ~ 8
LED_1
Text GLabel 4000 2050 0    39   Input ~ 8
LED_2
Wire Wire Line
	4000 2050 4150 2050
Wire Wire Line
	4150 1950 4000 1950
Text Notes 800  4150 0    79   ~ 16
Indicateurs LED
$Comp
L Device:LED D2
U 1 1 66261F83
P 1100 5250
F 0 "D2" V 1047 5132 50  0000 R CNN
F 1 "LED" V 1138 5132 50  0000 R CNN
F 2 "1_My_Lib_FootPrint_ER:LED_0805_HandSolder" H 1100 5250 50  0001 C CNN
F 3 "https://www.we-online.com/components/products/datasheet/150080VS75000.pdf" H 1100 5250 50  0001 C CNN
	1    1100 5250
	0    -1   1    0   
$EndComp
$Comp
L Device:LED D3
U 1 1 66267366
P 1450 5250
F 0 "D3" V 1397 5132 50  0000 R CNN
F 1 "LED" V 1488 5132 50  0000 R CNN
F 2 "1_My_Lib_FootPrint_ER:LED_0805_HandSolder" H 1450 5250 50  0001 C CNN
F 3 "https://www.we-online.com/components/products/datasheet/150080VS75000.pdf" H 1450 5250 50  0001 C CNN
	1    1450 5250
	0    -1   1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Male J12
U 1 1 662981B3
P 9950 5800
F 0 "J12" H 10058 5981 50  0000 C CNN
F 1 "Conn_01x02_Male" H 10058 5890 50  0000 C CNN
F 2 "Connector_JST:JST_EH_B2B-EH-A_1x02_P2.50mm_Vertical" H 9950 5800 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/molex/0022272021/1130577" H 9950 5800 50  0001 C CNN
	1    9950 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 662C1BB2
P 6450 3950
F 0 "C3" V 6679 3950 50  0000 C CNN
F 1 "0.1uF" V 6588 3950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 6450 3950 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/yageo/CC0603ZRY5V9BB104/2103081" H 6450 3950 50  0001 C CNN
	1    6450 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse F1
U 1 1 662C7606
P 3900 5400
F 0 "F1" V 3703 5400 50  0000 C CNN
F 1 "Fuse" V 3794 5400 50  0000 C CNN
F 2 "1_My_Lib_FootPrint_ER:FUSE_3555-2" V 3830 5400 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/keystone-electronics/3555-2/2137311" H 3900 5400 50  0001 C CNN
	1    3900 5400
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 5400 3650 5400
Wire Wire Line
	3650 5500 4400 5500
Connection ~ 6450 3750
Wire Wire Line
	6450 3750 6800 3750
Wire Wire Line
	6100 3750 6450 3750
Text Notes 4400 750  0    79   ~ 16
ESP32
Text GLabel 2800 2600 2    39   Input ~ 8
MOSI
Text GLabel 2200 3800 2    39   Input ~ 8
MISO
$Comp
L Connector:Conn_01x06_Male J2
U 1 1 6601439D
P 750 2600
F 0 "J2" H 858 2981 50  0000 C CNN
F 1 "Conn_01x06_Male" H 858 2890 50  0000 C CNN
F 2 "1_My_Lib_FootPrint_ER:JST-6-Pos-Horizontal" H 750 2600 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/molex/0022232061/26675" H 750 2600 50  0001 C CNN
	1    750  2600
	1    0    0    -1  
$EndComp
Text GLabel 2850 3650 2    39   Input ~ 8
CS_2
Wire Wire Line
	950  2900 1100 2900
$Comp
L power:GND #PWR08
U 1 1 660143A8
P 1400 2800
F 0 "#PWR08" H 1400 2550 50  0001 C CNN
F 1 "GND" H 1405 2627 50  0000 C CNN
F 2 "" H 1400 2800 50  0001 C CNN
F 3 "" H 1400 2800 50  0001 C CNN
	1    1400 2800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 660143AE
P 1400 2300
F 0 "#PWR07" H 1400 2150 50  0001 C CNN
F 1 "+5V" H 1415 2473 50  0000 C CNN
F 2 "" H 1400 2300 50  0001 C CNN
F 3 "" H 1400 2300 50  0001 C CNN
	1    1400 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 2300 1400 2400
Wire Wire Line
	1400 2400 950  2400
Wire Wire Line
	1400 2700 950  2700
Text GLabel 5200 2450 2    39   Input ~ 8
CS_2
Wire Wire Line
	5050 2450 5200 2450
Wire Wire Line
	1400 2700 1400 2800
$Comp
L Connector:Conn_01x03_Male J3
U 1 1 6605B86A
P 1900 2150
F 0 "J3" V 1962 2294 50  0000 L CNN
F 1 "Select_3_pads" V 1850 1850 50  0000 L CNN
F 2 "1_My_Lib_FootPrint_ER:Select_3_pads" H 1900 2150 50  0001 C CNN
F 3 "~" H 1900 2150 50  0001 C CNN
	1    1900 2150
	0    1    1    0   
$EndComp
Text GLabel 2150 2750 2    39   Input ~ 8
SCLK
Wire Wire Line
	1900 2350 1900 2500
Wire Wire Line
	950  2500 1900 2500
Wire Wire Line
	1800 2850 2150 2850
Wire Wire Line
	2150 2750 2000 2750
Wire Wire Line
	1800 2350 1800 2850
Wire Wire Line
	2000 2350 2000 2750
Wire Wire Line
	2600 2600 2600 2350
Wire Wire Line
	950  2600 2600 2600
Wire Wire Line
	2800 2600 2700 2600
Wire Wire Line
	2800 2700 2500 2700
Wire Wire Line
	2500 2700 2500 2350
Wire Wire Line
	2000 3800 2200 3800
Wire Wire Line
	2700 3400 2700 3650
Wire Wire Line
	2700 3650 2850 3650
Wire Wire Line
	950  2800 1200 2800
Wire Wire Line
	1900 3400 1900 3600
Wire Wire Line
	1900 3600 1200 3600
Wire Wire Line
	1200 2800 1200 3600
Wire Wire Line
	2600 3400 2600 3700
Wire Wire Line
	2600 3700 1100 3700
Wire Wire Line
	1100 2900 1100 3700
Wire Wire Line
	2000 3400 2000 3800
Wire Wire Line
	2200 3900 1800 3900
Wire Wire Line
	1800 3400 1800 3900
Wire Wire Line
	2850 3750 2500 3750
Wire Wire Line
	2500 3750 2500 3400
Text Notes 650  2000 0    79   ~ 16
Autre encodeur\nSPI, I2C, 2 Interrupts
$Comp
L Device:R_US R5
U 1 1 66186E7C
P 1850 4800
F 0 "R5" H 1918 4846 50  0000 L CNN
F 1 "100" H 1918 4755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1890 4790 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/yageo/RC0805FR-07100RL/727543" H 1850 4800 50  0001 C CNN
	1    1850 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 66186E88
P 1850 5550
F 0 "#PWR011" H 1850 5300 50  0001 C CNN
F 1 "GND" H 1855 5377 50  0000 C CNN
F 2 "" H 1850 5550 50  0001 C CNN
F 3 "" H 1850 5550 50  0001 C CNN
	1    1850 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 5400 1850 5550
Wire Wire Line
	1850 4950 1850 5100
Text GLabel 1850 4550 1    39   Input ~ 8
LED_3
Wire Wire Line
	1850 4550 1850 4650
$Comp
L Device:LED D4
U 1 1 66186E9C
P 1850 5250
F 0 "D4" V 1797 5132 50  0000 R CNN
F 1 "LED" V 1888 5132 50  0000 R CNN
F 2 "1_My_Lib_FootPrint_ER:LED_0805_HandSolder" H 1850 5250 50  0001 C CNN
F 3 "https://www.we-online.com/components/products/datasheet/150080VS75000.pdf" H 1850 5250 50  0001 C CNN
	1    1850 5250
	0    -1   1    0   
$EndComp
Text GLabel 4000 2150 0    39   Input ~ 8
LED_3
Wire Wire Line
	4000 2250 4150 2250
Text Notes 9950 5350 0    79   ~ 16
Commande moteur
$Comp
L Connector:Conn_01x02_Male J7
U 1 1 66231F5E
P 3450 5400
F 0 "J7" H 3558 5581 50  0000 C CNN
F 1 "Conn_01x02_Male" H 3600 5200 50  0000 C CNN
F 2 "1_My_Lib_FootPrint_ER:AMASS_XT60PW-M" H 3450 5400 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/sparkfun-electronics/PRT-10474/8258064" H 3450 5400 50  0001 C CNN
	1    3450 5400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J9
U 1 1 66239CFB
P 5250 5000
F 0 "J9" H 5358 5181 50  0000 C CNN
F 1 "Conn_01x02_Male" H 5358 5090 50  0000 C CNN
F 2 "1_My_Lib_FootPrint_ER:AMASS_XT60PW-M" H 5250 5000 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/sparkfun-electronics/PRT-10474/8258064" H 5250 5000 50  0001 C CNN
	1    5250 5000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2700 2600 2700 2350
Wire Wire Line
	6850 5450 7650 5450
Wire Wire Line
	6850 5350 7900 5350
Wire Wire Line
	6850 5250 7900 5250
Wire Wire Line
	7750 4500 7750 5550
Wire Wire Line
	6850 5550 7750 5550
Connection ~ 7750 5550
Wire Wire Line
	7750 5550 7900 5550
Wire Wire Line
	7650 4500 7650 5450
Wire Wire Line
	6850 5150 7900 5150
Wire Wire Line
	6850 4950 7250 4950
Wire Wire Line
	6850 5050 7900 5050
Wire Wire Line
	7900 4850 6950 4850
Connection ~ 7650 5450
Wire Wire Line
	7650 5450 7900 5450
Wire Wire Line
	6950 5850 6950 4850
Connection ~ 6950 4850
Wire Wire Line
	6950 4850 6850 4850
Connection ~ 7250 4950
Wire Wire Line
	7250 4950 7900 4950
Text Notes 4050 4700 0    79   ~ 16
Alimentation moteur
$Comp
L Device:Thermistor_PTC_US TH1
U 1 1 6633304B
P 6950 3750
F 0 "TH1" V 6660 3750 50  0000 C CNN
F 1 "Thermistor_PTC_US" V 6751 3750 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" H 7000 3550 50  0001 L CNN
F 3 "https://www.digikey.ca/en/products/detail/bel-fuse-inc/0ZCJ0035AF2E/4156132" H 6950 3750 50  0001 C CNN
	1    6950 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	7250 3750 7100 3750
Wire Wire Line
	7250 3750 7250 4950
Text Notes 6600 3400 0    50   ~ 0
PTC\nCurrent hold : 350 mA\nCurrent trip  : 750 mA
$Comp
L Connector:RJ45 J10
U 1 1 6635BFCD
P 6450 5250
F 0 "J10" H 6120 5346 50  0000 R CNN
F 1 "RJ45" H 6120 5255 50  0000 R CNN
F 2 "Connector_RJ:RJ45_Amphenol_54602-x08_Horizontal" V 6450 5275 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/amphenol-cs-fci/54601-908WPLF/1488544" V 6450 5275 50  0001 C CNN
	1    6450 5250
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 663687AF
P 1250 7150
F 0 "SW1" H 1250 7435 50  0000 C CNN
F 1 "SW_Push" H 1250 7344 50  0000 C CNN
F 2 "1_My_Lib_FootPrint_ER:SW_TS09-63-25-WT-160-SMT-TR" H 1250 7350 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/cui-devices/TS09-63-25-WT-160-SMT-TR/15839066" H 1250 7350 50  0001 C CNN
	1    1250 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R4
U 1 1 663695E6
P 1550 6900
F 0 "R4" H 1618 6946 50  0000 L CNN
F 1 "10k" H 1618 6855 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 1590 6890 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/yageo/RC0603FR-0710KL/726880" H 1550 6900 50  0001 C CNN
	1    1550 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 66378C1A
P 950 7250
F 0 "#PWR03" H 950 7000 50  0001 C CNN
F 1 "GND" H 955 7077 50  0000 C CNN
F 2 "" H 950 7250 50  0001 C CNN
F 3 "" H 950 7250 50  0001 C CNN
	1    950  7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  7250 950  7150
Wire Wire Line
	950  7150 1050 7150
Wire Wire Line
	1450 7150 1550 7150
Wire Wire Line
	1550 7150 1550 7050
Wire Wire Line
	1550 6750 1550 6600
Text GLabel 1800 7150 2    50   Input ~ 0
BTN_1
Wire Wire Line
	1800 7150 1550 7150
Connection ~ 1550 7150
$Comp
L Switch:SW_Push SW2
U 1 1 663B29CB
P 2550 7150
F 0 "SW2" H 2550 7435 50  0000 C CNN
F 1 "SW_Push" H 2550 7344 50  0000 C CNN
F 2 "1_My_Lib_FootPrint_ER:SW_TS09-63-25-WT-160-SMT-TR" H 2550 7350 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/cui-devices/TS09-63-25-WT-160-SMT-TR/15839066" H 2550 7350 50  0001 C CNN
	1    2550 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R6
U 1 1 663B29D1
P 2850 6900
F 0 "R6" H 2918 6946 50  0000 L CNN
F 1 "10k" H 2918 6855 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 2890 6890 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/yageo/RC0603FR-0710KL/726880" H 2850 6900 50  0001 C CNN
	1    2850 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 663B29D7
P 2250 7250
F 0 "#PWR012" H 2250 7000 50  0001 C CNN
F 1 "GND" H 2255 7077 50  0000 C CNN
F 2 "" H 2250 7250 50  0001 C CNN
F 3 "" H 2250 7250 50  0001 C CNN
	1    2250 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 7250 2250 7150
Wire Wire Line
	2250 7150 2350 7150
Wire Wire Line
	2750 7150 2850 7150
Wire Wire Line
	2850 7150 2850 7050
Wire Wire Line
	2850 6750 2850 6600
Text GLabel 3100 7150 2    50   Input ~ 0
BTN_2
Wire Wire Line
	3100 7150 2850 7150
Connection ~ 2850 7150
Text Notes 1850 6300 0    79   ~ 16
Boutons
Text GLabel 4000 1750 0    50   Input ~ 0
BTN_1
Text GLabel 4000 1650 0    50   Input ~ 0
BTN_2
Text GLabel 6000 1600 0    39   Input ~ 8
RXD2
Text GLabel 6000 1700 0    39   Input ~ 8
TXD2
Text GLabel 5200 2350 2    39   Input ~ 8
RXD2
Text GLabel 5200 2250 2    39   Input ~ 8
TXD2
$Comp
L Connector:RJ45 J11
U 1 1 6603368F
P 8300 5250
F 0 "J11" H 7970 5346 50  0000 R CNN
F 1 "RJ45" H 7970 5255 50  0000 R CNN
F 2 "Connector_RJ:RJ45_Amphenol_54602-x08_Horizontal" V 8300 5275 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/amphenol-cs-fci/54601-908WPLF/1488544" V 8300 5275 50  0001 C CNN
	1    8300 5250
	-1   0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR018
U 1 1 66098F5D
P 4700 1000
F 0 "#PWR018" H 4700 850 50  0001 C CNN
F 1 "+3.3V" H 4715 1173 50  0000 C CNN
F 2 "" H 4700 1000 50  0001 C CNN
F 3 "" H 4700 1000 50  0001 C CNN
	1    4700 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 1000 4700 1100
$Comp
L power:+3.3V #PWR010
U 1 1 660E1CD2
P 1550 6600
F 0 "#PWR010" H 1550 6450 50  0001 C CNN
F 1 "+3.3V" H 1565 6773 50  0000 C CNN
F 2 "" H 1550 6600 50  0001 C CNN
F 3 "" H 1550 6600 50  0001 C CNN
	1    1550 6600
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR013
U 1 1 660F3839
P 2850 6600
F 0 "#PWR013" H 2850 6450 50  0001 C CNN
F 1 "+3.3V" H 2865 6773 50  0000 C CNN
F 2 "" H 2850 6600 50  0001 C CNN
F 3 "" H 2850 6600 50  0001 C CNN
	1    2850 6600
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW3
U 1 1 66088EC8
P 4300 7150
F 0 "SW3" H 4300 7435 50  0000 C CNN
F 1 "SW_Push" H 4300 7344 50  0000 C CNN
F 2 "1_My_Lib_FootPrint_ER:SW_TS09-63-25-WT-160-SMT-TR" H 4300 7350 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/cui-devices/TS09-63-25-WT-160-SMT-TR/15839066" H 4300 7350 50  0001 C CNN
	1    4300 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R7
U 1 1 66088ECE
P 4600 6900
F 0 "R7" H 4668 6946 50  0000 L CNN
F 1 "10k" H 4668 6855 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 4640 6890 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/yageo/RC0603FR-0710KL/726880" H 4600 6900 50  0001 C CNN
	1    4600 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 66088ED4
P 4000 7250
F 0 "#PWR014" H 4000 7000 50  0001 C CNN
F 1 "GND" H 4005 7077 50  0000 C CNN
F 2 "" H 4000 7250 50  0001 C CNN
F 3 "" H 4000 7250 50  0001 C CNN
	1    4000 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 7250 4000 7150
Wire Wire Line
	4000 7150 4100 7150
Wire Wire Line
	4500 7150 4600 7150
Wire Wire Line
	4600 7150 4600 7050
Wire Wire Line
	4600 6750 4600 6600
Text GLabel 4850 7150 2    50   Input ~ 0
BTN_3
Wire Wire Line
	4850 7150 4600 7150
Connection ~ 4600 7150
$Comp
L power:+3.3V #PWR017
U 1 1 66088EE2
P 4600 6600
F 0 "#PWR017" H 4600 6450 50  0001 C CNN
F 1 "+3.3V" H 4615 6773 50  0000 C CNN
F 2 "" H 4600 6600 50  0001 C CNN
F 3 "" H 4600 6600 50  0001 C CNN
	1    4600 6600
	1    0    0    -1  
$EndComp
Text GLabel 4000 1550 0    50   Input ~ 0
BTN_3
$Comp
L Connector:Conn_01x03_Male J5
U 1 1 660C7B47
P 2600 2150
F 0 "J5" V 2662 2294 50  0000 L CNN
F 1 "Select_3_pads" V 2550 1850 50  0000 L CNN
F 2 "1_My_Lib_FootPrint_ER:Select_3_pads" H 2600 2150 50  0001 C CNN
F 3 "~" H 2600 2150 50  0001 C CNN
	1    2600 2150
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x03_Male J4
U 1 1 660CF5E9
P 1900 3200
F 0 "J4" V 1962 3344 50  0000 L CNN
F 1 "Select_3_pads" V 1850 2900 50  0000 L CNN
F 2 "1_My_Lib_FootPrint_ER:Select_3_pads" H 1900 3200 50  0001 C CNN
F 3 "~" H 1900 3200 50  0001 C CNN
	1    1900 3200
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x03_Male J6
U 1 1 660D7014
P 2600 3200
F 0 "J6" V 2662 3344 50  0000 L CNN
F 1 "Select_3_pads" V 2550 2900 50  0000 L CNN
F 2 "1_My_Lib_FootPrint_ER:Select_3_pads" H 2600 3200 50  0001 C CNN
F 3 "~" H 2600 3200 50  0001 C CNN
	1    2600 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	6900 1450 7150 1450
Wire Wire Line
	6900 1850 7150 1850
$EndSCHEMATC
