package org.sgnexus.sysc3010;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;

import org.xml.sax.SAXException;

public class Server extends Thread {
	protected AvengerState mState;
	protected int mPort;
	protected DatagramSocket mSocket;
	protected InetAddress mDestinationHost;
	protected int mDestinationPort;
	protected Config mConfig;
	protected boolean running = false;

	public Server() throws ServerException {
		// Read config file
		try {
			Config conf = Config.getInstance();
			mPort = conf.getPort();
			mState = conf.getAvengerState();
			mDestinationHost = InetAddress.getByName(conf.getDestinationHost());
			mDestinationPort = conf.getDestinationPort();
			mConfig = conf;
		} catch (SAXException e) {
			throw new ServerException("Error parsing XML config", e);
		} catch (UnknownHostException e) {
			throw new ServerException(
					"Problem with destination address in config", e);
		}
	}

	@Override
	public void run() {
		running = true;

		try {
			// Init socket
			mSocket = new DatagramSocket(mPort);
			while (running) {
				try {
					// Listen for datagram
					byte[] buffer = new byte[5000];
					DatagramPacket dp = new DatagramPacket(buffer,
							buffer.length);
					mSocket.receive(dp);

					try {
						// Parse into avenger state
						AvengerState as = AvengerState
								.LoadFromXml(new ByteArrayInputStream(dp
										.getData(), 0, dp.getLength()));

						try {
							// Update state
							mState.updateState(
									AvengerState.ControllerId.REMOTE, as);

							// Send to destination
							sendState();
						} catch (SecurityException e) {
							System.out
									.println("SecurityException: Joystick cannot control arm while GUI is controlling");
						}
					} catch (SAXException e) {
						// Malformed requests get ignored
						System.out
								.println("Ignoring malformed XML from joystick");
					}

				} catch (SocketException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} catch (SocketException e) {
			e.printStackTrace();
		}

	}

	// Send the avenger xml to the rpi with the arm
	void sendState() {
		try {
			byte[] data = mState.toXml().getBytes();
			DatagramPacket dp = new DatagramPacket(data, data.length);
			dp.setAddress(mDestinationHost);
			dp.setPort(mDestinationPort);
			mSocket.send(dp);
			mState.updateLastSentTime();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
