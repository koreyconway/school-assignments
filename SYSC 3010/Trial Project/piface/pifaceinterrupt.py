import pifacecommon
import pifacedigitalio
import socket
import time
import sys
import os

quit = False

UDP_IP = "10.0.0.1"
UDP_PORT = 55555
PLAYER_ID = 0

def pressed_button(event):
    global pifacedigital
    pifacedigital.output_pins[event.pin_num].turn_on()
    
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.sendto(bytes(PLAYER_ID), (UDP_IP, UDP_PORT)) #message has to be converted to bytes.

def let_go(event):
    global pifacedigital
    pifacedigital.output_pins[event.pin_num].turn_off()

def pressed_quit(event):
    global quit
    quit = True

if __name__ == "__main__":
    pifacedigitalio.init()

    global pifacedigital
    pifacedigital = pifacedigitalio.PiFaceDigital()

    listener = pifacedigitalio.InputEventListener()

    # set up listeners for buttons
    listener.register(0, pifacedigitalio.IODIR_ON, pressed_button)
    listener.register(0, pifacedigitalio.IODIR_OFF, let_go)
    listener.register(3, pifacedigitalio.IODIR_ON, pressed_quit)

    # Start listening for button presses. spawns a new thread.
    listener.activate()

    # hang around until counter hits 20.
    while not quit:
        time.sleep(1)

    #closes the listener
    listener.deactivate()
    
    #exits program
    sys.exit()
