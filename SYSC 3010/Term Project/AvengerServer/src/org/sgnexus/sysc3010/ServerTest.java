package org.sgnexus.sysc3010;

import static org.junit.Assert.*;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.Timer;
import java.util.TimerTask;

import org.junit.Test;
import org.xml.sax.SAXException;

public class ServerTest {

	@Test
	public void testSendReceive() {
		final StringBuilder response = new StringBuilder();
		final Thread t = new Thread() {
			@Override
			public void run() {
				try {
					byte[] buffer = new byte[5000];
					DatagramSocket s = new DatagramSocket(Config.getInstance()
							.getDestinationPort());
					DatagramPacket dp = new DatagramPacket(buffer,
							buffer.length);
					s.receive(dp);
					response.append(new String(dp.getData(), 0, dp.getLength(),
							"UTF-8"));
					synchronized (this) {
						this.notify();
					}
				} catch (UnknownHostException e) {
					e.printStackTrace();
				} catch (SocketException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				} catch (SAXException e) {
					e.printStackTrace();
				}

			}
		};

		try {
			Server s = new Server();
			t.start(); // start simulating robot arm listener
			s.start(); // start server listening

			Thread.sleep(1000); // wait for listeners to start

			// Send a state
			DatagramSocket socket = new DatagramSocket();
			String state = "<avengerState><motors><motor id=\"gripper\" state=\"forward\" /><motor id=\"elbow\" state=\"off\" /><motor id=\"shoulder\" state=\"off\" /><motor id=\"base\" state=\"off\" /><motor id=\"wrist\" state=\"off\" /></motors><leds><led id=\"hawkeye\" state=\"off\" /></leds></avengerState>";
			byte[] data = state.getBytes();
			DatagramPacket dp = new DatagramPacket(data, data.length);
			dp.setAddress(InetAddress.getLocalHost());
			dp.setPort(Config.getInstance().getPort());
			socket.send(dp);

			// Set timeout time to wait before giving up
			Timer timer = new Timer();
			timer.schedule(new TimerTask() {

				@Override
				public void run() {
					System.out.println("Time is up");
					synchronized (t) {
						t.notify();
					}
				}

			}, 1000);

			synchronized (t) {
				t.wait();
			}

			if (response.length() == 0) {
				fail("Time is up / nothing received received");
			}

			assertEquals(
					"<avengerState><motors><motor id=\"gripper\" state=\"forward\" /><motor id=\"elbow\" state=\"off\" /><motor id=\"shoulder\" state=\"off\" /><motor id=\"base\" state=\"off\" /><motor id=\"wrist\" state=\"off\" /></motors><leds><led id=\"hawkeye\" state=\"off\" /></leds></avengerState>",
					response.toString());
		} catch (ServerException e) {
			fail(e.getMessage());
		} catch (InterruptedException e) {
			fail(e.getMessage());
		} catch (SocketException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
