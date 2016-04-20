package org.magcruise.gaming.langrid;

import java.io.File;
import java.net.URI;
import java.net.URISyntaxException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.magcruise.gaming.lang.SchemeEnvironment;

public class SchemePlugin {
	private static Logger log = LogManager.getLogger();

	public static void main(String[] args) {
		SchemeEnvironment env = SchemeEnvironment
				.createNewEnvironmentAndSetCurrent();
		env.load(new File("sample/invocation.scm").toURI());
	}

	public static void load(SchemeEnvironment env) {

		try {
			URI framework = SchemePlugin.class.getResource("/scm/langrid.scm")
					.toURI();
			log.debug("Load framework ... {}", framework);
			env.load(framework);
		} catch (URISyntaxException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}

	}

}
