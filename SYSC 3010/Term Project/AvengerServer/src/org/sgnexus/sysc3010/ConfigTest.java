package org.sgnexus.sysc3010;

import static org.junit.Assert.*;

import org.junit.Test;

public class ConfigTest {

	@Test
	public void testConfig() {
		try {
			Config c;
			c = Config.getInstance();
			assertTrue("Invalid port:" + c.getPort(), c.getPort() > 0);
			assertTrue("Invalid lock timeout: " + c.getLockTimeout(), c.getLockTimeout() > 0);
			assertTrue(c.getResendTimeout() > 0);
			assertTrue(c.getDestinationPort() > 0);
			assertNotNull(c.getDestinationHost());
			assertNotNull(c.getAvengerState());
		} catch (Exception e) {
			fail("Failed to parse XML: " + e.getMessage());
		}
	}
}
