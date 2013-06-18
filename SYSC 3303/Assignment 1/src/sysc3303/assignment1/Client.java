package sysc3303.assignment1;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;

/**
 * @author korey
 *
 */
public class Client {
	protected DatagramSocket socket;
	protected int serverPort = 68;
	protected Request.Mode defaultTransferMode = Request.Mode.ASCII;

	/**
	 * @param args
	 */
	public static void main(String[] args)
	{
		Client c = new Client();
		c.connect();

		// Test
		c.read("myfile.txt");
		c.write("myfile.txt");
		c.read("myfile.txt");
		c.sendInvalidRequest("myfile.txt");
		c.read("myfile.txt");
		c.write("myfile.txt");
		c.sendInvalidRequest("myfile.txt");
		c.write("myfile.txt");
		c.read("myfile.txt");
		c.write("myfile.txt");
	}

	public Client()
	{}
	
	public void connect()
	{
		try {
			socket = new DatagramSocket();
		} catch (SocketException e) {
			e.printStackTrace();
		}
	}
	
	public void disconnect()
	{
		socket.disconnect();
	}
	
	public void read(String filename)
	{
		sendRequest(new Request(filename, Request.Action.READ, defaultTransferMode));
	}
	
	public void write(String filename)
	{
		sendRequest(new Request(filename, Request.Action.WRITE, defaultTransferMode));
	}

	public void sendInvalidRequest(String filename)
	{
		sendRequest(new Request(filename, Request.Action.INVALID, defaultTransferMode));
	}

	public void sendRequest(Request rq)
	{
		try {
			if ( null == rq.mode ) {
				rq.mode = defaultTransferMode;
			}
			
			// Convert the request into a byte array
			byte data[] = rq.generatePacketData();
			String dataStr = rq.generatePacketString();
			
			// Log to terminal
			System.out.println("Client sending (bytes): " + data);
			System.out.println("Client sending (string): " + dataStr);
			
			// Create the packet
			DatagramPacket dp = new DatagramPacket(data, data.length, InetAddress.getLocalHost(), serverPort);
			
			// Send the packet
			socket.send(dp);
			
			// Receive response
			receiveResponse();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	protected void receiveResponse()
	{
		try {
			byte data[] = new byte[100];
			DatagramPacket dp = new DatagramPacket(data, data.length);
			socket.receive(dp);
			data = dp.getData();
			int dataLength = dp.getLength();
			
			// Log receipt
			System.out.println("Client received (bytes): " + dp.getData());
			System.out.print("Client received (string): ");
			for ( int i = 0; i < dataLength; i++ ) {
				System.out.print(data[i]);
			}
			System.out.println();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void finalize()
	{
		disconnect();
	}
}
