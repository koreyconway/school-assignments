package org.sgnexus.sysc3010;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)
@SuiteClasses({ AvengerStateTest.class, ConfigTest.class, LedTest.class,
		MotorTest.class, ServerTest.class, AvengerStateHistoryTest.class })

public class RunTests {
	private RunTests() {
		// Dummy constructor, no need to ever instantiate
	}
}
