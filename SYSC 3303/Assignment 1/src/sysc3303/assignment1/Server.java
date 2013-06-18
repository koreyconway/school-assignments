package sysc3303.assignment1;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;

/**
 * @author korey
 *
 */
public class Server {
	protected DatagramSocket receiveSocket;
	protected int port = 69;
	protected boolean isConnected = false;
	
	/**
	 * @param args
	 */
	public static void main(String[] args)
	{
		new Server().run();
	}

	/**
	 * Constructor
	 */
	public Server()
	{}
	
	/**
	 * Bind to the server port and IP address
	 */
	public void connect()
	{
		try
		{
			System.out.println("Server connecting on " + InetAddress.getLocalHost().getHostAddress() + ":" + port);
			receiveSocket = new DatagramSocket(port, InetAddress.getLocalHost());
			isConnected = true;
		}
		catch (SocketException e)
		{
			e.printStackTrace();
		}
		catch (UnknownHostException e)
		{
			e.printStackTrace();
		}
	}
	
	/**
	 * Turn the server on and wait for packets to be received
	 */
	public void run()
	{
		if ( !isConnected ) {
			connect();
		}
		
		while(true) receive();
	}
	
	/**
	 * Receive a packet
	 */
	public void receive()
	{
		try {
			byte[] data = new byte[100];
			DatagramPacket receivePacket = new DatagramPacket(data, data.length);
			receiveSocket.receive(receivePacket);
			respond(receivePacket);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Respond to a received packet
	 * @param receivedPacket
	 */
	protected void respond(DatagramPacket receivedPacket)
	{
		try {
			// Re-create the request
			Request rq = new Request(receivedPacket.getData(), receivedPacket.getLength());
			
			// Log received packet to terminal
			String packetStr = (rq.isValid()) ? rq.generatePacketString() : new String(receivedPacket.getData());
			System.out.println("Server received (bytes): " + receivedPacket.getData());
			System.out.println("Server received (string): " + packetStr);
			
			DatagramSocket socket = new DatagramSocket();
			DatagramPacket packet;
			byte data[];
			
			// Formulate the response data
			if (rq.isValid && rq.action == Request.Action.READ) {
				data = new byte[] {0, 3, 0, 1};
			} else if (rq.isValid && rq.action == Request.Action.WRITE) {
				data = new byte[] {0, 4, 0, 0};				
			} else {
				data = new byte[] {0, 5};
			}
			
			// Print the response info to terminal
			System.out.print("Server response to " + receivedPacket.getAddress() + ":" + receivedPacket.getPort() + " : ");
			for (byte d : data) {
				System.out.print(d);
			}
			System.out.println();
			
			// Send the response packet
			packet = new DatagramPacket(data, data.length, receivedPacket.getAddress(), receivedPacket.getPort());
			socket.send(packet);
			
			// Close the response socket
			socket.close();
		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Disconnect sockets
	 */
	public void disconnect()
	{
		System.out.println("Server disconnecting");
		receiveSocket.close();
		isConnected = false;
	}
	
	/**
	 * Destructor, disconnects from sockets
	 */
	public void finalize()
	{
		disconnect();
	}
}
