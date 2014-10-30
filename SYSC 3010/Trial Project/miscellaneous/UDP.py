import socket
    
    UDP_IP = "10.0.0.1"
    UDP_PORT = 55555
       
    
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.sendto(getBytes("Hello World!"), (UDP_IP, UDP_PORT)) #message has to be converted to bytes.
