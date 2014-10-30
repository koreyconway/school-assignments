#!/usr/bin/python

import pifacedigitalio
import avenger.xml_joystick as xml1
import avenger.pins_dictionary as pins1
import avenger.joystick.read as read1
import avenger.network as network1
import time


# declaring and initalizing gloabal variables
default = [0,0,0,0,0]# used to check for debouncing
pin_dict = 0

xml = xml1.ParseGenerateXML()
pins = pins1.pin_dictionary()
reads = read1.ReadInputPins()
network = network1.NetworkUDP()

def start(event):
    
    while(True): 
            
        value = reads.read()#it reads in the value
        if(value == default):#checks if joystick doesn't send signal or released the button
            xml_packet = xml.generate(value,pin_dict)
            network.send_state(xml_packet)# sends the last packet and terminates the while loop
            #print(xml_packet)            
            break
        else:
            xml_packet = xml.generate(value,pin_dict)
            network.send_state(xml_packet)
            #print(xml_packet)
            xml_tempPacket = xml_packet 
            time.sleep(0.15)#it sleeps for 150 ms and reads the input again
            
 
    



if __name__ == "__main__":




    motor, led = xml.parse("pins_config.xml")#it configures the xml and determines how many motors are active
    pin_dict = pins.pin(motor,led)
   
    
    pifacedigitalio.init()
    global pifacedigital
    pifacedigital = pifacedigitalio.PiFaceDigital()
        
    #start()
    listener = pifacedigitalio.InputEventListener()

    # set up listener
    listener.register(0, pifacedigitalio.IODIR_ON, start)   
    listener.register(1, pifacedigitalio.IODIR_ON, start)            
    listener.register(2, pifacedigitalio.IODIR_ON, start)
    listener.register(3, pifacedigitalio.IODIR_ON, start)
    listener.register(4, pifacedigitalio.IODIR_ON, start)
    
    listener.activate()

    


