# IP and PORT were to be typed when it is tested



import socket

UDP_IP = socket.gethostname()
UDP_PORT = 5555
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

class NetworkUDP(object):
    def __init__(self):
       pass 

        
    def send_state(self,xml_message):
        sock.sendto(xml_message, (UDP_IP, UDP_PORT))


        

