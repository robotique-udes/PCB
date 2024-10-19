# PDB (Power Distribution Board)
PCB servant à gérer la distribution à bas courant et le de data du rover

## Image du PCB en 3D
<img width="806" alt="Capture d’écran, le 2024-09-18 à 21 24 36" src="https://github.com/user-attachments/assets/1bbfc948-2faf-49ae-a5de-819917863088">

## Objectifs:
* Protéger tous les autres boards du Over/Under Voltage pour le 5V, 12V et 24V
  * Seulement le 5v et le 24v sont protégé, car les résistance 5% ont trop  d'incertitude.
* Injecteur POE(12V custom pinout) pour les cameras branché en Ethernet
  * On/Off possible par le MCU
* Diriger le signal des cameras sur les bonnes pins selon la norme Ethernet
* Agir en tant que POE pour les antennes 24V (vrai POE)
* Controller l'alimentation de 2 circuit d'accessoires 12V 
  * Par 2 connecteurs Ethernet
* Permettre de pouvoir sortir une des 3 tension (5v, 12v, 24v) par un screw terminal
  * Alimente la switch ethernet en dessous
* MCU Connecté sur le CAN BUS
* Sélectionner avec les GPIO les cameras qui doivent recevoir du power


## Composants principaux:
* ESP32 DEV KIT V1
* TJA1050 (CAN BUS)
* LTC4365 (Over/Under Voltage protaction)
* DMG4822SSD (DIODE pour la switch du LTC4365)
* DELs
* CLP6C-FKB-CKNPRGJBB7A363 (ERROR DEL)
* Boutons
* Horizontal Amphenol 54602 RJ45
* ASSMANN_A-2014 Ethernet connector
* CRJ036-5-TH_2x4 Ethernet connector
* BTS5200 (4 Channel Mosfet)

## Fonctionnement:
- Le PDB reçoit 3 tensions régulé en entrée, du 5V, du 12V et du 24V.
- Le 12V sert principalement pour alimenter les caméras qui sont alimentés avec un POE avec un Pinout spécial. Il sert aussi à alimenter 2 circuit d'accessoires potentiels.
- Le 24V sert à alimenter le/les antennes qui sont sur le Rover.
- Le 5V est passé avec les fils de CanBus pour alimenter et communiquer avec les autres PCB du rover
- Le circuit sécurise les trois tensions contre les sur-tensions et le drops de tensions.
- La sortie vers l'ordinateur principal n'est pas utilisé, l'ordinateur est directement branché dans la switch.

## PGIO
### Outputs

| Name         | GPIO |
|--------------|------|
| CAM_SIGN_0   | D18  |
| CAM_SIGN_1   | D19  |
| CAM_SIGN_2   | D33  |
| CAM_SIGN_3   | D32  |
| PWM_0        | D21  |
| PWM_1        | D22  |
| ACC1_CONTROL | D23  |
| ACC2_CONTROL | D25  |
| LED_R        | D14  |
| LED_G        | D27  |
| LED_B        | D26  |

### Communication

| Name | GPIO |
|------|------|
| TXC  | D6   |
| RXC  | D7   |
