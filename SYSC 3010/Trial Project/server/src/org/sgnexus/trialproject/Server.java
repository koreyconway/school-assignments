package org.sgnexus.trialproject;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;
import java.util.Random;

public class Server {
	static final private boolean AUTO_DEMO = false;
	static final private int PORT = 55555;
	static final private int MAX_SCORE = 20;
	static boolean VERBOSE_ENABLED = true;
	static final private int MAX_PACKET_SIZE = 1;
	static final private int PLAYER_COUNT = 2;
	static private int mScore[] = new int[PLAYER_COUNT];
	static private DatagramSocket mSocket;
	static private DatagramPacket mPacket;
	static private Random rnd = new Random();

	public static void main(String[] args) {
		run();
	}

	private static void run() {
		restart();

		while (true) {
			int playerId = getNextPlayerId();
			
			if (playerId < 0) {
				// Skip over invalid player IDs
				continue;
			}

			int score = addScore(playerId);

			// Check for win and update UI
			if (score == MAX_SCORE) {
				showWin(playerId);
				pause(5000);
				restart();
			} else if (score >= 0) {
				updateUi();
			}
		}
	}

	private static int getNextPlayerId() {
		if (AUTO_DEMO) {
			pause(250);
			return rnd.nextInt(PLAYER_COUNT);
		}

		try {
			mSocket.receive(mPacket);
			
			// Receiving utf-8 character as the player ID from rPis
			// This is just a hack since python was only sending 0 when converting integer to byte
			// Needed to get things working for demo, not worth fixing since this is a throw away project
			int playerId = mPacket.getData()[0] - 48;
			
			if (playerId >= 0 && playerId < PLAYER_COUNT) {
				return playerId;
			} else {
				return -1;
			}
		} catch (IOException e) {
			verbose("Error receiving packet");
			return -1;
		}
	}

	private static void init() {
		// Create socket
		try {
			mSocket = new DatagramSocket(PORT);
			//verbose("Connected to port: " + mSocket.getLocalPort());
		} catch (SocketException e) {
			e.printStackTrace();
		}

		// Setup receive buffer
		byte[] buffer = new byte[MAX_PACKET_SIZE];
		mPacket = new DatagramPacket(buffer, buffer.length);
	}

	private static int addScore(int playerId) {
		if (playerId < 0 || playerId >= PLAYER_COUNT) {
			// Ignore invalid player IDs
			return 0;
		}

		return mScore[playerId]++;
	}

	private static void showWin(int playerId) {
		clearScreen();
		println("Player " + (playerId + 1) + " wins.");
	}

	private static void restart() {
		
		// Need to close/open socket each time to clear the UDP receive queue
		// Otherwise the button pushes accumulate even before the next game starts
		if (mSocket != null && mSocket.isBound()) {
			mSocket.close();
		}
		
		init();
		
		for (int i = 0; i < PLAYER_COUNT; i++) {
			mScore[i] = 0;
		}

		clearScreen();
		println("New game started");
	}

	private static void updateUi() {
		clearScreen();
		System.out.println("Game score:");
		for (int score : mScore) {
			for (int i = 0; i < score; i++) {
				System.out.print('*');
			}
			System.out.println();
		}
	}

	private static void println(String message) {
		System.out.println(message);
	}

	private static void clearScreen() {
		System.out.print("\u001b[2J");
		System.out.flush();
	}

	private static void pause(int time) {
		try {
			Thread.sleep(time);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	private static void verbose(String message) {
		if (VERBOSE_ENABLED) {
			System.out.println(message);
		}
	}
}
