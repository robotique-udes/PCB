# Antenna
PCB servant de module de centrale inertielle et de boussole

Voici les informations concernant le PCB : Compass

## Image du PCB en 3D
<img width="474" alt="Capture d’écran, le 2024-09-25 à 21 09 17" src="https://github.com/user-attachments/assets/11f9964e-abfc-49df-a130-7a63496b20d6">




## Objectifs:
* Permettre au Rover d'avoir des information sur sa position et son orientation dans l'espace
  


## Composants principaux:
* ESP32-S3-WROOM-1
* TJA1050T (CAN BUS)
* WT901 (compass)
* Ports Ethernets
* AZ1117ID-3.3 (LDO)
* TVS diodes

## Fonctionnement:
Le MCU peut lire les données de la centrale inertielle et boussole par UART.
Le MCU peut transmettre les informations du senseur par le CAN bus.
Le CAN bus peut passer à travers le circuit, donc un autre circuit peut être branché à la suite de celui-ci.

## PGIO
### Outputs

Name         | GPIO
---          | ---
LED_BUILDIN  | D2
STEPPIN      | D37
DIRPIN       | D38
ENABLEPIN    | D39

### Communication

Name    | GPIO
---     | ---
USBN    | D19
USBP    | D20
SCL     | D21
SDA     | D09
TX_WT   | D13
RX_WT   | D12
TXC     | D48
RXC     | D47
