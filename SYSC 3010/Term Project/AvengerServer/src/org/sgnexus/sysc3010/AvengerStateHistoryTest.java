package org.sgnexus.sysc3010;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class AvengerStateHistoryTest {
	AvengerStateHistory mHistory;

	@Before
	public void setUp() throws Exception {
		mHistory = AvengerStateHistory.getInstance();
	}

	@Test
	public void testGetInstance() {
		assertTrue(mHistory instanceof AvengerStateHistory);
	}

	@Test
	public void testAddState() {
		AvengerState state;
		state = new AvengerState();
		state.addMotor(new Motor("hulk"));
		String currentHistory = mHistory.toString();
		mHistory.addState(state);
		assertEquals(
				currentHistory +
				"<avengerState><motors><motor id=\"hulk\" state=\"off\" /></motors><leds></leds></avengerState>\n",
				mHistory.toString());

		System.out.println(mHistory.toString());
	}

}
