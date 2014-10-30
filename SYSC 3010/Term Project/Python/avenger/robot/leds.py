import RPi.GPIO as GPIO
import unittest
class Leds:
      def __init__(self, led):
          self.led = led;
          
          GPIO.setmode(GPIO.BCM)
          GPIO.setup(self.led, GPIO.OUT)
          
          ledState =  False
      
      def toggle():
          ledState = not ledState
          GPIO.output(led, ledState)
          
      def turnOn(self):
          ledState = True
          GPIO.output(self.led, ledState)
      
      def turnOff(self):
          ledState = False
          GPIO.output(self.led, ledState)
      
      def isOn(self):
          if ledState:
                return True
          else:
                return False
                
class ledsTest(unittest.TestCase):
    testled = Leds(0)
    
    def testLedOn(self):
        testled.turnOn()
        assertTrue(testled.isOn())
        
    def testLedOff(self):
        testled.turnOff()
        assertFalse(testled.isOn())
    
    def testLedToggle(self):
        ledstate = testled.isOn()
        testled.toggle()
        assertNotEqual(ledState, testled.isOn())
			
def main(self):
    unittest.main()
    GPIO.cleanup()

if __name__ == '__main__':
    main()
