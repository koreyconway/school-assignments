IDE Used: Eclipse
========

Setup Instruction
=================
Please import the following Java source files to a new project in Eclipse

Java Source Files:
=================
'package sysc3303.project': 
	TftpClient.java
	TftpServer.java
	TftpErrorSimulator.java
	TftpRequestListener.java
	TftpServerFileTransfer.java

'package sysc3303.project.common': 
	Log.java
	TftpAbortExeption.java
	TftpConnection.java
	TftpAckPacket.java
	TftpDataPacket.java								  
	TftpErrorPacket.java
	TftpPacket.java
	TftpRequestPacket.java
	


Server
======
Run to start the server. Start server first.
Commands: help, stop, pwd, chdir, defaultdir

Error Simulator
===============
Run to start error simulator. Start error simulator before client.
At the prompt " connect to ", enter the ip address or the command 'localhost' to connect to the localhost
choose the error mode to simulate an error before running the client(default mode is normal mode)
Commands: help(lists the available error modes),
	   stop(stop the error simulator (when current transfers finish))
                     error(choose the error mode to simulate an error)
	



Client
======
Run after server and error simulator are started.
Commands: read <<filename>>, write <<filename>>, help, close, stop, 
		  get <<filename>>, send<<filename>>, connect <<ip or hostname>>,  
		  connect <<ip|hostname:portnumber>>, show connection


Diagrams:
=========
Timing Diagram - AckPacketError.jpeg
Timing Diagram - Normal mode.jpeg
Timing Diagram - PacketSizeError.jpeg
Timing Diagram - Invalid TID.jpeg
Timing Diagram - OpcodeError.jpeg
Timing Diagram - RequestPacketError.jpeg
Delayed_Ack_Packet_Diagram.JPG
Duplicate_Ack_Packet_Diagram.JPG
Lost_Ack_Packet_Diagram.JPG
Delayed_Data_Packet_Diagram.JPG
Duplicate_Data_Packet_Diagram.JPG
Lost_Data_Packet_Diagram.JPG
UCM Diagrams.pdf

UML-ClassDiagram.jpeg

diagram for error1.JPG

diagram for error2.JPG

diagram for Error3.JPG

diagram Error6.JPG



Files for the client are stored in "client_files", 
bat.txt
bond.txt
clientimage.jpeg


files for the server are stored in "server_files"
soccer.txt
cgpa.jpg






Test case for Error code 03 (diskfull)

--------------------------------------------------

using chdir command in the server, change to a directory which is full or has space less than 1MB 
and 
send write request to server to write the file clientimage.jpeg(1MB). 

The error for disk full will be returned. 

Use command default dir to change to default directory



chdir(Change the directory to read/write files)

defaultdir(change to default directory)




Test case for Error code 02 (Access violation )

--------------------------------------------------------------

Try to read hidden files on server:
	Create a hidden file by creating a file with a '.' in front.(example: .hide.txt)
 	send read request to read the hidden file(Example: read .hidden.txt).	
	or send write request to write the hidden file (Example: write .hide.txt)
	Access violation error code will be returned



Try to write a file to a read only folder:
	
	change the permissions on server_files folder to read only

		(Right click on server_files folder--> properties --> Enable 'Read-only' under attributes  )
	
	Send a write request to write a file to the server
