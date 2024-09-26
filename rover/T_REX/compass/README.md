# Antenna
PCB servant de module de centrale inertielle et de boussole

Voici les informations concernant le PCB : Compass

## Image du PCB en 3D
<img width="682" alt="Capture d’écran, le 2024-09-25 à 20 08 11" src="https://github.com/user-attachments/assets/9aff4c2e-3dd0-4822-af0d-dab2a5f7f2c7">



## Objectifs:
* Permettre au Rover d'avoir des information sur sa position et son orientation dans l'espace
* 


## Composants principaux:
* ESP32-S3-WROOM-1
* TJA1050T (CAN BUS)
* WT901 (compass)
* Ports Ethernets
* AZ1117ID-3.3 (LDO)
* TVS diodes

## Fonctionnement:
Le circuit est alimenté en 24V qui est régulée par un AC-DC.
Une tension de 5V est régulée par un Buck converter à partir du 24V.
Une tension de 3V3 est régulée par un LDO utilisé à partir du 5V.
Les prises en bas, sont des prises qui sortent du boitier et qui servent à connecter tous les périphériques.
Les prises en haut permettent aux périphériques de se connecter dans une Switch Ethernet afin de les multiplexer et ainsi d'avoir seulemenet un câble qui doive aller vers la Base Station.
Un Driver de Stepper permet de faire tourner un moteur qui fait tourner l'antenne sur elle-même.
Les antennes ont besoin d'être alimentés à une tension de 24V, donc le circuit sert de POE pour un maximum de 2 antennes.

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
