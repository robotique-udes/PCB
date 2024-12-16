# Antenna
PCB servant à motoriser l'antenne de la Base Station

Voici les informations concernant le PCB : Antenna

## Image du PCB en 3D
<img width="1132" alt="Capture d’écran, le 2024-09-25 à 19 42 32" src="https://github.com/user-attachments/assets/f7d9e168-71af-4ca0-a494-73e6d41e3108">


## Objectifs:
* Alimenter les antennes de la Base Station
* Changer l'orientation des Antennes par commandes envoyés par Wi-Fi
* alimenter une caméra montée sur l'antenne
* Permettre la connections de tous les périphériques en utilisant seulement un câble Ethernet vers la Base Station (Switch Ethernet)


## Composants principaux:
* ESP32 DEV KIT V1
* 24V-5V DC-DC converter
* A4988 Stepper driver
* Ports Ethernets
* AMS1117-3.3 (LDO)
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
