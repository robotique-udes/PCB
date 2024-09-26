# Terminaison CAN bus
Petit PCB qui sert de terminaison aux extrémités du CAN bus.

Voici les informations concernant le PCB : terminaison_can

## Image du PCB en 3D
<img width="1132" alt="Capture d’écran, le 2024-09-25 à 19 42 32" src="https://github.com/user-attachments/assets/1a5d2ab4-045d-48e1-a774-91f14ac8250a">


## Objectifs:
* Nettoyer le signal CAN bus en s'assurant que les signaux envoyés sur le bus sont dissipés et non reflétés.
* Agir comme un indicateur visuel de s'il y a du courant ou non dans le bus.


## Composants principaux:
* Connecteur RJ45 pour câble ethernet
* 2x Résistances 60 ohms
* Condensateur 47nF

## Fonctionnement:
Le circuit connecte le CAN HIGH au CAN LOW à travers 

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
