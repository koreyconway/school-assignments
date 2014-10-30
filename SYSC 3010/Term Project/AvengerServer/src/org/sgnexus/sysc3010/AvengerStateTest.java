package org.sgnexus.sysc3010;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.fail;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import org.junit.Before;
import org.junit.Test;
import org.sgnexus.sysc3010.AvengerState.ControllerId;
import org.xml.sax.SAXException;

public class AvengerStateTest {
	protected AvengerState mAs;

	@Before
	public void setUp() throws Exception {
		mAs = new AvengerState();
	}

	@Test
	public void testAddMotor() {
		Motor hulk = new Motor("hulk");
		mAs.addMotor(hulk);

		Motor ironMan = new Motor("ironMan");
		mAs.addMotor(ironMan);

		assertEquals(hulk, mAs.getMotor("hulk"));
		assertEquals(ironMan, mAs.getMotor("ironMan"));
	}

	@Test
	public void testAddLed() {
		Led hawk = new Led("hawkeye");
		mAs.addLed(hawk);

		Led id1 = new Led("1");
		mAs.addLed(id1);

		assertEquals(hawk, mAs.getLed("hawkeye"));
		assertEquals(id1, mAs.getLed("1"));
	}

	@Test
	public void testToString() {
		Motor hulk = new Motor("hulk");
		mAs.addMotor(hulk);

		Motor ironMan = new Motor("ironMan", Motor.State.FORWARD);
		mAs.addMotor(ironMan);

		Led hawk = new Led("hawkeye", Led.State.ON);
		mAs.addLed(hawk);

		Led id1 = new Led("1");
		mAs.addLed(id1);

		System.out.println(mAs.toXml());

		String s = "<avengerState><motors><motor id=\"hulk\" state=\"off\" /><motor id=\"ironMan\" state=\"forward\" /></motors><leds><led id=\"1\" state=\"off\" /><led id=\"hawkeye\" state=\"on\" /></leds></avengerState>";
		assertEquals(s, mAs.toString());
	}

	@Test
	public void testUpdateState() {
		mAs.addMotor(new Motor("hulk", Motor.State.OFF));
		mAs.addMotor(new Motor("ironman", Motor.State.OFF));
		mAs.addMotor(new Motor("thor", Motor.State.OFF));
		mAs.addLed(new Led("hawkeye", Led.State.OFF));

		AvengerState st = new AvengerState();
		st.addMotor(new Motor("hulk", Motor.State.REVERSE));
		st.addMotor(new Motor("ironman", Motor.State.FORWARD));
		st.addMotor(new Motor("thor", Motor.State.OFF));

		mAs.updateState(ControllerId.REMOTE, st);

		assertEquals(Motor.State.REVERSE, mAs.getMotor("hulk").getState());
		assertEquals(Motor.State.FORWARD, mAs.getMotor("ironman").getState());
		assertEquals(Motor.State.OFF, mAs.getMotor("thor").getState());
		assertEquals(Led.State.OFF, mAs.getLed("hawkeye").getState());
	}

	@Test
	public void testLoadFromXml() {
		String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
				+ "<avengerState>" + "<motors>"
				+ "<motor id=\"hulk\" state=\"off\" />"
				+ "<motor id=\"thor\" state=\"off\" />" + "</motors>"
				+ "<leds>" + "<led id=\"hawkeye\" state=\"on\" />" + "</leds>"
				+ "</avengerState>";

		InputStream stream = new ByteArrayInputStream(xml.getBytes());
		try {
			mAs = AvengerState.LoadFromXml(stream);

			Motor m = mAs.getMotor("nothing");
			assertNull(m);

			m = mAs.getMotor("hulk");
			assertNotNull("hulk is null", m);
			m.setState(Motor.State.FORWARD);

			m = mAs.getMotor("thor");
			assertNotNull(m);
			m.setState(Motor.State.REVERSE);

			Led l = mAs.getLed("hawkeye");
			assertNotNull(l);
			assertEquals(Led.State.ON, l.getState());
		} catch (SAXException e) {
			fail("SAXException: " + e.getMessage());
		}
	}

	@Test
	public void testToXml() {
		Motor hulk = new Motor("hulk");
		mAs.addMotor(hulk);

		Motor ironMan = new Motor("ironMan", Motor.State.FORWARD);
		mAs.addMotor(ironMan);

		Led hawk = new Led("hawkeye", Led.State.ON);
		mAs.addLed(hawk);

		Led id1 = new Led("1");
		mAs.addLed(id1);

		System.out.println(mAs.toXml());

		String s = "<avengerState><motors><motor id=\"hulk\" state=\"off\" /><motor id=\"ironMan\" state=\"forward\" /></motors><leds><led id=\"1\" state=\"off\" /><led id=\"hawkeye\" state=\"on\" /></leds></avengerState>";
		assertEquals(s, mAs.toString());
	}

}
