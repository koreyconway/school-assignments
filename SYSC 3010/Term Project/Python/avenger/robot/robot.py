import RPi.GPIO as GPIO
import unittest
from xml.dom import minidom
from socket import *
import sys
import select
import avenger.robot.motors as motorMod
import avenger.robot.leds as ledMod

class receiveXml:
     # Test Python networking code
    def __init__(self):
        pass

    def getXml():
        host = "0.0.0.0"
        port = 6666
        s = socket(AF_INET,SOCK_DGRAM)   #set up UDP connection
        s.bind((host,port))
        addr = (host,port)
        buf = 1024
        print("======================================================================================")

        f = open("avengerState.xml",'w') #create xml file to be parsed

        data,addr = s.recvfrom(buf)    #receive xml data from server
        xmlData = str(data)
        xmlData = xmlData.replace("b'", "")
        xmlData = xmlData[:-1]
        try:          

            if(data):
                f.write('<?xml version="1.0" encoding="UTF-8"?>')
                f.write(xmlData) #write data to file
                s.settimeout(.5)
        except timeout:
            f.close()
            s.close()
            
            
class parseXml:
    def __init__(self):
        pass
 
    def parse(file):
        data = open(file)
        xmldoc = minidom.parse(data)
        motor = [[]]
        led = [[]]
        motorInst=[0,0,0,0,0]
        motor_pins = [[0,1, 4], [7, 8, 9], [10,11, 14], [15,17,18], [21,22,23]]
        led_pin = 24
        
        # get all the attributes within the motor child
        
        motorlist = xmldoc.getElementsByTagName('motor')    
        i = 0
        for s in motorlist :
            motor[i].append(motorlist[i].attributes['id'].value)
            motor[i].append(motorlist[i].attributes['state'].value)
            if(i<motorlist.length-1):
                motor.append([])
            i = i+1
        i = 0
        while (i < len(motor_pins)):
            motorInst[i] =  motorMod.Motors(motor_pins[i][0], motor_pins[i][1])
            if (motor[i][1] == "reverse"):    #move or stop motors depending on the state given in xml
                motorInst[i].rotateCounterclockwise()
                print("Motor"+ str(i) + " is moving backwards.\n")
            elif (motor[i][1] == "forward"):
                motorInst[i].rotateClockwise()
                print("Motor"+ str(i) + " is moving forwards.\n")
            else:
                motorInst[i].stopMotor()
                print("Motor"+ str(i) + " is off.\n")
            i = i + 1 
        # get all the attributes within the led child
        
        ledlist = xmldoc.getElementsByTagName('led')
        i = 0
        while(i<ledlist.length):
            led[i].append(ledlist[i].attributes['id'].value)
            led[i].append(ledlist[i].attributes['state'].value)
            if(i<ledlist.length-1):
                led.append([])
            i = i+1
        
        ledInst = ledMod.Leds(led_pin)
        if (led[0][1] == "on"):   #turn led on or off depending on state given in xml
            ledInst.turnOn()
            print("Led is on.\n")
        else:
            ledInst.turnOff()
            print("Led is off.\n")




''''
	 while(data):
                f.write('<?xml version="1.0" encoding="UTF-8"?>')
                f.write(xmlData)
                s.settimeout(.5)
                data,addr = s.recvfrom(buf)
'''

