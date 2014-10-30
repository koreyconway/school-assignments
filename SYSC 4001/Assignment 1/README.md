Assignment 1
============

Authors
-------
- Monisha Gunalan (100871444)
- Korey Conway (100838924)

Compile Instructions
--------------------

To compile the monitor, run:
	
	make monitor
	
To compile the controller, run:
	
	make controller
	
To compile all, run:
	
	make all


Run Instructions
----------------

To run controller:
	
	$ ./bin/controller

To run monitor:
	
	$ ./bin/monitor "Patient Name"
	
	eg. $ ./bin/monitor "James Bond"

Notes:
- run controller and monitor in different terminals
- controller must be running before starting monitors
- limitation set to max 25 monitors

	

Monitor
-------

Parent:
- Get patient name from command line argument or interactive prompt
- Sends connect request to controller (FIFO)
- Waits to receive start message (FIFO)
- Starts child heartbeat monitor
- Waits for controller to send kill message (FIFO)
	- Send signal to child to terminate

Child:
- Determines heartbeat (between 60-100) every 2-3 seconds
- Puts heartbeat in message queue for controller (or is it for parent?)
- Receive terminate signal from parent


Controller
----------

Parent:
- Wait to receive request to connect from monitor (FIFO)
- Respond with start message
- Receives <control-C> signal
	- Sends terminate signal to child
	- Sends stop message to all monitors (FIFO)

Child:
- Wait to receive message from monitor (Message Queue)
- Prints info on console (PID, patient name, heartbeat)
- Responds back with an ACK to monitor (Message Queue)

