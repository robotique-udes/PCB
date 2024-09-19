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
* 

## PGIO
### Outputs

Name         | GPIO
---          | ---
CAM_SIGN_0   | D18
CAM_SIGN_1   | D19
CAM_SIGN_2   | D33
CAM_SIGN_3   | D32
PWM_0        | D21
PWM_1        | D22
ACC1_CONTROL | D23
ACC2_CONTROL | D25
LED_R        | D14
LED_G        | D27
LED_B        | D26

### Communication

Name    | GPIO
---     | ---
TXC    | D6
RXC    | D7
