import RPi.GPIO as GPIO
import unittest

class Motors:
     def __init__(self, pin1, pin2, enablepin):
         self.pin1 =  pin1
         self.pin2 =  pin2
         self.enablepin = enablepin
         
         GPIO.setmode(GPIO.BCM)
         
         GPIO.setup(self.pin1, GPIO.OUT)
         GPIO.setup(self.pin2, GPIO.OUT) # set up GPIO output channel
         GPIO.setup(self.enablepin, GPIO.OUT)
         GPIO.output(self.enablepin, True) #enable h-bridge
         GPIO.output(self.pin1, False)
         GPIO.output(self.pin2, False) # set both ports to off
              
         
         
     def rotateClockwise(self):
         # add motor control code for pins here
         GPIO.output(self.pin1, True)
         GPIO.output(self.pin2, False)
         
     def rotateCounterclockwise(self):
         # add motor control code for pins here
         GPIO.output(self.pin2, True)
         GPIO.output(self.pin1, False)
         
     def stopMotor(self):
         # add motor stopping code here
         GPIO.output(self.pin1, False)
         GPIO.output(self.pin2, False)
         

class motorTest(unittest.TestCase):
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(25, GPIO.IN)
    GPIO.setup(24, GPIO.IN)
        
    GPIO.setup(0, GPIO.OUT)
    GPIO.setup(1, GPIO.OUT)
    
    testmotor = Motors(0,1, 2)
    
    def testPin1():
       testmotor.rotateClockwise()
       time.sleep(0.5)
       assertTrue(GPIO.input(24))
       assertFalse(GPIO.input(25))
        
    def testPin2():
       testmotor.rotateCounterclockwise()
       time.sleep(0.5)
       assertTrue(GPIO.input(25))
       assertFalse(GPIO.input(24))
            
    def testPinsOff():
        testmotor.stopMotor()
        time.sleep(0.5)
        assertFalse(GPIO.input(24))
        assertFalse(GPIO.input(25))
    
def main():
    unittest.main()
    GPIO.cleanup()
    
if __name__ == '__main__':
    main()
