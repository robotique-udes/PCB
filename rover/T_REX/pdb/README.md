# PDB (Power Distribution Board)
PCB servant à gérer la distribution de puissance électrique

Voici les informations concernant le PCB : PDB 

## Image du PCB en 3D
<img width="806" alt="Capture d’écran, le 2024-09-18 à 21 24 36" src="https://github.com/user-attachments/assets/1bbfc948-2faf-49ae-a5de-819917863088">

## Objectifs:
* Protéger tous les autres boards du Over/Under Voltage pour le 5V, 12V et 24V
* Agir en tant que POE pour les cameras branché en Ethernet
* Diriger le signal des cameras sur les bonnes pins selon la norme Ethernet
* Agir en tant que POE pour les antennes
* Alimenter des accessoires 12V par 2 connecteurs Ethernet en utilisant les pins 7 (12V) et 8 (GND)
* Permettre de pouvoir sortir une des 3 tension par un screw terminal
* Communiquer par le CAN BUS
* Sélectionner avec les GPIO les cameras qui doivent recevoir du power


## Composants principaux:
* ESP32 DEV KIT V1
* TJA1050 CAN BUS
* LTC4365 (Over/Under Voltage protaction)
* DMG4822SSD (proche du LTC4365)
* DELs
* CLP6C-FKB-CKNPRGJBB7A363 (ERROR DEL)
* Boutons
* Horizontal Amphenol 54602 RJ45
* AMASS XT60PW-M Power connectors
* ASSMANN_A-2014 Ethernet connector
* CRJ036-5-TH_2x4 Ethernet connector
* BTS5200 (4 Channel Mosfet)

## Fonctionnement:
* Le ESP32 recoit les commandes par CAN
* Le ESP32 envoit une commande PWM par un connecteur
* La thermistor permet de limiter le courant qui entre dans le circuit à partir du CAN BUS

## PGIO
### Inputs
Name        | GPIO
---         |  ---
BTN1        | D34
BTN2        | D39
BTN3        | D36
INTERRUPT_A | D36
INTERRUPT_A | D36

### Outputs

Name       | GPIO
---        | ---
PWM_Moteur | D26
LED_1      | D32
LED_2      | D33
LED_3      | D25

### Communication

Name    | GPIO
---     | ---
MOSI    | D23
MISO    | D19
SCLK    | D18
CS_1    | D5
CS_2    | D4
SCL     | D22
SDA     | D21
TXD2    | D17
RXD2    | D16
