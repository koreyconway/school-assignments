package sysc3303.project;

import java.io.File;
import java.net.InetAddress;
import java.util.Scanner;

import sysc3303.project.common.TftpRequestPacket;

/**
 * @author Korey Conway (100838924)
 * @author Monisha (100871444)
 * @author Arzaan (100826631)
 */
public class TftpServer {
	// Port on which to listen for requests (6900 for dev, 69 for submission)
	private static final int LISTEN_PORT = 69;

	private static final String defaultDir = System.getProperty("user.dir")
			+ "/server_files/";

	// Folder where files are read/written
	private String publicFolder = defaultDir;

	// Current number of threads (used to know when we have stopped)
	private int threadCount = 0;

	// Request listener thread. Need reference to stop receiving when stopping.
	private TftpRequestListener requestListener;

	/**
	 * Constructor
	 */
	private TftpServer() {
		new File(publicFolder).setWritable(true);
		requestListener = new TftpRequestListener(this, LISTEN_PORT);
		requestListener.start();
	}

	/**
	 * Main program
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		TftpServer server = new TftpServer();
		Scanner scanner = new Scanner(System.in);

		while (true) {
			System.out.print("Command: ");
			String cmdLine = scanner.nextLine().toLowerCase();
			String[] command = cmdLine.split("\\s+");

			// Continue if blank line was passed
			if (command[0].length() == 0) {
				continue;
			}

			if (command.equals("help")) {
				System.out.println("Available commands:");
				System.out.println("    help: prints this help menu");
				System.out
						.println("    stop: stop the server (when current transfers finish)");
				System.out
						.println("    pwd: prints out the public directory for file transfers");
				System.out
						.println("    chdir: Change the directory for file transfer. e.g chdir /Volumes/dir1/");
				System.out
						.println("    defaultdir: Change the directory for file transfer to default public directory. e.g chdir /Volumes/dir1/");

			} else if (command[0].equals("stop")) {
				System.out
						.println("Stopping server (when current transfers finish)");
				server.stop();
				scanner.close();
			} else if (command[0].equals("pwd")) {
				System.out.println("Current shared directory: "
						+ server.getPublicFolder());
			} else if (command[0].equals("chdir") && command.length > 1
					&& command[1].length() > 0) {
				if (new File(command[1]).isDirectory()) {
					if (!command[1].endsWith("/"))
						server.publicFolder = command[1] + File.separator;
				} else {
					System.out.println("Invalid directory");
				}
			} else if (command[0].equals("defaultdir")) {
				server.publicFolder = defaultDir;
			} else {
				System.out
						.println("Invalid command. These are the available commands:");
				System.out.println("    help: prints this help menu");
				System.out
						.println("    stop: stop the server (when current transfers finish)");
				System.out
						.println("    pwd: prints out the public directory for file transfers");
			}
		}
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
		requestListener.getSocket().close();
		System.out.println("Stopping... waiting for threads to finish");
		while (getThreadCount() > 0) {
			// Wait for threads to finish
			try {
				wait();
			} catch (InterruptedException e1) {
				System.out
						.println("Stopping was interrupted. Failed to stop properly.");
				System.exit(1);
			}
		}
		System.out.println("Exiting");
		System.exit(0);
	}

	public String getPublicFolder() {
		return publicFolder;
	}

	public TftpServerFileTransfer newTransferThread(TftpRequestPacket packet,
			InetAddress address, int port) {
		return new TftpServerFileTransfer(this, packet, address, port);
	}

}