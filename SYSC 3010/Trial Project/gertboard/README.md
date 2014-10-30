Trial Project - Gertboard
=========================

The is a python program that is designed to listen to a button push and then send a packet to the server.

Run instruction
---------------
-connect the raspberry pi to the gertboard
-connect the gertboard's GPIO port 23 to the gertboard's buffer port 3
-place two jumpers on both the power and buffer 3 out
-open the terminal
-type in the $sudo python3 interrupt_2.py to start running the program
-press the third button to sent packets

Technical Informaiton
---------------------
The packet will be set to port 55555 on the server. At the beginning of the program, it will enter a infinite loop where it is waiting for a button to be pressed. When the button is pushed down, the program will generate a interrupt and sent a packet to the server. The program will send only one packet when the button is pushed, holding the button down will send multiply packets. Pressing down ctrl and C to generate a keyboard interrupt which will end the program.
