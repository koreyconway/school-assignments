package sysc3303.project;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.SyncFailedException;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.Scanner;

import sysc3303.project.common.TftpAbortException;
import sysc3303.project.common.TftpConnection;
import sysc3303.project.common.TftpDataPacket;
import sysc3303.project.common.TftpPacket;
import sysc3303.project.common.TftpRequestPacket;

public class TftpClient {
	private static int DEFAULT_REQUEST_PORT = 68;
	private String publicFolder = System.getProperty("user.dir")
			+ "/client_files/";
	InetAddress serverAddress;
	int serverRequestPort;

	public TftpClient() {
	}

	public static void main(String[] args) {
		TftpClient c = new TftpClient();
		Scanner scanner = new Scanner(System.in);

		try {
			c.setServer(InetAddress.getLocalHost(), DEFAULT_REQUEST_PORT);
		} catch (UnknownHostException e1) {
			// ignore
		}

		while (true) {
			System.out.print("Command: ");
			String cmdLine = scanner.nextLine().toLowerCase();
			String[] command = cmdLine.split("\\s+");

			// Continue if blank line was passed
			if (command.length == 0 || command[0].length() == 0) {
				continue;
			}

			if (command[0].equals("help")) {
				System.out.println("Available commands:");
				printCommandOptions();
			} else if (command[0].equals("stop")) {
				System.out.println("Stopping client");
				c.stop();
				scanner.close();
				return;
			} else if (command[0].equals("pwd")) {
				System.out.println("Current directory: " + c.getPublicFolder());
			} else if ((command[0].equals("read") || command[0].equals("get"))
					&& command.length > 1 && command[1].length() > 0) {
				c.getFile(command[1]);
			} else if ((command[0].equals("write") || command[0].equals("send"))
					&& command.length > 1 && command[1].length() > 0) {
				c.sendFile(command[1]);
			} else if ((command[0].equals("connect")) && command.length > 1
					&& command[1].length() > 0) {
				try {
					String connectComponents[] = command[1].split(":");
					int serverPort = DEFAULT_REQUEST_PORT;
					if (connectComponents.length >= 2) {
						try {
							serverPort = Integer.parseInt(connectComponents[1]);
							if (serverPort < 0) {
								System.out
										.println("Invalid port number. Port number cannot be negative. Failed to connect.");
								continue;
							}
						} catch (NumberFormatException e) {
							System.out
									.println("Invalid port number. Port number must be an integer. Failed to connect.");
							continue;
						}
					}
					c.setServer(InetAddress.getByName(connectComponents[0]),
							serverPort);
				} catch (UnknownHostException e) {
					System.out.println("Failed to connect to " + command[1]);
				}
			} else if (command[0].equals("show") && command.length > 1) {
				if (command[1].equals("connection")) {
					System.out.println(c.getConnectionString());
				} else {
					System.out
							.println("Invalid command. These are the available commands:");
					printCommandOptions();
				}
			} else {
				System.out
						.println("Invalid command. These are the available commands:");
				printCommandOptions();
			}
		}
	}

	static private void printCommandOptions() {
		System.out.println("    help: prints this help menu");
		System.out.println("    stop: stop the client");
		System.out.println("    read filename: read file from server");
		System.out.println("    get filename: alias for read filename");
		System.out.println("    write filename: write file to server");
		System.out.println("    send filename: alias for write filename");
		System.out
				.println("    connect ip|hostname: set the server IP or hostname (eg. connect 192.168.1.4)");
		System.out
		.println("    connect ip|hostname:portnumber: set the server IP or hostname and the port number (eg. connect 192.168.1.4:69)");
		System.out
				.println("    pwd: prints out the directory for file transfers");
		System.out
		.println("   show connection: shows the current connection information: ip address and port number");
		
	}

	public void setServer(InetAddress serverAddress, int serverRequestPort) {
		this.serverAddress = serverAddress;
		this.serverRequestPort = serverRequestPort;
	}

	public String getConnectionString() {
		return "Currently connected to: "
				+ addressToString(serverAddress, serverRequestPort);
	}

	public String getPublicFolder() {
		return publicFolder;
	}

	public void stop() {
		System.out.println("Client is shutting down... goodbye!");
	}

	public TftpConnection getConnection() throws TftpAbortException {
		try {
			TftpConnection conn = new TftpConnection();

			if (serverAddress == null) {
				throw new TftpAbortException("Server address not specified");
			}

			conn.setRemoteAddress(serverAddress);
			conn.setRequestPort(serverRequestPort);
			return conn;
		} catch (SocketException e) {
			String errMsg = "Failed to connect to " + serverAddress.toString()
					+ ":" + serverRequestPort;
			System.out.println(errMsg);
			throw new TftpAbortException(errMsg);
		}
	}

	static private String addressToString(InetAddress addr, int port) {
		if (addr == null) {
			return "not connected";
		}

		return addr.toString() + ":" + port;
	}

	public void getFile(String filename) {
		String filePath = getPublicFolder() + filename;
		try {
			// Check write permissions
			File file = new File(filePath);
			if (file.exists() && !file.canWrite()) {
				System.out.println("Cannot overwrite file: " + filename);
				return;
			}

			TftpConnection conn = getConnection();

			FileOutputStream fs = new FileOutputStream(filePath);

			TftpRequestPacket reqPk = TftpPacket.createReadRequest(filename,
					TftpRequestPacket.Mode.OCTET);
			conn.sendRequest(reqPk);

			TftpDataPacket pk;

			int blockNumber = 1;
			do {
				pk = conn.receiveData(blockNumber);
				try {
					fs.write(pk.getFileData());
					fs.getFD().sync();
				} catch (SyncFailedException e) {
					file.delete();
					fs.close();
					conn.sendDiscFull("Failed to sync with disc, likely is full");
					return;
				}
				conn.sendAck(blockNumber);
				blockNumber++;
			} while (!pk.isLastDataPacket());
			fs.close();
		} catch (TftpAbortException e) {
			new File(filePath).delete();
			System.out.println("Failed to get " + filename + ": " + "\""
					+ e.getMessage() + "\"");
		} catch (IOException e) {
			new File(filePath).delete();
			System.out.println("IOException: failed to get " + filename + ": "
					+ "\"" + e.getMessage() + "\"");
		}
	}

	public void sendFile(String filename) {
		try {
			String filePath = getPublicFolder() + filename;

			// Check that file exists
			File file = new File(filePath);
			if (!file.exists()) {
				System.out.println("Cannot find file: " + filename);
				return;
			}

			// Check read permissions
			if (!file.canRead()) {
				System.out.println("Cannot read file: " + filename);
				return;
			}

			// Open input stream
			FileInputStream fs = new FileInputStream(file);

			// Send request
			TftpConnection conn = getConnection();
			TftpRequestPacket reqPk = TftpPacket.createWriteRequest(filename,
					TftpRequestPacket.Mode.OCTET);
			conn.sendRequest(reqPk);

			int blockNumber = 0;
			byte[] data = new byte[512];
			int bytesRead = 0;

			do {
				conn.receiveAck(blockNumber);
				blockNumber++;

				bytesRead = fs.read(data);

				// Special case when file size is multiple of 512 bytes
				if (bytesRead == -1) {
					bytesRead = 0;
					data = new byte[0];
				}

				conn.sendData(blockNumber, data, bytesRead);
			} while (bytesRead == TftpDataPacket.MAX_FILE_DATA_LENGTH);

			// Wait for final ack
			conn.receiveAck(blockNumber);

			fs.close();
		} catch (TftpAbortException e) {
			System.out.println("Failed to send " + filename + ": " + "\""
					+ e.getMessage() + "\"");
		} catch (IOException e) {
			System.out.println("IOException: failed to send " + filename + ": "
					+ "\"" + e.getMessage() + "\"");
		}
	}
}
