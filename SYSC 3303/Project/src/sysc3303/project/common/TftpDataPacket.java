package sysc3303.project.common;

import java.io.ByteArrayOutputStream;

/**
 * @author Korey Conway (100838924)
 * @author Monisha (100871444)
 * @author Arzaan (100826631)
 */

public class TftpDataPacket extends TftpPacket {
	// the TFTP op code for a data packet
	private static final int OP_CODE = 4;

	// the maximum file data length that can be transmitted in a single TFTP
	// data packet
	public static final int MAX_FILE_DATA_LENGTH = 512;

	private static final int MIN_BLOCK_NUMBER = 1; // minimum block number
	private static final int MAX_BLOCK_NUMBER = 0xFFFF; // maximum block number

	// length needed for header (also is minimum length of data packet)
	private static final int PACKET_HEADER_LENGTH = 4;

	// block number for the packet
	private int blockNumber = 0;

	// data byte array from the file being read/written
	private byte[] fileData = null;

	/**
	 * Constructor
	 * 
	 * @param blockNumber
	 * @param fileData
	 * @param fileDataLength
	 */
	TftpDataPacket(int blockNumber, byte[] fileData, int fileDataLength) {
		// Block number must be unsigned 2 byte integer (between 1 and 0xFFFF)
		if (blockNumber < MIN_BLOCK_NUMBER || blockNumber > MAX_BLOCK_NUMBER) {
			throw new IllegalArgumentException("Invalid block number");
		}

		// if fileData is null, we must have a fileDataLength of 0
		if (fileData == null && fileDataLength != 0) {
			throw new IllegalArgumentException(
					"Data length must be 0 if data is null");
		}

		// fileDataLength can never exceed the array size of fileData, nor the
		// max size, and must be >= 0
		if (fileData != null
				&& (fileDataLength > fileData.length
						|| fileDataLength > MAX_FILE_DATA_LENGTH || fileDataLength < 0)) {
			throw new IllegalArgumentException("Invalid data length passed");
		}

		this.type = Type.DATA;
		this.blockNumber = blockNumber;
		if (fileData == null || fileDataLength == 0) {
			this.fileData = new byte[0];
		} else {
			this.fileData = new byte[fileDataLength];
			System.arraycopy(fileData, 0, this.fileData, 0, fileDataLength);
		}
	}

	/**
	 * Get the file data
	 * 
	 * @return the data byte array
	 */
	public byte[] getFileData() {
		return fileData;
	}

	/**
	 * Get the block number of the data packet
	 * 
	 * @return
	 */
	public int getBlockNumber() {
		return blockNumber;
	}

	/**
	 * Check if this is the last data packet
	 * 
	 * @return true if it is the last data packet, false otherwise
	 */
	public boolean isLastDataPacket() {
		return (fileData.length < MAX_FILE_DATA_LENGTH);
	}

	/**
	 * Create a data packet from bytes. WARNING: never use this method, it is
	 * only for TftpPacket to use.
	 * 
	 * @param packetData
	 * @param packetLength
	 *            length of datagram packet received (not data within the
	 *            datagram packet)
	 * @return
	 * @throws IllegalArgumentException
	 */
	static TftpDataPacket createFromBytes(byte[] packetData, int packetLength)
			throws IllegalArgumentException {
		// Make sure we don't have null
		if (packetData == null) {
			throw new IllegalArgumentException("No valid data found");
		}

		// Verify packet length is valid
		if (packetLength > packetData.length
				|| packetLength < PACKET_HEADER_LENGTH
				|| packetLength > TftpPacket.MAX_LENGTH) {
			throw new IllegalArgumentException("Invalid packet length");
		}

		// Verify the op code
		if (packetData[0] != 0 || packetData[1] != OP_CODE) {
			throw new IllegalArgumentException("Invalid opcode");
		}

		// Extract the file data and block number
		int blockNumber = ((packetData[2] << 8) & 0xFF00)
				| (packetData[3] & 0xFF);
		ByteArrayOutputStream stream = new ByteArrayOutputStream();
		stream.write(packetData, PACKET_HEADER_LENGTH, packetLength
				- PACKET_HEADER_LENGTH);
		packetData = stream.toByteArray();
		return new TftpDataPacket(blockNumber, packetData, packetData.length);
	}

	/**
	 * Generate the packet data
	 * 
	 * @return the byte array of the packet
	 * @see sysc3303.project.common.TftpPacket#generateData()
	 */
	@Override
	public byte[] generateData() {
		ByteArrayOutputStream stream = new ByteArrayOutputStream();
		stream.write(0);
		stream.write(OP_CODE);
		stream.write(blockNumber >> 8);
		stream.write(blockNumber);
		stream.write(fileData, 0, fileData.length);
		return stream.toByteArray();
	}

	/**
	 * Convert the request into a visual packet string (for debugging/logging
	 * only)
	 * 
	 * @return a string representation of the packet
	 * @see sysc3303.project.common.TftpPacket#toString()
	 */
	@Override
	public String toString() {
		StringBuilder str = new StringBuilder();

		// Header bytes shown as integers
		str.append(0);
		str.append((byte) OP_CODE);
		str.append((byte) (blockNumber >> 8));
		str.append((byte) blockNumber);

		// Data bytes as hexadecimal
		for (byte b : fileData) {
			str.append(String.format("%x", b));
		}

		return str.toString();
	}
}