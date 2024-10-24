# PCB du module science

## Image du PCB en 3D
![Capture d’écran 2024-10-02 202944](https://github.com/user-attachments/assets/ce90d959-b31d-4fa0-b12b-c73057f1c64c)

## Objectifs:
* Contrôller les actionneurs du module science
  * Fan
  * Moteur DC (Grinder)
  * Actuateur linéaire
  * 4x servos
* PDB pour ces actionneurs
* Communication avec le reste du Rover

## Composants principaux:
* ESP32 S3 WROOM
* Connecteur Ethernet
* 2x bouton
* Connecteur XT60 mâle
* 6x connecteur XT30 femelle
* 2x connecteur XT30 mâle
* 8x connecteur à 2 pins
* Connecteur à 4 pins
* 6x slot à fusible
* LED

## Fonctionnement:
* Le PCB reçoit du 24V par le XT60
* Un buck down 24V -> 5V externe est connecté par deux XT30 (1 femelle, 1 mâle)
* Un buck down 24V -> 12V externe est connecté par deux XT30 (1 femelle, 1 mâle)
* Chacune des deux fans du vaccum a un connecteur XT30 à 12V
* Le grinder et l'actuateur linéaire sont chacun alimentés par un connecteurs XT30 à 24V
* LIN_IN_1 et LIN_IN_2 passent par un H-bridge et deviennet LIN+ et LIN- afin de pouvoir contrôller le sens de l'actuateur linéaire
* Les 8 connecteurs à 2 pins servent à ??????????? (Envoyer des signaux de contrôle? PB?)
* La pin 1 du ethernet est le CAN High et la pin 2 est le CAN Low

## PGIO:
### Outputs

| Name         | GPIO |Commentaires                |
|--------------|------|----------------------------|
| GRINDER_PWM  | IO10 |                            |
| PB_GRINDER   | IO11 |                            |PB -> outputs ou inputs? PB-> Push Button? Connecteurs?
| FAN_B_PWM    | IO3  |                            |
| FAN_A_PWM    | IO9  |                            |
| PB_VACCUM    | IO38 |                            |
| Servo_0      | IO7  |                            |
| Servo_1      | IO15 |                            |
| Servo_2      | IO16 |                            |
| Servo_3      | IO17 |                            |
| LIN_IN_1     | IO18 | Parle au H-Bridge          |Outputs pour l'actuateur linéaire?
| LIN_IN_2     | IO8  | Parle au H-Bridge          |
| PB_UP        | IO14 |                            |
| PB_DOWN      | IO21 |                            |
| PB_CAROUSSEL | IO12 |                            |
| PB_SPARE     | IO13 |                            |
| LED_BUILDIN  | IO5  |                            |À quoi sert cette LED?

### Inputs

| Name         | GPIO |Commentaires                |
|--------------|------|----------------------------|
| EN_PB        | EN   | Bouton Enable              |
| GPIO_0       | IO1  | Bouton Boot                |
| LS_EXT       | IO2  | Limit switch               |
| LS_RET       | IO3  | Limit switch               |

### Communication

| Name         | GPIO |Commentaires                |
|--------------|------|----------------------------|
| RXC          | IO47 | Parle au Ethernet (CanBus) |
| TXC          | IO48 | Parle au Ethernet (CanBus) |
| USB_N        | IO19 | Parle au port micro-SD     |
| USB_P        | IO20 | Parle au port micro-SD     |
