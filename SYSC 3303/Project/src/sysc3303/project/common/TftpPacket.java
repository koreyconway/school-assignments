package sysc3303.project.common;

import java.net.DatagramPacket;
import java.net.InetAddress;

import sysc3303.project.common.TftpRequestPacket.Action;
import sysc3303.project.common.TftpRequestPacket.Mode;

/**
 * @author Korey Conway (100838924)
 * @author Monisha (100871444)
 * @author Arzaan (100826631)
 */

public abstract class TftpPacket {
	static final int MAX_LENGTH = 516;
	private static final int MIN_LENGTH = 4;

	public enum Type {
		RRQ, WRQ, DATA, ACK, ERROR
	}

	Type type;

	/**
	 * Get the associated packet type (RRQ, WRQ, DATA, ACK, or ERROR)
	 * 
	 * @return the type of packet
	 */
	public Type getType() {
		return type;
	}

	/**
	 * Factory method to create a read request
	 * 
	 * @param filename
	 *            filename of the file to be read
	 * @return a read RequestPacket
	 */
	public static TftpRequestPacket createReadRequest(String filename, Mode mode) {
		return new TftpRequestPacket(filename, Action.READ, mode);
	}

	/**
	 * Factory method to create a write request
	 * 
	 * @param filename
	 *            filename of the file to be written
	 * @return a write RequestPacket
	 */
	public static TftpRequestPacket createWriteRequest(String filename,
			Mode mode) {
		return new TftpRequestPacket(filename, Action.WRITE, mode);
	}

	/**
	 * Factory method to create an ack packet
	 * 
	 * @param blockNumber
	 *            block number of the ack
	 * @return an TftpAckPacket
	 */
	public static TftpAckPacket createAckPacket(int blockNumber) {
		return new TftpAckPacket(blockNumber);
	}

	/**
	 * Factory method to create a data packet
	 * 
	 * @param blockNumber
	 *            block number of the data
	 * @param data
	 *            data byte array
	 * @param dataLength
	 *            length of the data that is valid in data
	 * @return a TftpDataPacket
	 */
	public static TftpDataPacket createDataPacket(int blockNumber, byte[] data,
			int dataLength) {
		return new TftpDataPacket(blockNumber, data, dataLength);
	}

	public static TftpErrorPacket createErrorPacket(
			TftpErrorPacket.ErrorType errorType, String errorMessage) {
		return new TftpErrorPacket(errorType, errorMessage);
	}

	/**
	 * Create a TFTP packet from the received datagram.
	 * 
	 * @param datagram
	 * @return
	 * @throws IllegalArgumentException
	 */
	public static TftpPacket createFromDatagram(DatagramPacket datagram)
			throws IllegalArgumentException {
		return TftpPacket.createFromBytes(datagram.getData(),
				datagram.getLength());
	}

	/**
	 * Create a TFTP packet from the given data.
	 * 
	 * @param packetData
	 * @param packetLength
	 * @return
	 * @throws IllegalArgumentException
	 */
	private static TftpPacket createFromBytes(byte[] packetData,
			int packetLength) throws IllegalArgumentException {
		// Check that the packet length makes sense and is long enough
		if (packetData.length < packetLength || packetLength < MIN_LENGTH) {
			throw new IllegalArgumentException(
					"packet Length is less than minimum length");
		}

		// First should always be 0
		if (packetData[0] != 0) {
			throw new IllegalArgumentException("Invalid opcode");
		}

		switch (packetData[1]) {
		case 1:
			return TftpRequestPacket.createFromBytes(packetData, packetLength);
		case 2:
			return TftpRequestPacket.createFromBytes(packetData, packetLength);
		case 3:
			return TftpAckPacket.createFromBytes(packetData, packetLength);
		case 4:
			return TftpDataPacket.createFromBytes(packetData, packetLength);
		case 5:
			return TftpErrorPacket.createFromBytes(packetData, packetLength);
		default:
			throw new IllegalArgumentException("Invalid opcode");
		}
	}

	/**
	 * Create a datagram packet used for receiving. It will automatically assign
	 * the maximum length of a possible TFTP packet for the data array. This is
	 * a convenience method.
	 * 
	 * @return a DatagramPacket for receiving
	 */
	public static DatagramPacket createDatagramForReceiving() {
		return new DatagramPacket(new byte[MAX_LENGTH * 2], MAX_LENGTH * 2);
	}

	/**
	 * Generate a UDP datagram packet from the current data. This is a
	 * convenience method.
	 * 
	 * @param remoteAddress
	 * @param remotePort
	 * @return a DatagramPacket ready to be sent through a socket
	 */
	public DatagramPacket generateDatagram(InetAddress remoteAddress,
			int remotePort) {
		byte data[] = this.generateData();
		return new DatagramPacket(data, data.length, remoteAddress, remotePort);
	}

	/**
	 * Generate the packet data used for the DatagramPacket. Must be implemented
	 * by extending classes.
	 * 
	 * @return the byte array of the packet
	 */
	public abstract byte[] generateData();

	/**
	 * Convert the request into a visual packet string (for debugging/logging
	 * only)
	 * 
	 * @return a string representation of the packet
	 */
	public String toString() {
		byte[] packetBytes = this.generateData();
		StringBuilder packetString = new StringBuilder(4);
		for (byte b : packetBytes) {
			packetString.append(String.format("%x", b));
		}
		return packetString.toString();
	}
}
