Controller
==========

Controller Pin Connections
--------------------------

The order of the pin connections are as follows. 

Ground-M1-M2-M3-M4-M5-LED-Power

Note that Ground is on the side with the "1" on the plastic of the controller wire connector.


rPi Input Connections
---------------------

- connect Power to constant high on output port
- connect Ground to constant low on input port
- connect each of the M* or LED pins to desired input port pins



Robot
=====

Robotic Arm Part Requirements
-----------------------------

- 'Edge Robotic Arm Kit'
- 3 H-bridge chips | sn754410 chip or L293D. Each chip can control 2 motors – 5 motors = 3 chips.
- Raspberry Pi w/Gertboard
- Breadboard
- Jumper/ Connector wires

H-Bridge Circuit Configuration
------------------------------

(should be repeated for each chip)

- 1 to pin to Gertboard GPIO
- 2 to pin to Gertboard GPIO
- 3 to motor1
- 4 to the gnd (-) rail on the breadboard
- 5 to the gnd (-) rail on the breadboard
- 6 to motor1
- 7 to pin to Gertboard GPIO
- 8 to power (+) rail.
- 9 to pin to Gertboard GPIO
- 10 to pin to Gertboard GPIO
- 11 to motor2
- 12 to GND (-) rail
- 13 to GND (-) rail
- 14 to motor2
- 15 to pin Gertboard GPIO
- 16 to power (+) rail.

H-Bridge to Gertboard Configuration
-----------------------------------
**Shoulder motor**
- chip 1, pin 1 to Gertboard pin 4
- chip 1, pin 2 to Gertboard pin 0
- chip 1, pin 7 to Gertboard pin 1

**Base motor**

- chip 1, pin 9 to Gertboard pin 9
- chip 1, pin 10 to Gertboard pin 7
- chip 1, pin 15 to Gertboard pin 8

**Elbow motor**

- chip 2, pin 1 to Gertboard pin 14
- chip 2, pin 2 to Gertboard pin 10
- chip 2, pin 7 to Gertboard pin 11

**Wrist motor**

- chip 2, pin 9 to Gertboard pin 18
- chip 2, pin 10 to Gertboard pin 15
- chip 2, pin 15 to Gertboard pin 17

**Hand motor**

- chip 3, pin 9 to Gertboard pin 23
- chip 3, pin 10 to Gertboard pin 21
- chip 4, pin 15 to Gertboard pin 22

LED Configuration
-----------------

- Robotic arm LED to Gertboard pin 24


Running Instructions
-----------------------

Once the above set up is complete, proceed with running the Arm's software.

Locate the python module *start_robot.py* and enter the following in the terminal of the Raspberry Pi connected to the arm:

pi@raspberrypi ~ $ sudo python 3 start_robot.py
