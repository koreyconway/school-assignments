package org.sgnexus.sysc3010;

import static org.junit.Assert.*;

import org.junit.Test;
import org.sgnexus.sysc3010.Led.State;

public class LedTest {

	@Test
	public void testLedInteger() {
		Led l = new Led(4);
		assertEquals("4", l.getId());
		assertEquals(Led.State.OFF, l.getState());
	}

	@Test
	public void testLedString() {
		Led l = new Led("hawkeye");
		assertEquals("hawkeye", l.getId());
		assertEquals(Led.State.OFF, l.getState());
	}

	@Test
	public void testLedIntegerState() {
		Led l = new Led(78, State.ON);
		assertEquals("78", l.getId());
		assertEquals(Led.State.ON, l.getState());
	}

	@Test
	public void testLedStringState() {
		Led l = new Led("hawkeye", State.ON);
		assertEquals("hawkeye", l.getId());
		assertEquals(Led.State.ON, l.getState());

		Led.State st = null;
		l = new Led("eye", st);
		assertEquals(State.OFF, l.getState());

		try {
			String s = null;
			l = new Led(s);
			fail("Motor should throw exception when given null for id");
		} catch (IllegalArgumentException e) {
			// This is what we expected
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}

	@Test
	public void testSetState() {
		Led l = new Led("hawkeye", State.ON);
		assertEquals(Led.State.ON, l.getState());
		l.setState(State.OFF);
		assertEquals(Led.State.OFF, l.getState());
	}

	@Test
	public void testToString() {
		Led l = new Led("hawkeye", State.ON);
		String s = "LED: id=hawkeye, state=on";
		assertEquals(s, l.toString());
	}

	@Test
	public void testToXml() {
		Led l = new Led("hawkeye", State.OFF);
		String s = "<led id=\"hawkeye\" state=\"off\" />";
		assertEquals(s, l.toXml());
	}

}
