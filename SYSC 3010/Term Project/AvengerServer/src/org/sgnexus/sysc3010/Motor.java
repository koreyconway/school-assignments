package org.sgnexus.sysc3010;

public class Motor {
	protected String mId;
	protected State mState;

	enum State {
		OFF, FORWARD, REVERSE;

		@Override
		public String toString() {
			if (OFF == this) {
				return "off";
			} else if (FORWARD == this) {
				return "forward";
			} else if (REVERSE == this) {
				return "reverse";
			} else {
				return "null";
			}
		}
	}

	public Motor(String id, State state) throws IllegalArgumentException {
		if (id == null || id.length() == 0) {
			throw new IllegalArgumentException("Invalid id for motor");
		}

		mId = id;
		mState = (state == null) ? State.OFF : state;
	}

	public Motor(Integer id, State state) throws IllegalArgumentException {
		this(id.toString(), state);
	}

	public Motor(String id) throws IllegalArgumentException {
		this(id, State.OFF);
	}

	public Motor(Integer id) throws IllegalArgumentException {
		this(id, State.OFF);
	}

	String getId() {
		return mId;
	}

	State getState() {
		return mState;
	}

	boolean setState(State state) {
		if (state == null) {
			state = State.OFF;
		}

		if (getState() == state) {
			return false;
		} else {
			this.mState = state;
			return true;
		}
	}

	public String toString() {
		return "Motor: id=" + mId + ", state=" + mState.toString();
	}

	public String toXml() {
		return "<motor id=\"" + mId + "\" state=\"" + mState.toString()
				+ "\" />";
	}

}
