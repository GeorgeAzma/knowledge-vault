### Functions
```c
analogRead(int pin)
digitalRead(int pin)
digitalWrite(int pin, int value)


micros() // ms time

Serial.begin(int baud);
Serial.print("")
Serial.println("")
```
### Pins
```
A0-14
D0-14
```
### Arduino-CLI
``` bash
arduino-cli config init
arduino-cli core install arduino:avr
arduino-cli board list  # Find your board/port
arduino-cli compile --fqbn arduino:avr:uno my_script.ino
arduino-cli upload -p COM3 --fqbn arduino:avr:uno my_script.ino
```