package org.magcruise.gaming.langrid;

import java.net.URISyntaxException;

import org.junit.Before;
import org.junit.Test;
import org.magcruise.gaming.lang.SchemeEnvironment;
import org.magcruise.gaming.langrid.LangridSchemePlugin;

public class LangridSchemePluginTest {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() throws URISyntaxException {
		LangridSchemePlugin.load("main");
		LangridSchemePlugin.setConfigFileInResource("/langrid-conf.json");
		SchemeEnvironment.load("main", LangridSchemePluginTest.class
				.getResource("langrid-invocation-test.scm").toURI());

	}

}
