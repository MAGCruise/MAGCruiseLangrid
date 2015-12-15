package org.magcruise.gaming.langrid;

import java.io.File;
import java.net.URISyntaxException;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.magcruise.gaming.manager.GameExecutorManager;
import org.magcruise.gaming.util.SExpressionUtils;

import gnu.mapping.Environment;
import kawa.standard.Scheme;

public class SchemePlugin {
	private static Logger log = LogManager.getLogger();

	public static void main(String[] args) {
		GameExecutorManager.getInstance()
				.loadFramework(SExpressionUtils.setUpEnvironment());
		SExpressionUtils.load(new File("sample/invocation.scm").toPath());

	}

	public static void load(Environment env) {

		try {
			Path framework = Paths.get(
					SchemePlugin.class.getResource("/scm/langrid.scm").toURI());
			log.debug("Load framework ... {}", framework);
			SExpressionUtils.load(env, framework);

		} catch (URISyntaxException e) {

			e.printStackTrace();
		}

	}

	public static void load() {
		Scheme.registerEnvironment();
		SchemePlugin.load(Environment.getCurrent());
	}

}
