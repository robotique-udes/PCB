# SHIELD Drive Moteur DC
PCB QU'ON SUPPOSE QUI N'EST PAS UTILISÉ SUR LE ROVER

Voici les informations concernant le PCB : Shield Drive Moteur DC 

## Image du PCB en 3D

## Objectifs:
* Contrôler un moteur
* Laisser passer le courant pour connecter d'autres Drive en daisy chain
* Utiliser le protocole CAN bus pour lire et envoyer des informations au Main Board
* Gérer le courant qui passe dans le moteur à l'aide d'une thermistance qui limite le courant
* Sécuriser le moteur à l'aide d'un fusible


## Composants principaux:
* ESP32 DEV KIT V1
* TJA1050 CAN BUS
* Horizontal Amphenol 54602 RJ45
* DELs
* Boutons
* AMASS XT60PW-M Power connectors
* JST 6 pos Horizontal connector
* Thermistor PTC RDT


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

