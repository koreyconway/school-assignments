import RPi.GPIO as GPIO
import sys
import socket
board_type = sys.argv[-1]

GPIO.setmode(GPIO.BCM)                              # initialise RPi.GPIO

# set up ports 23 for input pulled-up high
GPIO.setup(23, GPIO.IN, pull_up_down=GPIO.PUD_UP)       

previous_status = ''
# set up the ip and port for the packet
UDP_IP = "10.0.0.1"
UDP_PORT = 55555
PLAYER_ID = "1"

try:
	while 1:	# enter a infinite that waiting for the button push
		GPIO.wait_for_edge(23, GPIO.FALLING)  #an interrupt occur when a button is pushed    
		print("key pressed")
		# sending the packet to the server
		sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
		sock.sendto(bytes(PLAYER_ID, 'utf-8'), (UDP_IP, UDP_PORT))
		print("packet sent")
		
except KeyboardInterrupt:          # trap a CTRL+C keyboard interrupt
	GPIO.cleanup()                 # resets all GPIO ports

GPIO.cleanup()                     # on exit, reset  GPIO ports used by program
