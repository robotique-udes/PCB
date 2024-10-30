# Motherboard Exo 2025
Motherboard de l'exo 2025, utilisant le SoM V2. Notable features include 
- Use of Ethernet connectors (T-568B) for I/O
- Differential I2C on channel 1 and 2 of mutliplexer
- CANBUS
- Onboard socket for the back BNO_085

### Chips used
- [BNO_085 Devboard](https://www.adafruit.com/product/4754) (*connectors only*)
- [PCA9614](https://www.digikey.ca/en/products/detail/nxp-usa-inc/PCA9614DPZ/14635229) I2C -> Differential
- [PCA9506DGG,518](https://www.digikey.com/en/products/detail/nxp-usa-inc/PCA9506DGG-518/1157017) I2C Multiplexer
- [TPS562242DRLR](https://www.digikey.com/en/products/detail/texas-instruments/TPS562242DRLR/21298529?s=N4IgTCBcDaICoAUDKBWAbGMAWMARASgDL4gC6AvkA) Buck converter chip

### Ethernet pinout
The same pinout as rovus is used. See [Electrical standard](https://github.com/robotique-udes/rover/blob/release/circ2025/doc/electrical/electric_standard.md) for further explanations.
All logic levels are mapped to **5V**.

**T-568B wire convention**

    - 1 -> CAN_H
    - 2 -> CAN_L
    - 3 -> SCL_H
    - 4 -> SCL_L
    - 5 -> SDA_H
    - 6 -> SDA_L
    - 7 -> VCC
    - 8 -> GND

![RJ-45 T-568B](/exo/res/img/RJ45_pinout.png)



