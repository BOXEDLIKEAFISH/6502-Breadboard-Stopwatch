# 6502 Breadboard Stopwatch

![unnamed (1)](https://github.com/user-attachments/assets/b4dc9cfe-4890-435f-a3d3-da399287097f)

A breadboard computer stopwatch with 2 tactile switches to start/stop and reset.

# Background
  The function of this computer is a 2 digit stopwatch, up to a maximum of 99 seconds. The values are displayed on 2 seven segment displays on a separate display board, with a button to stop the timer and flash the final time, and a reset button. 
  There are 8 outputs from PA0 - PA7 of the VIA, which connect to a separate display board, which decode 2 separate 4 bit inputs and display the number corresponding to their decimal values on seven segment displays.
  <br />
  <br />
  VIA ports PA0 - PA7 output 2 x 4 bit values to the left and right displays. Port PB0 takes input from the start/stop button.
  <br />
  <br />
  For example: 
  <br />
  <br />
  If the output from PA0 - PA7 is 10010011, the wires are connected to their respective display inputs, so that the first and last four bits are split. In this case, the inputs to the display board would be 1001 and 0011. The display board then decodes these values   and displays their decimal values on the respective displays. 
  <br />
  <br />
  1001 (binary) → 9 (decimal)
  <br />
  <br />
  0011 (binary) → 3 (decimal)
  <br />
  <br />
  The display board would then display the digits 9 and 3 on the seven segment displays. 

# Parts List
  | Part No. | Function |
  | :---: | :---: |
  | W65C02S | Central Processing Unit (CPU) |
  | W65C22S | Versatile Interface Adapter (VIA) |
  | SN74LS1348N | Decoder |
  | AT28C64B | EEPROM |
  | CY7C199CN | 32KB RAM |
  | SN74LS04N | Hex inverter |
  | DS1813 | Reset IC |
  | SN74LS00N | NAND gate |
  | LC4931 | 5V Voltage Regulator |


