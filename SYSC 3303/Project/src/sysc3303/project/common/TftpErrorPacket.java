package sysc3303.project.common;

import java.io.ByteArrayOutputStream;

/**
 * @author Korey Conway (100838924)
 * @author Monisha (100871444)
 * @author Arzaan (100826631)
 */

public class TftpErrorPacket extends TftpPacket {
	private static final int OP_CODE = 5;
	private static final int MIN_LENGTH = 5;

	private ErrorType errorType;
	private String errorMessage;

	public enum ErrorType {
		NOT_DEFINED(0), FILE_NOT_FOUND(1), ACCESS_VIOLATION(2), DISC_FULL_OR_ALLOCATION_EXCEEDED(
				3), ILLEGAL_OPERATION(4), UNKOWN_TID(5), FILE_ALREADY_EXISTS(6), NO_SUCH_USER(
				7);
		private int code;

		ErrorType(int code) {
			this.code = code;
		}

		int getCode() {
			return code;
		}

		static ErrorType get(int code) throws IllegalArgumentException {
			for (ErrorType t : ErrorType.values()) {
				if (code == t.code) {
					return t;
				}
			}
			throw new IllegalArgumentException();
		}
	}

	/**
	 * Constructor
	 * 
	 * @param blockNumber
	 *            for the packet
	 * @throws IllegalArgumentException
	 */
	TftpErrorPacket(ErrorType errorType, String errorMessage)
			throws IllegalArgumentException {
		if (errorType == null) {
			throw new IllegalArgumentException();
		}
		this.errorType = errorType;
		this.type = Type.ERROR;
		this.errorMessage = (null == errorMessage) ? "" : errorMessage;
	}

	public ErrorType getErrorType() {
		return this.errorType;
	}
	
	public int getCode() {
		return this.errorType.getCode();
	}

	public String getErrorMessage() {
		return this.errorMessage;
	}
	
	public boolean shouldAbortTransfer() {
		return (this.errorType != ErrorType.UNKOWN_TID);
	}

	/**
	 * Generate the packet data
	 * 
	 * @return the byte array of the packet
	 * @see sysc3303.project.common.TftpPacket#generatePacketData()
	 */
	@Override
	public byte[] generateData() {
		ByteArrayOutputStream stream = new ByteArrayOutputStream();

		// Set op code
		stream.write(0);
		stream.write(OP_CODE);

		// Set error type
		stream.write(errorType.getCode() >> 8);
		stream.write(errorType.getCode());

		// Add error message, terminating with 0
		byte[] tempByteArr = errorMessage.getBytes();
		stream.write(tempByteArr, 0, tempByteArr.length);
		stream.write(0);

		// Convert to byte array and return
		return stream.toByteArray();
	}

	static TftpErrorPacket createFromBytes(byte[] packetData, int packetLength)
			throws IllegalArgumentException {
		// Make sure we don't have null
		if (packetData == null) {
			throw new IllegalArgumentException();
		}

		// Verify packet length is valid
		if (packetLength > packetData.length || packetLength < MIN_LENGTH
				|| packetLength > TftpPacket.MAX_LENGTH) {
			throw new IllegalArgumentException();
		}

		// Verify the op code and first byte of error code
		if (packetData[0] != 0 || packetData[1] != OP_CODE
				|| packetData[2] != 0) {
			throw new IllegalArgumentException();
		}

		// Get the error type
		int errorCode = packetData[3];
		ErrorType errorType = ErrorType.get(errorCode);

		// String is from packetData[4] until 2nd last character
		StringBuilder errorMessage = new StringBuilder();
		for (int i = 4; i < (packetLength - 1); i++) {
			if (0 == packetData[i]) {
				// We should never have a 0 byte in the error message
				throw new IllegalArgumentException();
			} else {
				errorMessage.append((char)packetData[i]);
			}
		}

		// Last character should be 0
		if (packetData[packetLength - 1] != 0) {
			throw new IllegalArgumentException();
		}

		return new TftpErrorPacket(errorType, errorMessage.toString());
	}

	public String toString() {
		StringBuilder str = new StringBuilder();

		// Set op code
		str.append(0);
		str.append((byte) OP_CODE);

		// Set error type
		str.append((byte) errorType.getCode() >> 8);
		str.append((byte) errorType.getCode());

		// Add error message, terminating with 0
		str.append(errorMessage);
		str.append(0);

		// Convert to String and return
		return str.toString();

	}
}
