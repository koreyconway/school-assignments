package org.sgnexus.sysc3010;

public class ServerException extends Exception {

	private static final long serialVersionUID = 383380816664716109L;

	public ServerException() {
	}

	public ServerException(String message) {
		super(message);
	}

	public ServerException(Throwable cause) {
		super(cause);
	}

	public ServerException(String message, Throwable cause) {
		super(message, cause);
	}

}
