package org.sgnexus.sysc3010;

import java.io.File;
import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class Config {
	protected static String defaultConfigFileName = "xml/config.xml";
	protected static Config sInstance; // Singleton pattern
	protected int mPort = 0;
	protected String mConfigFileName;
	protected AvengerState mState;
	protected String mDestinationHost;
	protected int mResendInterval;
	protected int mLockTimeout;
	protected int mDestinationPort;

	protected Config(String configFileName) throws SAXException {
		mConfigFileName = configFileName;
		mState = new AvengerState();
		File fXmlFile = new File(configFileName);
		loadConfigFromFile(fXmlFile);
	}

	protected Config() throws SAXException {
		this(defaultConfigFileName);
	}

	static public Config getInstance() throws SAXException {
		if (sInstance == null) {
			sInstance = new Config();
		}
		return sInstance;
	}

	AvengerState getAvengerState() {
		return mState;
	}

	int getPort() {
		return mPort;
	}
	
	int getDestinationPort() {
		return mDestinationPort;
	}

	int getResendTimeout() {
		return mResendInterval;
	}

	int getLockTimeout() {
		return mLockTimeout;
	}

	String getDestinationHost() {
		return mDestinationHost;
	}

	protected void loadConfigFromFile(File f) throws SAXException {
		try {
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder dBuilder;
			dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(f);
			Element docElem = doc.getDocumentElement();
			NodeList nl = docElem.getChildNodes();
			for (int i = 0; i < nl.getLength(); i++) {
				if (nl.item(i).getNodeType() == Node.ELEMENT_NODE) {
					handleElement((Element) nl.item(i));
				}
			}
		} catch (ParserConfigurationException e) {
			throw new SAXException(e.getMessage());
		} catch (IOException e) {
			throw new SAXException(e.getMessage());
		} catch (SAXException e) {
			throw e;
		}
	}

	protected void handleElement(Element e) throws SAXException {
		String tag = e.getNodeName();
		if ("port".equalsIgnoreCase(tag)) {
			mPort = Integer.parseInt(e.getTextContent());
		} else if ("motors".equalsIgnoreCase(tag)
				|| "leds".equalsIgnoreCase(tag)) {
			// Loop through each child and call back to find motor and led
			// elements
			NodeList nl = e.getChildNodes();
			for (int i = 0; i < nl.getLength(); i++) {
				if (nl.item(i).getNodeType() == Node.ELEMENT_NODE) {
					handleElement((Element) nl.item(i));
				}
			}
		} else if ("motor".equalsIgnoreCase(tag)) {
			// Get the ID and validate it
			String id = e.getAttribute("id");
			if (id == null || id.length() == 0) {
				throw new SAXException("Motor is missing require id attribute");
			}

			mState.addMotor(new Motor(id));
		} else if ("led".equalsIgnoreCase(tag)) {
			// Get the ID and validate it
			String id = e.getAttribute("id");
			if (id == null || id.length() == 0) {
				throw new SAXException("Led is missing require id attribute");
			}

			mState.addLed(new Led(id));
		} else if ("destinationHost".equalsIgnoreCase(tag)) {
			mDestinationHost = e.getTextContent();
		} else if ("lockTimeout".equalsIgnoreCase(tag)) {
			mLockTimeout = Integer.parseInt(e.getTextContent());
			mState.setLockTimeout(mLockTimeout);
		} else if ("resendInterval".equalsIgnoreCase(tag)) {
			mResendInterval = Integer.parseInt(e.getTextContent());
		} else if ("destinationPort".equalsIgnoreCase(tag)) {
			mDestinationPort = Integer.parseInt(e.getTextContent());
		}
	}

}
