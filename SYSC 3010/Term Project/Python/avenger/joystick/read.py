#!/usr/bin/python
import pifacedigitalio as p

class ReadInputPins(object):
    def __init__(self):
        pass
    def read(self):
        """Read current state from the controller and return info"""
        # Initalize piface digital and list to store inputs
        p.init()    
        values = [0,0,0,0,0]
    
   
        for i in range(5):
            values[i] = p.digital_read(i)
                 
        return values    
       
