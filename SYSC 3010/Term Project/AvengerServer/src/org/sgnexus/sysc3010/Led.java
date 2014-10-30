package org.sgnexus.sysc3010;

public class Led {
	protected String mId;
	protected State mState;

	enum State {
		OFF, ON;

		@Override
		public String toString() {
			if (OFF == this) {
				return "off";
			} else if (ON == this) {
				return "on";
			} else {
				return "null";
			}
		}
	}

	public Led(String id, State state) throws IllegalArgumentException {
		if (id == null || id.length() == 0) {
			throw new IllegalArgumentException("Invalid id for LED");
		}

		mId = id;
		mState = (state == null) ? State.OFF : state;
	}

	public Led(Integer id, State state) throws IllegalArgumentException {
		this(id.toString(), state);
	}

	public Led(String id) throws IllegalArgumentException {
		this(id, State.OFF);
	}

	public Led(Integer id) throws IllegalArgumentException {
		this(id.toString(), State.OFF);
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
		return "LED: id=" + mId + ", state=" + mState.toString();
	}

	public String toXml() {
		return "<led id=\"" + mId + "\" state=\"" + mState.toString() + "\" />";
	}

}
