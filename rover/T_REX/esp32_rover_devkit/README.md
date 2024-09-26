# Antenna
PCB servant de module GPS

Voici les informations concernant le PCB : Module GPS

## Image du PCB en 3D
<img width="474" alt="Capture d’écran, le 2024-09-25 à 21 09 17" src="https://github.com/user-attachments/assets/11f9964e-abfc-49df-a130-7a63496b20d6">




## Objectifs:
* Permettre au Rover d'avoir des information sur sa position GPS
  


## Composants principaux:
* ESP32-S3-WROOM-1
* TJA1050T (CAN BUS)
* BN-880 (GPS)
* Ports Ethernets
* AZ1117ID-3.3 (LDO)
* TVS diodes

## Fonctionnement:
Le MCU peut lire les données du GPS.
Le MCU peut transmettre les informations du GPS par le CAN bus.
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
TX_GPS  s| D13
RX_GPS  | D12
TXC     | D48
RXC     | D47
