
from xml.dom import minidom
import xml.etree.ElementTree as etree
import unittest
  



class ParseGenerateXML(object):
    def __init__(self):
        pass
    
    def parse(self,file):
        xmldoc = minidom.parse(file)#'pins_config.xml'
        motor = [[]]
        led = [[]]
        motorlist = xmldoc.getElementsByTagName('motor')    
        i = 0
        for s in motorlist :
            motor[i].append(motorlist[i].attributes['id'].value)
            motor[i].append(motorlist[i].attributes['forward_pin'].value)
            motor[i].append(motorlist[i].attributes['reverse_pin'].value)
            if(i<motorlist.length-1):
                motor.append([])
            i = i+1
        

        ledlist = xmldoc.getElementsByTagName('led')
        i = 0
    
        while(i<ledlist.length):
            led[i].append(ledlist[i].attributes['id'].value)
            led[i].append(ledlist[i].attributes['state_pin'].value)
            if(i<ledlist.length-1):
                led.append([])
            i = i+1        

        return motor,led




    def generate(self,value,pin_dict):    
    
    
        root = etree.Element('avenegerState')
        tree = etree.Element(root)
    
        motor = etree.SubElement(root,'motors')

        i = 0
        while(i<4):#runs for two motors(four pins)
            if(value[i]== 1 and value[i+1]==1):
                motorState1 = etree.SubElement(motor,'motor')
                motorState1.set("state","off") 
                motorState1.set("id",self.list_to_string(str((pin_dict[str(i+1)]))))           
            
            else:            
                if(value[i] == 1):
                    motorState1 = etree.SubElement(motor,'motor')
                    motorState1.set("state",pin_dict[i])
                    motorState1.set("id",self.list_to_string(str((pin_dict[str(i)]))))
                
                elif(value[i+1]==1):
                    motorState1 = etree.SubElement(motor,'motor')
                    motorState1.set("state",pin_dict[i+1])
                    motorState1.set("id",self.list_to_string(str((pin_dict[str(i+1)]))))
                 
                else:
                    motorState1 = etree.SubElement(motor,'motor')
                    motorState1.set("state","off")
                    motorState1.set("id",self.list_to_string(str((pin_dict[str(i+1)]))))
            i = i+2
        #end of while(i<4) loop

       
        led = etree.SubElement(root,'leds')    
        ledState1 = etree.SubElement(led,'led')
                        
        if(value[4]==1):#for led pin            
            ledState1.set("state","on")
        else:
            ledState1.set("state","off")
                        
        ledState1.set("id","hawkeye")

    
        return etree.tostring(root)
        #end of generate()


    # this method return a string by avoiding other charactes from the string
    def list_to_string(self,action):
        action = action.replace("[","")
        action = action.replace("]","")
        action = action.replace("'","")
        return action
    

class JoystickTest(unittest.TestCase):
    
    def testtostring(self):
        testxml = ParseGenerateXML()
        self.assertEqual(testxml.list_to_string("[hulk]"),"hulk")

    def testParse(self):
        testxml = ParseGenerateXML()
        s = ([['gripper', '0', '1'], ['wrist', '2', '3']], [['hawkeye', '4']])
        self.assertEqual(s,testxml.parse("pins_config.xml"))




if __name__ == "__main__":
    
    try:
        unittest.main()        
    except SystemExit as inst:
        
        if inst.args[0] is True: # raised by sys.exit(True) when tests failed
            raise

