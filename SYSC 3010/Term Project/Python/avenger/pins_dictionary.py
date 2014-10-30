import unittest
class pin_dictionary(object):
    def __init__(self):
        pass
        
    '''
       d stores the motor's direction in number(1) and motor name in string(number) ('1')
    '''

    def pin(self,motor,led):
        d = {}
        for s in range(len(motor)):
       
            d[int(motor[s][1])] = 'forward'        
            d.setdefault(motor[s][1], []).append(str(motor[s][0]))        
 
            d[int(motor[s][2])] = 'reverse'
            d.setdefault(motor[s][2], []).append(str(motor[s][0]))

        

        for k in range(len(led)):
            d[int(led[k][1])] = 'LED'
            d.setdefault(led[k][1], []. append(str(led[k][0])))      
       
        
        return d


class pin_dictionaryTest(unittest.TestCase):   

    def testpin(self):
        pins = pin_dictionary()
        s = ([['gripper', '0', '1'], ['wrist', '2', '3']], [['hawkeye', '4']])
        pin = {0: 'forward', 1: 'reverse', '1': ['gripper'], '0': ['gripper'], 4: 'LED', 3: 'reverse', '2': ['wrist'], '4': None, '3': ['wrist'], 2: 'forward'}
        value = [0,0,1,0,1]
        self.assertEqual(pin,pins.pin(s[0],s[1]))                        




if __name__ == "__main__":
    
    try:
        unittest.main()        
    except SystemExit as inst:
        
        if inst.args[0] is True: # raised by sys.exit(True) when tests failed
            raise
