package org.magcruise.gaming.langrid;

import java.net.URI;
import java.net.URISyntaxException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.magcruise.gaming.lang.SchemeEnvironment;

public class LangridSchemePlugin {
	private static Logger log = LogManager.getLogger();

	public static void load(String env) {
		try {
			URI framework = LangridSchemePlugin.class
					.getResource("/scm/langrid.scm").toURI();
			log.debug("Load framework ... {}", framework);
			SchemeEnvironment.load(env, framework);
		} catch (URISyntaxException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}

	}

	public static void setConfigFileInResource(String fileName) {
		AccessConfigFactory.setFileInResource(fileName);
	}

}
