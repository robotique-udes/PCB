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
* Résistance 2k ohms
* DEL

## Fonctionnement:
Deux résistances de 60 ohms sont placées en série entre le CAN HIGH et le CAN LOW en une résistance combinée de 120 ohms, ce qui est le standard dans une terminaison CAN. La résistance permet de dissiper le signal passant dans le bus.

Le condensateur permet de créer un filtre passe-bas qui nettoie encore plus le signal.

Il y a aussi une résistance et une diode qui sont connectées entre le VCC et le GND afin d'indiquer visuellement (par une DEL allumée) qu'il y a du courant dans le bus.
La LED doit tenir jusqu'à 25.5V. Une 2k donne 10mA à 25.5V et 0.5mA sur 3.3V.

## Références:
* https://electronics.stackexchange.com/questions/512653/can-split-termination-capacitor-calculation
* https://www.mouser.ca/datasheet/2/302/TJA1050-3083416.pdf
