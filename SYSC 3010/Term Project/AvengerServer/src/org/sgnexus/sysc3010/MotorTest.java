package org.sgnexus.sysc3010;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import org.junit.Test;
import org.sgnexus.sysc3010.Motor.State;

public class MotorTest {

	@Test
	public void testMotorInteger() {
		Motor m = new Motor(1234);
		assertEquals("1234", m.getId());
		assertEquals(State.OFF, m.getState());
	}

	@Test
	public void testMotorString() {
		Motor m = new Motor("whatdoesthefoxsay?");
		assertEquals("whatdoesthefoxsay?", m.getId());
		assertEquals(State.OFF, m.getState());
	}

	@Test
	public void testMotorIntegerState() {
		Motor m = new Motor(1234, State.FORWARD);
		assertEquals("1234", m.getId());
		assertEquals(State.FORWARD, m.getState());

		m = new Motor(34, State.OFF);
		assertEquals("34", m.getId());
		assertEquals(State.OFF, m.getState());

		m = new Motor(1, State.REVERSE);
		assertEquals("1", m.getId());
		assertEquals(State.REVERSE, m.getState());
	}

	@Test
	public void testMotorStringState() {
		Motor m = new Motor("whatdoesthefoxsay?", State.FORWARD);
		assertEquals("whatdoesthefoxsay?", m.getId());
		assertEquals(State.FORWARD, m.getState());

		m = new Motor("avengerArm", State.OFF);
		assertEquals("avengerArm", m.getId());
		assertEquals(State.OFF, m.getState());

		m = new Motor("15", State.REVERSE);
		assertEquals("15", m.getId());
		assertEquals(State.REVERSE, m.getState());
		
		Motor.State st = null;
		m = new Motor("hulk", st);
		assertEquals(State.OFF, m.getState());

		try {
			String s = null;
			m = new Motor(s);
			fail("Motor should throw exception when given null for id");
		} catch (IllegalArgumentException e) {
			// This is what we expected
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}

	@Test
	public void testSetState() {
		Motor m = new Motor("1");
		m.setState(State.REVERSE);
		assertEquals(State.REVERSE, m.getState());

		m.setState(State.FORWARD);
		assertEquals(State.FORWARD, m.getState());
	}

	@Test
	public void testToString() {
		Motor m = new Motor("2", State.REVERSE);
		String s = "Motor: id=2, state=reverse";
		assertEquals(s, m.toString());
	}

	@Test
	public void testToXml() {
		Motor m = new Motor("2", State.REVERSE);
		String s = "<motor id=\"2\" state=\"reverse\" />";
		assertEquals(s, m.toXml());
	}

}
