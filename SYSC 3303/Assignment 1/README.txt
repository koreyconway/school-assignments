Files:

Client.java:
	- This is the client class
	- It has a main() method that can be run that executes 10 requests (some read, some write, some invalid)
	- Both the Proxy and the Server must be running BEFORE for this to work
	
Server.java:
	- This is the server class
	- It has a main method that can be run to have it setup and wait to receive packets
	- This must be running before the proxy sends it requests

Proxy.java:
	- This is the proxy class (intermediate)
	- It has a main() method to get is started
	- This must be running before the client sends packets
	- Server must be running before the proxy tries to forward a request from client
	
Request.java:
	- This file has a class with common code related to a request send by the client
	- It is a data structure with a few validation and output features
	

Instructions:
	1. run Server::main
	2. run Proxy::main
	3. run Client::main
	4. check terminal logs