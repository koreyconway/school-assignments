package sysc3303.project;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.util.Scanner;

import sysc3303.project.common.TftpAckPacket;
import sysc3303.project.common.TftpDataPacket;
import sysc3303.project.common.TftpPacket;

/**
 * @author Korey Conway (100838924)
 * @author Monisha (100871444)
 * @author Arzaan (100826631)
 */
public class TftpErrorSimulator {

	private enum ErrorCommands {
		NORMAL("normal"), ERROR_CHANGE_OPCODE("mode 0"), ERROR_REMOVE_FILENAME_DELIMITER(
				"mode 1"), ERROR_REMOVE_MODE_DELIMITER("mode 2"), ERROR_MODIFY_MODE(
				"mode 3"), ERROR_APPEND("mode 4"), ERROR_SHRINK_PACKET("mode 5"), ERROR_REMOVE_FILENAME(
				"mode 6"), ERROR_INVALID_TID("mode 7"), ERROR_LOSE_PACKET(
				"mode 8"), ERROR_DELAY_PACKET("mode 9"), ERROR_DUPLICATE_PACKET(
				"mode 10"), ERROR_APPEND_DATA("mode 11"), ERROR_APPEND_ACK(
				"mode 12"), ERROR_SHRINK_DATA("mode 13"), ERROR_SHRINK_ACK(
				"mode 14"), ERROR_CHANGE_BLOCK_NUM("mode 18");

		/**
		 * @param text
		 */
		private ErrorCommands(final String text) {
			this.text = text;
		}

		private final String text;

		/*
		 * (non-Javadoc)
		 * 
		 * @see java.lang.Enum#toString()
		 */
		@Override
		public String toString() {
			return text;
		}

		public boolean extendMenu1() {
			return (this == ERROR_CHANGE_OPCODE || this == ERROR_LOSE_PACKET);
		}

		public boolean extendMenu2() {
			return (this == ERROR_DELAY_PACKET
					|| this == ERROR_DUPLICATE_PACKET
					|| this == ERROR_INVALID_TID || this == ERROR_CHANGE_BLOCK_NUM);
		}

		public boolean extendMenu3() {
			return (this == ERROR_DELAY_PACKET
					|| this == ERROR_DUPLICATE_PACKET
					|| this == ERROR_INVALID_TID
					|| this == ERROR_CHANGE_BLOCK_NUM
					|| this == ERROR_SHRINK_ACK || this == ERROR_APPEND_DATA
					|| this == ERROR_LOSE_PACKET || this == ERROR_APPEND_ACK
					|| this == ERROR_SHRINK_DATA || this == ERROR_CHANGE_OPCODE);
		}
	}

	private enum PacketType {
		DATA("mode 15"), ACK("mode 16"), REQUEST("mode 17");

		/**
		 * @param text
		 */
		private PacketType(final String text) {
			this.text = text;
		}

		private final String text;

		/*
		 * (non-Javadoc)
		 * 
		 * @see java.lang.Enum#toString()
		 */
		@Override
		public String toString() {
			return text;
		}
	}

	protected InetAddress serverAddress;
	protected int serverRequestPort = 69;
	protected int clientRequestPort = 68;
	protected int threadCount = 0;
	protected boolean stopping = false;
	protected RequestReceiveThread requestReceive;

	private ErrorCommands errorCommand = ErrorCommands.NORMAL;
	private PacketType packetType = PacketType.ACK;
	private int blockNumber;
	private int newBlocknum;
	private boolean isChanged = false;

	/**
	 * Constructor
	 */
	public TftpErrorSimulator() {
		try {
			boolean isValid = false;
			while (!isValid) {
				isValid = true;
				System.out.print("Connect to:");
				Scanner scanner = new Scanner(System.in);
				String command = scanner.nextLine().toLowerCase();
				if (command.equalsIgnoreCase("localhost"))
					serverAddress = InetAddress.getLocalHost();
				else if (Character.isDigit(command.charAt(0)))
					serverAddress = InetAddress.getByName(command);
				else {
					System.out.println("localhost: for localhost\n"
							+ "192.168.0.1: for ip address");
					isValid = false;
				}
			}

			requestReceive = new RequestReceiveThread();
			requestReceive.start();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		TftpErrorSimulator errorSimulator = new TftpErrorSimulator();
		Scanner scanner = new Scanner(System.in);

		while (true) {
			System.out.print("Command: ");
			String command = scanner.nextLine().toLowerCase();

			// Continue if blank line was passed
			if (command.length() == 0) {
				continue;
			}

			if (command.equals("help")) {
				printHelp();
				errorSimulator.errorCommand = ErrorCommands.NORMAL;

			} else if (command.equals("stop")) {
				System.out
						.println("Stopping simulator (when current transfers finish)");
				errorSimulator.stop();
				scanner.close();
			} else if (command
					.equalsIgnoreCase(ErrorCommands.NORMAL.toString())) {
				errorSimulator.errorCommand = ErrorCommands.NORMAL;
			} else if (command
					.equalsIgnoreCase(ErrorCommands.ERROR_CHANGE_OPCODE
							.toString())) {
				errorSimulator.errorCommand = ErrorCommands.ERROR_CHANGE_OPCODE;
			} else if (command
					.equalsIgnoreCase(ErrorCommands.ERROR_CHANGE_BLOCK_NUM
							.toString())) {
				errorSimulator.errorCommand = ErrorCommands.ERROR_CHANGE_BLOCK_NUM;

			} else if (command
					.equalsIgnoreCase(ErrorCommands.ERROR_REMOVE_FILENAME_DELIMITER
							.toString())) {
				errorSimulator.errorCommand = ErrorCommands.ERROR_REMOVE_FILENAME_DELIMITER;
			} else if (command
					.equalsIgnoreCase(ErrorCommands.ERROR_REMOVE_MODE_DELIMITER
							.toString())) {
				errorSimulator.errorCommand = ErrorCommands.ERROR_REMOVE_MODE_DELIMITER;
			} else if (command.equalsIgnoreCase(ErrorCommands.ERROR_MODIFY_MODE
					.toString())) {
				errorSimulator.errorCommand = ErrorCommands.ERROR_MODIFY_MODE;
			} else if (command.equalsIgnoreCase(ErrorCommands.ERROR_APPEND
					.toString())) {
				boolean isValid = false;
				while (!isValid) {
					System.out
							.print("Choose Packet Type:  data packet(mode 11) or ackPacket(mode 12):");
					command = scanner.nextLine().toLowerCase();
					if (command
							.equalsIgnoreCase(ErrorCommands.ERROR_APPEND_DATA
									.toString())) {
						errorSimulator.packetType = PacketType.DATA;
						errorSimulator.errorCommand = ErrorCommands.ERROR_APPEND_DATA;
						isValid = true;
					} else if (command
							.equalsIgnoreCase(ErrorCommands.ERROR_APPEND_ACK
									.toString())) {
						errorSimulator.packetType = PacketType.ACK;
						errorSimulator.errorCommand = ErrorCommands.ERROR_APPEND_ACK;
						isValid = true;
					} else {
						System.out.println("Invalid command");
					}
				}
			} else if (command
					.equalsIgnoreCase(ErrorCommands.ERROR_SHRINK_PACKET
							.toString())) {
				boolean isValid = false;
				while (!isValid) {
					System.out
							.print("Choose Packet Type:  data packet(mode 13) or ack Packet(mode 14):");
					command = scanner.nextLine().toLowerCase();
					if (command
							.equalsIgnoreCase(ErrorCommands.ERROR_SHRINK_DATA
									.toString())) {
						errorSimulator.packetType = PacketType.DATA;
						errorSimulator.errorCommand = ErrorCommands.ERROR_SHRINK_DATA;
						isValid = true;
					} else if (command
							.equalsIgnoreCase(ErrorCommands.ERROR_SHRINK_ACK
									.toString())) {
						errorSimulator.packetType = PacketType.ACK;
						errorSimulator.errorCommand = ErrorCommands.ERROR_SHRINK_ACK;
						isValid = true;
					} else {
						System.out.println("Invalid command");
					}
				}
			} else if (command
					.equalsIgnoreCase(ErrorCommands.ERROR_REMOVE_FILENAME
							.toString())) {
				errorSimulator.errorCommand = ErrorCommands.ERROR_REMOVE_FILENAME;
			} else if (command.equalsIgnoreCase(ErrorCommands.ERROR_INVALID_TID
					.toString())) {
				errorSimulator.errorCommand = ErrorCommands.ERROR_INVALID_TID;
			} else if (command.equalsIgnoreCase(ErrorCommands.ERROR_LOSE_PACKET
					.toString())) {
				errorSimulator.errorCommand = ErrorCommands.ERROR_LOSE_PACKET;
			} else if (command
					.equalsIgnoreCase(ErrorCommands.ERROR_DELAY_PACKET
							.toString())) {
				errorSimulator.errorCommand = ErrorCommands.ERROR_DELAY_PACKET;
			} else if (command
					.equalsIgnoreCase(ErrorCommands.ERROR_DUPLICATE_PACKET
							.toString())) {
				errorSimulator.errorCommand = ErrorCommands.ERROR_DUPLICATE_PACKET;
			} else {
				errorSimulator.errorCommand = ErrorCommands.NORMAL;
				printHelp();
			}

			// now if the error command has to know what packet it has to handle
			// then show the menu
			if (errorSimulator.errorCommand.extendMenu1()) {
				boolean isValid = false;
				while (!isValid) {
					isValid = true;
					System.out
							.print("Choose Packet Type:  data packet(mode 15) or ack Packet(mode 16) or  request Packet(mode 17):");
					command = scanner.nextLine().toLowerCase();
					if (command.equalsIgnoreCase(PacketType.REQUEST.toString())) {
						errorSimulator.packetType = PacketType.REQUEST;
					} else if (command.equalsIgnoreCase(PacketType.ACK
							.toString())) {
						errorSimulator.packetType = PacketType.ACK;
					} else if (command.equalsIgnoreCase(PacketType.DATA
							.toString())) {
						errorSimulator.packetType = PacketType.DATA;
					} else {
						System.out
								.println("Invalid command, valid commands are('mode 15', 'mode 16', 'mode 17')");
						isValid = false;
					}
				}
			} else if (errorSimulator.errorCommand.extendMenu2()) {
				boolean isValid = false;
				while (!isValid) {
					isValid = true;
					System.out
							.print("Choose Packet Type:  data packet(mode 15) or ack Packet(mode 16):");
					command = scanner.nextLine().toLowerCase();
					if (command.equalsIgnoreCase(PacketType.ACK.toString())) {
						errorSimulator.packetType = PacketType.ACK;
					} else if (command.equalsIgnoreCase(PacketType.DATA
							.toString())) {
						errorSimulator.packetType = PacketType.DATA;
					} else {
						System.out
								.println("Invalid command, valid commands are(data or ack)");
						isValid = false;
					}
				}

			}
			if (errorSimulator.errorCommand.extendMenu3()
					&& errorSimulator.packetType != PacketType.REQUEST) {
				errorSimulator.blockNumber = chooseBlockNum("Choose the Block Number: ");
				if (errorSimulator.errorCommand == ErrorCommands.ERROR_CHANGE_BLOCK_NUM)
					errorSimulator.newBlocknum = chooseBlockNum("Change the Block Number to: ");
			}
		}

	}

	private static void printHelp() {
		System.out.println("Available commands:");
		System.out.println("    help: prints this help menu");
		System.out
				.println("    stop: stop the error simulator (when current transfers finish)");
		System.out.println("normal : normal mode ");
		System.out.println("mode 0 : change packet opcode ");
		System.out.println("mode 1: Remove the byte '0' after the file name");
		System.out.println("mode 2: Remove the byte '0' after the mode");
		System.out.println("mode 3: Modify the string mode");
		System.out.println("mode 4: Append more data to the packet");
		System.out.println("mode 5: Shrink the packet");
		System.out.println("mode 6: Remove File name from the packet");
		System.out.println("mode 7: Change the port number - Invalid TID");
		System.out.println("mode 8: Lose a packet");
		System.out.println("mode 9: Delay a packet");
		System.out.println("mode 10: Duplicate a packet");
		System.out.println("mode 18: Change Block Number");

	}

	synchronized public void incrementThreadCount() {
		threadCount++;
	}

	synchronized public void decrementThreadCount() {
		threadCount--;
		if (threadCount <= 0) {
			notifyAll();
		}
	}

	synchronized public int getThreadCount() {
		return threadCount;
	}

	public void stop() {
		requestReceive.getSocket().close();

		// wait for threads to finish
		while (getThreadCount() > 0) {
			try {
				wait();
			} catch (InterruptedException e) {
				System.out
						.println("Stopping was interrupted. Failed to stop properly.");
				System.exit(1);
			}
		}
		System.out.println("Error simulator closed.");
		System.out.println();
		System.exit(0);
	}

	private class RequestReceiveThread extends Thread {
		private DatagramSocket socket;

		public RequestReceiveThread() {
			try {
				socket = new DatagramSocket(clientRequestPort);
			} catch (SocketException e) {
				System.out.println("Count not bind to port: "
						+ clientRequestPort);
				System.exit(1);
			}
		}

		public void run() {
			try {
				incrementThreadCount();

				while (!socket.isClosed()) {
					DatagramPacket dp = TftpPacket.createDatagramForReceiving();
					socket.receive(dp);
					if (errorCommand == ErrorCommands.ERROR_LOSE_PACKET
							&& packetType == PacketType.REQUEST) {
						socket.receive(dp);
					}
					isChanged = false;
					new ForwardThread(dp).start();
				}
			} catch (IOException e) {
				// Probably just closing the thread down
			}

			decrementThreadCount();
		}

		public DatagramSocket getSocket() {
			return socket;
		}
	}

	private class ForwardThread extends Thread {
		private DatagramSocket socket;
		private int timeoutMs = 10000; // 10 second receive timeout
		private DatagramPacket requestPacket;
		private InetAddress clientAddress;
		private int clientPort, serverPort;

		ForwardThread(DatagramPacket requestPacket) {
			this.requestPacket = requestPacket;
		}

		public void run() {
			try {
				incrementThreadCount();

				socket = new DatagramSocket();
				socket.setSoTimeout(timeoutMs);
				clientAddress = requestPacket.getAddress();
				clientPort = requestPacket.getPort();

				// Send request to server
				System.out.println("Sending request to server ");

				DatagramPacket dp = new DatagramPacket(requestPacket.getData(),
						requestPacket.getLength(), serverAddress,
						serverRequestPort);
				if (errorCommand == ErrorCommands.ERROR_CHANGE_OPCODE
						&& packetType == PacketType.REQUEST)
					socket.send(changeOpcode(dp));
				else if (errorCommand == ErrorCommands.ERROR_REMOVE_FILENAME_DELIMITER)
					socket.send(modifyFileNameTrailingByte(dp));
				else if (errorCommand == ErrorCommands.ERROR_REMOVE_FILENAME)
					socket.send(removeFileName(dp));
				else if (errorCommand == ErrorCommands.ERROR_REMOVE_MODE_DELIMITER)
					socket.send(removeModeTrailingByte(dp));
				else if (errorCommand == ErrorCommands.ERROR_MODIFY_MODE)
					socket.send(modifyMode(dp));
				else
					socket.send(dp);

				// Receive from server
				System.out.println("Receiving packet from server");
				dp = TftpPacket.createDatagramForReceiving();
				socket.receive(dp);
				serverPort = dp.getPort();

				while (true) {
					// Forward to client
					System.out.println("Forwarding packet to client");
					dp = new DatagramPacket(dp.getData(), dp.getLength(),
							clientAddress, clientPort);
					if (errorCommand == ErrorCommands.ERROR_APPEND_DATA
							&& TftpPacket.createFromDatagram(dp) instanceof TftpDataPacket
							&& ((TftpDataPacket) TftpPacket
									.createFromDatagram(dp)).getBlockNumber() == blockNumber) {
						socket.send(appendData(dp));
					} else if (errorCommand == ErrorCommands.ERROR_SHRINK_DATA
							&& TftpPacket.createFromDatagram(dp) instanceof TftpDataPacket
							&& ((TftpDataPacket) TftpPacket
									.createFromDatagram(dp)).getBlockNumber() == blockNumber) {
						socket.send(shrinkData(dp));

					} else if (errorCommand == ErrorCommands.ERROR_SHRINK_ACK
							&& TftpPacket.createFromDatagram(dp) instanceof TftpAckPacket
							&& ((TftpAckPacket) TftpPacket
									.createFromDatagram(dp)).getBlockNumber() == blockNumber) {
						socket.send(shrinkData(dp));

					} else if (errorCommand == ErrorCommands.ERROR_APPEND_ACK
							&& TftpPacket.createFromDatagram(dp) instanceof TftpAckPacket
							&& ((TftpAckPacket) TftpPacket
									.createFromDatagram(dp)).getBlockNumber() == blockNumber) {
						socket.send(appendAckPacket(dp));
					} else if (errorCommand == ErrorCommands.ERROR_INVALID_TID) {
						if (packetType == PacketType.DATA
								&& TftpPacket.createFromDatagram(dp) instanceof TftpDataPacket
								&& ((TftpDataPacket) TftpPacket
										.createFromDatagram(dp))
										.getBlockNumber() == blockNumber) {
							DatagramSocket invalidSocket = new DatagramSocket();
							invalidSocket.setSoTimeout(timeoutMs);
							invalidSocket.send((dp));
							invalidSocket.close();
						} else if (packetType == PacketType.ACK
								&& TftpPacket.createFromDatagram(dp) instanceof TftpAckPacket
								&& ((TftpAckPacket) TftpPacket
										.createFromDatagram(dp))
										.getBlockNumber() == blockNumber) {
							DatagramSocket invalidSocket = new DatagramSocket();
							invalidSocket.setSoTimeout(timeoutMs);
							invalidSocket.send((dp));
							invalidSocket.close();
						}
						socket.send(dp);

					} else if (errorCommand == ErrorCommands.ERROR_CHANGE_OPCODE
							&& packetType == PacketType.DATA
							&& TftpPacket.createFromDatagram(dp) instanceof TftpDataPacket
							&& ((TftpDataPacket) TftpPacket
									.createFromDatagram(dp)).getBlockNumber() == blockNumber) {
						socket.send(changeOpcode(dp));
					} else if (errorCommand == ErrorCommands.ERROR_CHANGE_OPCODE
							&& packetType == PacketType.ACK
							&& TftpPacket.createFromDatagram(dp) instanceof TftpAckPacket
							&& ((TftpAckPacket) TftpPacket
									.createFromDatagram(dp)).getBlockNumber() == blockNumber) {
						socket.send(changeOpcode(dp));

					} else if (errorCommand == ErrorCommands.ERROR_CHANGE_BLOCK_NUM
							&& packetType == PacketType.DATA
							&& TftpPacket.createFromDatagram(dp) instanceof TftpDataPacket
							&& ((TftpDataPacket) TftpPacket
									.createFromDatagram(dp)).getBlockNumber() == blockNumber
							&& !isChanged) {
						socket.send(changeBlockNum(dp));
					} else if (errorCommand == ErrorCommands.ERROR_CHANGE_BLOCK_NUM
							&& packetType == PacketType.ACK
							&& TftpPacket.createFromDatagram(dp) instanceof TftpAckPacket
							&& ((TftpAckPacket) TftpPacket
									.createFromDatagram(dp)).getBlockNumber() == blockNumber
							&& !isChanged) {
						socket.send(changeBlockNum(dp));

					} else if (errorCommand == ErrorCommands.ERROR_LOSE_PACKET) {
						if (packetType == PacketType.DATA
								&& TftpPacket.createFromDatagram(dp) instanceof TftpDataPacket
								&& ((TftpDataPacket) TftpPacket
										.createFromDatagram(dp))
										.getBlockNumber() == blockNumber) {
							// Lose the packet, i.e wait for server to send the
							// data again
							System.out
									.println("***Lost the data Packet received from Server***");
							System.out
									.println("Receiving data packet from server");
							dp = TftpPacket.createDatagramForReceiving();
							socket.receive(dp);
							serverPort = dp.getPort();

						} else if (packetType == PacketType.ACK
								&& TftpPacket.createFromDatagram(dp) instanceof TftpAckPacket
								&& ((TftpAckPacket) TftpPacket
										.createFromDatagram(dp))
										.getBlockNumber() == blockNumber) {
							// Lose the packet, i.e wait for client to send the
							// data again
							System.out
									.println("***Lost the ack Packet from the server***");
							System.out
									.println("Receiving the same data packet from client");

							dp = TftpPacket.createDatagramForReceiving();
							socket.receive(dp);

							// Send that back to server
							dp = new DatagramPacket(dp.getData(),
									dp.getLength(), serverAddress, serverPort);
							socket.send(dp);
							// Now get the ack from server
							dp = TftpPacket.createDatagramForReceiving();
							socket.receive(dp);
						}
						DatagramPacket sendDp = new DatagramPacket(
								dp.getData(), dp.getLength(), clientAddress,
								clientPort);
						socket.send(sendDp);

					} else if (errorCommand == ErrorCommands.ERROR_DELAY_PACKET) {
						if (packetType == PacketType.DATA
								&& TftpPacket.createFromDatagram(dp) instanceof TftpDataPacket
								&& ((TftpDataPacket) TftpPacket
										.createFromDatagram(dp))
										.getBlockNumber() == blockNumber) {
							DatagramPacket dp1 = new DatagramPacket(
									dp.getData(), dp.getLength());
							System.out
									.println("***Delay the data Packet from the server***");
							System.out
									.println("Waiting to get  Data packet from server");
							dp = TftpPacket.createDatagramForReceiving();
							socket.receive(dp);
							DatagramPacket dp2 = new DatagramPacket(
									dp.getData(), dp.getLength());

							// Now send the previous dp1 and then send dp2
							System.out
									.println("Forwarding data packet to client");
							dp = new DatagramPacket(dp1.getData(),
									dp1.getLength(), clientAddress, clientPort);
							socket.send(dp);

							// Receive from client
							System.out
									.println("Waiting to get  ack packet from client");
							dp = TftpPacket.createDatagramForReceiving();
							socket.receive(dp);

							// forward that to server
							System.out
									.println("Forwarding ack packet to server");
							dp = new DatagramPacket(dp.getData(),
									dp.getLength(), serverAddress, serverPort);
							socket.send(dp);

							// send the delayed packet
							System.out
									.println("Forwarding delayed data packet to client");
							dp = new DatagramPacket(dp2.getData(),
									dp2.getLength(), clientAddress, clientPort);

						} else if (packetType == PacketType.ACK
								&& TftpPacket.createFromDatagram(dp) instanceof TftpAckPacket
								&& ((TftpAckPacket) TftpPacket
										.createFromDatagram(dp))
										.getBlockNumber() == blockNumber) {
							DatagramPacket dp1 = new DatagramPacket(
									dp.getData(), dp.getLength());

							System.out
									.println("***Delay the ACK Packet from server***");
							System.out
									.println("Receiving the same data packet from client");
							dp = TftpPacket.createDatagramForReceiving();
							socket.receive(dp);

							// Send that back to server
							dp = new DatagramPacket(dp.getData(),
									dp.getLength(), serverAddress, serverPort);
							socket.send(dp);

							dp = new DatagramPacket(dp1.getData(),
									dp1.getLength(), clientAddress, clientPort);
							socket.send(dp);

							// Now get the ack from server
							System.out
									.println("Waiting to get  ack packet from server");
							dp = TftpPacket.createDatagramForReceiving();
							socket.receive(dp);

						}
						DatagramPacket sendDp = new DatagramPacket(
								dp.getData(), dp.getLength(), clientAddress,
								clientPort);
						socket.send(sendDp);

					} else if (errorCommand == ErrorCommands.ERROR_DUPLICATE_PACKET) {
						if (packetType == PacketType.DATA
								&& TftpPacket.createFromDatagram(dp) instanceof TftpDataPacket
								&& ((TftpDataPacket) TftpPacket
										.createFromDatagram(dp))
										.getBlockNumber() == blockNumber) {
							System.out.println("***Duplicate the Packet***");
							DatagramPacket dp1 = new DatagramPacket(
									dp.getData(), dp.getLength());

							// Now send the previous dp1 and then send dp2
							System.out
									.println("Forwarding data packet to client");
							dp = new DatagramPacket(dp1.getData(),
									dp1.getLength(), clientAddress, clientPort);
							socket.send(dp);
							// Receive from client
							System.out
									.println("Waiting to get  ack packet from Client ");
							dp = TftpPacket.createDatagramForReceiving();
							socket.receive(dp);

							// forward that to server
							System.out
									.println("Forwarding ack packet to server");
							dp = new DatagramPacket(dp.getData(),
									dp.getLength(), serverAddress, serverPort);
							socket.send(dp);

							// send the duplicate data now to the client
							System.out
									.println("Forwarding the duplicate data packet to cleint");
							dp = new DatagramPacket(dp1.getData(),
									dp1.getLength(), clientAddress, clientPort);

						} else if (packetType == PacketType.ACK
								&& TftpPacket.createFromDatagram(dp) instanceof TftpAckPacket
								&& ((TftpAckPacket) TftpPacket
										.createFromDatagram(dp))
										.getBlockNumber() == blockNumber) {
							System.out.println("***Duplicate the Packet***");
							DatagramPacket dp1 = new DatagramPacket(
									dp.getData(), dp.getLength());

							// Now send the previous dp1 and then send dp2
							System.out
									.println("Forwarding ack packet to client");
							dp = new DatagramPacket(dp1.getData(),
									dp1.getLength(), clientAddress, clientPort);
							socket.send(dp);

							// Receive from client
							System.out
									.println("Waiting to get data packet from Client ");
							dp = TftpPacket.createDatagramForReceiving();
							socket.receive(dp);

							// forward that to server
							System.out
									.println("Forwarding data packet to server");
							dp = new DatagramPacket(dp.getData(),
									dp.getLength(), serverAddress, serverPort);
							socket.send(dp);

							// send duplicate ack to client
							System.out
									.println("Forwarding duplicate ack packet to cleint");
							dp = new DatagramPacket(dp1.getData(),
									dp1.getLength(), clientAddress, clientPort);
						}
						DatagramPacket sendDp = new DatagramPacket(
								dp.getData(), dp.getLength(), clientAddress,
								clientPort);
						socket.send(sendDp);
					} else {
						socket.send(dp);
					}

					// Wait for response from client
					System.out.println("Waiting to get packet from client");
					dp = TftpPacket.createDatagramForReceiving();
					socket.receive(dp);

					// Forward to server
					System.out.println("Forwarding packet to server");
					dp = new DatagramPacket(dp.getData(), dp.getLength(),
							serverAddress, serverPort);
					if (errorCommand == ErrorCommands.ERROR_APPEND_DATA
							&& TftpPacket.createFromDatagram(dp) instanceof TftpDataPacket
							&& ((TftpDataPacket) TftpPacket
									.createFromDatagram(dp)).getBlockNumber() == blockNumber) {
						socket.send(appendData(dp));

					} else if (errorCommand == ErrorCommands.ERROR_SHRINK_DATA
							&& TftpPacket.createFromDatagram(dp) instanceof TftpDataPacket
							&& ((TftpDataPacket) TftpPacket
									.createFromDatagram(dp)).getBlockNumber() == blockNumber) {
						socket.send(shrinkData(dp));

					} else if (errorCommand == ErrorCommands.ERROR_SHRINK_ACK
							&& TftpPacket.createFromDatagram(dp) instanceof TftpAckPacket
							&& ((TftpAckPacket) TftpPacket
									.createFromDatagram(dp)).getBlockNumber() == blockNumber) {
						socket.send(shrinkData(dp));

					} else if (errorCommand == ErrorCommands.ERROR_APPEND_ACK
							&& TftpPacket.createFromDatagram(dp) instanceof TftpAckPacket
							&& ((TftpAckPacket) TftpPacket
									.createFromDatagram(dp)).getBlockNumber() == blockNumber) {
						socket.send(appendAckPacket(dp));

					} else if (errorCommand == ErrorCommands.ERROR_INVALID_TID) {
						if (packetType == PacketType.DATA
								&& TftpPacket.createFromDatagram(dp) instanceof TftpDataPacket
								&& ((TftpDataPacket) TftpPacket
										.createFromDatagram(dp))
										.getBlockNumber() == blockNumber) {
							DatagramSocket invalidSocket = new DatagramSocket();
							invalidSocket.setSoTimeout(timeoutMs);
							invalidSocket.send((dp));
							invalidSocket.close();
						} else if (packetType == PacketType.ACK
								&& TftpPacket.createFromDatagram(dp) instanceof TftpAckPacket
								&& ((TftpAckPacket) TftpPacket
										.createFromDatagram(dp))
										.getBlockNumber() == blockNumber) {
							DatagramSocket invalidSocket = new DatagramSocket();
							invalidSocket.setSoTimeout(timeoutMs);
							invalidSocket.send((dp));
							invalidSocket.close();
						}
						socket.send(dp);

					} else if (errorCommand == ErrorCommands.ERROR_CHANGE_OPCODE
							&& packetType == PacketType.DATA
							&& TftpPacket.createFromDatagram(dp) instanceof TftpDataPacket
							&& ((TftpDataPacket) TftpPacket
									.createFromDatagram(dp)).getBlockNumber() == blockNumber) {
						socket.send(changeOpcode(dp));

					} else if (errorCommand == ErrorCommands.ERROR_CHANGE_OPCODE
							&& packetType == PacketType.ACK
							&& TftpPacket.createFromDatagram(dp) instanceof TftpAckPacket
							&& ((TftpAckPacket) TftpPacket
									.createFromDatagram(dp)).getBlockNumber() == blockNumber) {
						socket.send(changeOpcode(dp));

					} else if (errorCommand == ErrorCommands.ERROR_CHANGE_BLOCK_NUM
							&& packetType == PacketType.DATA
							&& TftpPacket.createFromDatagram(dp) instanceof TftpDataPacket
							&& ((TftpDataPacket) TftpPacket
									.createFromDatagram(dp)).getBlockNumber() == blockNumber
							&& !isChanged) {
						socket.send(changeBlockNum(dp));
					} else if (errorCommand == ErrorCommands.ERROR_CHANGE_BLOCK_NUM
							&& packetType == PacketType.ACK
							&& TftpPacket.createFromDatagram(dp) instanceof TftpAckPacket
							&& ((TftpAckPacket) TftpPacket
									.createFromDatagram(dp)).getBlockNumber() == blockNumber
							&& !isChanged) {
						socket.send(changeBlockNum(dp));

					} else if (errorCommand == ErrorCommands.ERROR_LOSE_PACKET) {
						if (packetType == PacketType.DATA
								&& TftpPacket.createFromDatagram(dp) instanceof TftpDataPacket
								&& ((TftpDataPacket) TftpPacket
										.createFromDatagram(dp))
										.getBlockNumber() == blockNumber) {
							System.out.println("***Lose the Packet***");
							// Lose the packet, i.e wait for server to send the
							// data back
							System.out.println("Lost the Packet");
							System.out
									.println("Receiving data packet from client");
							dp = TftpPacket.createDatagramForReceiving();
							socket.receive(dp);

						} else if (packetType == PacketType.ACK
								&& TftpPacket.createFromDatagram(dp) instanceof TftpAckPacket
								&& ((TftpAckPacket) TftpPacket
										.createFromDatagram(dp))
										.getBlockNumber() == blockNumber) {
							System.out.println("***Lose the Packet***");
							// Lose the packet, i.e wait for client to send the
							// data again
							System.out
									.println("Receiving the same data packet from server");
							dp = TftpPacket.createDatagramForReceiving();
							socket.receive(dp);
							// Send that back to client
							dp = new DatagramPacket(dp.getData(),
									dp.getLength(), clientAddress, clientPort);
							socket.send(dp);
							// Now get the ack from client
							dp = TftpPacket.createDatagramForReceiving();
							socket.receive(dp);
						}
						DatagramPacket sendDp = new DatagramPacket(
								dp.getData(), dp.getLength(), serverAddress,
								serverPort);
						socket.send(sendDp);

					} else if (errorCommand == ErrorCommands.ERROR_DELAY_PACKET) {
						if (packetType == PacketType.DATA
								&& TftpPacket.createFromDatagram(dp) instanceof TftpDataPacket
								&& ((TftpDataPacket) TftpPacket
										.createFromDatagram(dp))
										.getBlockNumber() == blockNumber) {
							DatagramPacket dp1 = new DatagramPacket(
									dp.getData(), dp.getLength());
							System.out.println("***Delay the Packet***");
							System.out
									.println("Waiting to get data packet from client");
							dp = TftpPacket.createDatagramForReceiving();
							socket.receive(dp);
							DatagramPacket dp2 = new DatagramPacket(
									dp.getData(), dp.getLength());

							// Now send the previous dp1 and then send dp2
							System.out
									.println("Forwarding data packet to server");
							dp = new DatagramPacket(dp1.getData(),
									dp1.getLength(), serverAddress, serverPort);
							socket.send(dp);

							// Receive from server
							System.out
									.println("Waiting to get ack packet from server");
							dp = TftpPacket.createDatagramForReceiving();
							socket.receive(dp);

							// forward that to client
							System.out
									.println("Forwarding ack packet to client");
							dp = new DatagramPacket(dp.getData(),
									dp.getLength(), clientAddress, clientPort);
							socket.send(dp);

							// send the delayed data packet to server
							System.out.println("Forwarding packet to server");
							dp = new DatagramPacket(dp2.getData(),
									dp2.getLength(), serverAddress, serverPort);

						} else if (packetType == PacketType.ACK
								&& TftpPacket.createFromDatagram(dp) instanceof TftpAckPacket
								&& ((TftpAckPacket) TftpPacket
										.createFromDatagram(dp))
										.getBlockNumber() == blockNumber) {
							DatagramPacket dp1 = new DatagramPacket(
									dp.getData(), dp.getLength());

							System.out
									.println("***Delay the ACK Packet from client***");
							System.out
									.println("Receiving the same data packet from server");
							dp = TftpPacket.createDatagramForReceiving();
							socket.receive(dp);

							// Send that back to server
							dp = new DatagramPacket(dp.getData(),
									dp.getLength(), serverAddress, serverPort);
							socket.send(dp);

							dp = new DatagramPacket(dp1.getData(),
									dp1.getLength(), serverAddress, serverPort);
							socket.send(dp);

							// Now get the ack from server
							System.out
									.println("Waiting to get ack packet from client");
							dp = TftpPacket.createDatagramForReceiving();
							socket.receive(dp);

						}
						DatagramPacket sendDp = new DatagramPacket(
								dp.getData(), dp.getLength(), serverAddress,
								serverPort);
						socket.send(sendDp);

					} else if (errorCommand == ErrorCommands.ERROR_DUPLICATE_PACKET) {
						if (packetType == PacketType.DATA
								&& TftpPacket.createFromDatagram(dp) instanceof TftpDataPacket
								&& ((TftpDataPacket) TftpPacket
										.createFromDatagram(dp))
										.getBlockNumber() == blockNumber) {
							DatagramPacket dp1 = new DatagramPacket(
									dp.getData(), dp.getLength());
							System.out.println("***Duplicate the Packet***");
							System.out
									.println("Forwarding data packet to server");
							dp = new DatagramPacket(dp1.getData(),
									dp1.getLength(), serverAddress, serverPort);
							socket.send(dp);

							// Receive from server
							System.out
									.println("Waiting to get ack packet from server");
							dp = TftpPacket.createDatagramForReceiving();
							socket.receive(dp);

							// forward that to client
							System.out
									.println("Forwarding ack packet to client");
							dp = new DatagramPacket(dp.getData(),
									dp.getLength(), clientAddress, clientPort);

							System.out
									.println("Forwarding duplicate data packet to server");
							dp = new DatagramPacket(dp1.getData(),
									dp1.getLength(), serverAddress, serverPort);

						} else if (packetType == PacketType.ACK
								&& TftpPacket.createFromDatagram(dp) instanceof TftpAckPacket
								&& ((TftpAckPacket) TftpPacket
										.createFromDatagram(dp))
										.getBlockNumber() == blockNumber) {
							DatagramPacket dp1 = new DatagramPacket(
									dp.getData(), dp.getLength());
							System.out.println("***Duplicate the Packet***");
							System.out
									.println("Forwarding ack packet to server");
							dp = new DatagramPacket(dp1.getData(),
									dp1.getLength(), serverAddress, serverPort);
							socket.send(dp);

							// Receive from server
							System.out
									.println("Waiting to get data packet from server");
							dp = TftpPacket.createDatagramForReceiving();
							socket.receive(dp);

							// forward that to client
							System.out
									.println("Forwarding data packet to client");
							dp = new DatagramPacket(dp.getData(),
									dp.getLength(), clientAddress, clientPort);

							// Send duplicate packet
							System.out
									.println("Forwarding duplicate ack packet to server");
							dp = new DatagramPacket(dp1.getData(),
									dp1.getLength(), serverAddress, serverPort);
						}
						DatagramPacket sendDp = new DatagramPacket(
								dp.getData(), dp.getLength(), serverAddress,
								serverPort);
						socket.send(sendDp);
					} else {
						socket.send(dp);
					}

					// Receive from server
					System.out.println("Waiting to get packet from server");
					dp = TftpPacket.createDatagramForReceiving();
					socket.receive(dp);
				}
			} catch (SocketTimeoutException e) {
				System.out
						.println("Socket timeout: closing thread. (Transfer may have simply finished)");
			} catch (IOException e) {
				System.out.println("Socket error: closing thread.");
			}

			decrementThreadCount();
		}
	}

	// Error - change the opcode to something other than 01,02, 03,04 or 05
	// in the request or data packet

	private DatagramPacket changeOpcode(DatagramPacket packet) {
		byte[] data = packet.getData();
		data[0] = 1;
		data[1] = 8;
		return new DatagramPacket(data, data.length, packet.getAddress(),
				packet.getPort());
	}

	// Error - Remove the trailing 0th byte after the mode in the request packet
	private DatagramPacket removeModeTrailingByte(DatagramPacket packet) {

		return new DatagramPacket(packet.getData(), packet.getLength() - 1,
				packet.getAddress(), packet.getPort());
	}

	// Error - Mod the trailing 0th byte after the file name in the request
	// packet
	private DatagramPacket modifyFileNameTrailingByte(DatagramPacket packet) {
		byte[] data = packet.getData();

		// find the index of the 0th byte after filename
		int i = 1;

		while (data[++i] != 0 && i < packet.getLength())
			;
		data[i] = 65;
		return new DatagramPacket(data, data.length, packet.getAddress(),
				packet.getPort());
	}

	// Error - Change to invalid mode (other than netascii and Octet) in the
	// request packet
	private DatagramPacket modifyMode(DatagramPacket packet) {
		byte[] data = packet.getData();
		// find the index of the 0th byte after filename
		int i = 1;
		while (data[++i] != 0 && i < packet.getLength())
			;
		byte[] invalidMode = ("abc").getBytes();
		i++;
		for (int index = 0; index < invalidMode.length; index++)
			data[i + index] = invalidMode[index];

		return new DatagramPacket(data, data.length, packet.getAddress(),
				packet.getPort());
	}

	// Error - Remove the file name in the request packet
	private DatagramPacket removeFileName(DatagramPacket packet) {
		byte[] data = packet.getData();
		// find the index of the 0th byte after filename
		int i = 1;
		while (data[++i] != 0 && i < packet.getLength())
			;
		byte[] modData = new byte[data.length - (i - 2)];
		// copy the op code
		System.arraycopy(data, 0, modData, 0, 2);
		// copy the rest of the data ignoring filename
		System.arraycopy(data, i, modData, 2, modData.length - 2);
		return new DatagramPacket(modData, modData.length, packet.getAddress(),
				packet.getPort());
	}

	// Error - change the data packet to be larger than 516 bytes (including
	// opcode and block number)
	private DatagramPacket appendData(DatagramPacket packet) {
		byte[] data = packet.getData();
		// Now append extra data
		for (int i = 516; i < data.length; i++)
			data[i] = (byte) 0xFF;
		return new DatagramPacket(data, data.length, packet.getAddress(),
				packet.getPort());
	}

	// Error - change the data/ack packet to be smaller than 4 bytes
	private DatagramPacket shrinkData(DatagramPacket packet) {
		byte[] data = packet.getData();
		byte[] modData = new byte[2];
		modData[0] = data[0];
		modData[1] = data[1];
		return new DatagramPacket(modData, modData.length, packet.getAddress(),
				packet.getPort());
	}

	// Error - change the ack packet to be larger than 4 bytes
	private DatagramPacket appendAckPacket(DatagramPacket packet) {
		byte[] data = packet.getData();
		byte[] modData = new byte[data.length + 2];
		System.arraycopy(data, 0, modData, 0, data.length);
		modData[data.length] = data[0];
		modData[data.length + 1] = data[1];
		return new DatagramPacket(modData, modData.length, packet.getAddress(),
				packet.getPort());
	}

	private DatagramPacket changeBlockNum(DatagramPacket packet) {
		byte[] data = packet.getData();
		data[2] = (byte) ((newBlocknum >> 8) & 0xFF);
		data[3] = (byte) (newBlocknum & 0xFF);

		isChanged = true;

		return new DatagramPacket(data, packet.getLength(),
				packet.getAddress(), packet.getPort());
	}

	private static int chooseBlockNum(String message) {
		boolean validBlock = false;
		Scanner scanner2 = new Scanner(System.in);
		int blkNum = 0;

		while (!validBlock) {
			System.out.print(message);
			if (scanner2.hasNextInt()) {
				blkNum = scanner2.nextInt();

				if (blkNum > 0 && blkNum <= 0xFFFF) {
					validBlock = true;

				} else {
					System.out
							.println("Invalid command: The block Number should be between 1 and 65535(inclusive)");
				}
			} else {
				scanner2.nextLine();
				System.out
						.println("Invalid command: The block Number should be an Integer between 1 and 65535(inclusive)");

			}

		}
		return blkNum;
	}
}
