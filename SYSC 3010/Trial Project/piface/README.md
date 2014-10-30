Trial Project | PiFace Player
========

pifaceinterrupt.py is a simple python3 program which gives provides functionality to the push-button 
game for the player with the PiFace board attached to the Raspberry Pi.

Configuration
--------------
  Attach the PiFace board to the pins of the RaspberryPi. Ensure the RaspberryPi is connected to
  the host computer (i.e. has an IP).

Installation
--------------
  Ensure the latest version of python3 is installed on the RaspberryPi, as well as the latest versions
  of the following modules:
    - pifacecommon
    - pifacedigitalio

Operation
--------------
  Running the game:
  The following can be done on the raspberry pi or via ssh connection
    - locate pifaceinterrupts.py in the /home/pi folder, (or whichever folder it is saved).
    - enter the command
          python3 pifaceinterrupts.py
    - The java server will notice that this raspberrypi wishes to connect to the game and is ready to play.
    
  Playing the game:
    - Hit Switch 0 / Button 1 as fast as possible! The first person to reach the score limit wins!
    - Hit Switch 3 / Button 4 to exit the player (you) from the game.
  
