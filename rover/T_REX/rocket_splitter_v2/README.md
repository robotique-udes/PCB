# PDB (Power Distribution Board)
PCB servant diviser le signal et le power aux deux moteurs pour chaque côté

Voici les informations concernant le PCB : PDB

## Image du PCB en 3D
<img width="823" alt="Capture d’écran, le 2024-09-25 à 21 33 00" src="https://github.com/user-attachments/assets/2da3e8d8-adbe-40c8-8d16-41c2c3507094">


## Objectifs:
* Envoyer le même signal de commande au moteur avant qu'en arrière (pour un Rocker).
* Alimenter deux PCB de Drive de moteur à l'aide d'une seule entrée de courant. 


## Composants principaux:
* XT60PW-F (Connecteur Power Moteur)
* XT60PW-M (Connecteur Vers une alimentation)
* AMPHENOL_54601 (Connecteur Ethernet Horizontaux)
* 3550 x2 (Socket de Fusibles)

## Fonctionnement:
Le circuit transfert le signal de commande du CAN bus vers deux prises qui vont vers les drivers de moteurs.
Le circuit l'alimentation en entrée vers les sorties pour alimenter les drivers de moteurs.

