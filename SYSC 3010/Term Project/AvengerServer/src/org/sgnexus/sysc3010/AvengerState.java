package org.sgnexus.sysc3010;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class AvengerState {
	HashMap<String, Motor> mMotors;
	HashMap<String, Led> mLeds;
	protected long mLastSentTime;
	protected int mControllerLockTimeout;

	enum ControllerId {
		NONE, REMOTE, GUI
	}

	protected ControllerId mCurrentController = ControllerId.NONE;

	AvengerState() {
		mMotors = new HashMap<String, Motor>();
		mLeds = new HashMap<String, Led>();
		mCurrentController = ControllerId.NONE;
	}

	protected Motor getMotor(String id) {
		return mMotors.get(id);
	}

	protected Led getLed(String id) {
		return mLeds.get(id);
	}

	void addMotor(Motor m) {
		mMotors.put(m.getId(), m);
	}

	void addLed(Led l) {
		mLeds.put(l.getId(), l);
	}

	void setLockTimeout(int lockTimeout) {
		mControllerLockTimeout = lockTimeout;
	}

	void updateLastSentTime() {
		mLastSentTime = System.currentTimeMillis();
	}

	synchronized boolean setMotorState(ControllerId source, String id,
			Motor.State state) throws NullPointerException, SecurityException {
		getLock(source);

		try {
			if (getMotor(id).setState(state)) {
				// Add to history if it is changed
				AvengerStateHistory.getInstance().addState(this);
			}
		} catch (NullPointerException e) {
			throw new NullPointerException("Could not find motor id=" + id);
		}

		return true;
	}

	synchronized boolean setLedState(ControllerId source, String id,
			Led.State state) throws NullPointerException, SecurityException {
		getLock(source);

		try {
			if (getLed(id).setState(state)) {
				// Add to history if it is changed
				AvengerStateHistory.getInstance().addState(this);
			}
		} catch (NullPointerException e) {
			throw new NullPointerException("Could not find led id=" + id);
		}

		return true;
	}

	synchronized boolean updateState(ControllerId source, AvengerState as)
			throws SecurityException {
		getLock(source);

		boolean changed = false;

		// Update motors
		for (Motor m : mMotors.values()) {
			try {
				if (m.setState(as.getMotor(m.getId()).getState())) {
					changed = true;
				}
			} catch (NullPointerException e) {
				// Ignore these exceptions, could possibly print send a warning
				// in future
			}
		}

		// Update LEDs
		for (Led l : mLeds.values()) {
			try {
				if (l.setState(as.getLed(l.getId()).getState())) {
					changed = true;
				}
			} catch (NullPointerException e) {
				// Ignore these exceptions, could possibly print send a warning
				// in future
			}
		}

		// Add updated state to history
		if (changed) {
			AvengerStateHistory.getInstance().addState(as);
		}

		return true;
	}

	synchronized protected void getLock(ControllerId controllerId)
			throws SecurityException {
		if (mCurrentController == controllerId) {
			// We already have the lock
			return;
		} else if (mLastSentTime < (System.currentTimeMillis() - mControllerLockTimeout)) {
			// Timeout expired so we can have lock
			mCurrentController = controllerId;
			return;
		} else {
			throw new SecurityException(
					"Robot already in use by other controller");
		}
	}

	public String toString() {
		return toXml();
	}

	static AvengerState LoadFromConfig() throws SAXException {
		return Config.getInstance().getAvengerState();
	}

	static AvengerState LoadFromXml(InputStream stream) throws SAXException {
		try {
			SAXParserFactory factory = SAXParserFactory.newInstance();
			SAXParser saxParser = factory.newSAXParser();
			AvengerState as = new AvengerState();
			SAXHandler handler = new SAXHandler(as);
			saxParser.parse(stream, handler);
			return as;
		} catch (ParserConfigurationException e) {
			throw new SAXException(e.getMessage());
		} catch (IOException e) {
			throw new SAXException(e.getMessage());
		} catch (SAXException e) {
			throw e;
		}
	}

	String toXml() {
		StringBuilder sb = new StringBuilder();

		// Add route tag
		sb.append("<avengerState>");

		// Add motors to XML
		sb.append("<motors>");
		for (Motor motor : mMotors.values()) {
			sb.append(motor.toXml());
		}
		sb.append("</motors>");

		// Add leds to XML
		sb.append("<leds>");
		for (Led led : mLeds.values()) {
			sb.append(led.toXml());
		}
		sb.append("</leds>");

		// Add end tag and return
		sb.append("</avengerState>");
		return sb.toString();
	}

	static protected class SAXHandler extends DefaultHandler {
		AvengerState mAvengerState;

		protected enum Section {
			MOTORS, LEDS
		}

		protected Section mSection;

		SAXHandler(AvengerState avengerState) {
			super();
			mAvengerState = avengerState;
		}

		public void startElement(String uri, String localName, String qName,
				Attributes attributes) throws SAXException {

			if (qName.equalsIgnoreCase("motors")) {
				// Mark that we are in the motors section
				mSection = Section.MOTORS;
			} else if (qName.equalsIgnoreCase("leds")) {
				// Mark that we are in the leds section
				mSection = Section.LEDS;
			} else if (qName.equalsIgnoreCase("motor")) {
				if (Section.MOTORS == mSection) {
					// Get the attributes and create the motor
					String id = attributes.getValue("id");
					String strState = attributes.getValue("state");
					Motor.State state = null;

					if (strState != null && strState.length() > 0) {
						state = Motor.State.valueOf(strState.toUpperCase());
					}

					mAvengerState.addMotor(new Motor(id, state));
				}
			} else if (qName.equalsIgnoreCase("led")) {
				if (Section.LEDS == mSection) {
					// Get the attributes and create the led
					String id = attributes.getValue("id");
					String strState = attributes.getValue("state");
					Led.State state = null;

					if (strState != null && strState.length() > 0) {
						state = Led.State.valueOf(strState.toUpperCase());
					}

					mAvengerState.addLed(new Led(id, state));
				}
			}
		}

		@Override
		public void endElement(String uri, String localName, String qName)
				throws SAXException {
			if (qName.equalsIgnoreCase("motors")
					|| qName.equalsIgnoreCase("leds")) {
				// Leaving a section, set section marker to null
				mSection = null;
			}
		}

	}

}
