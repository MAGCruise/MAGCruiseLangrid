package org.magcruise.gaming.langrid;

import java.io.FileReader;
import java.io.IOException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import jp.go.nict.langrid.repackaged.net.arnx.jsonic.JSON;
import jp.go.nict.langrid.repackaged.net.arnx.jsonic.JSONException;

public class AccessConfigFactory {

	private static Logger log = LogManager.getLogger();
	private static gnu.kawa.io.Path pathToConfig;

	public static AccessConfig create(gnu.kawa.io.Path confFile) {
		try {
			return JSON.decode(confFile.toUri().toURL().openStream(),
					AccessConfig.class);
		} catch (JSONException | IOException e) {
			log.error(e, e);
			throw new RuntimeException(e);
		}
	}

	public static AccessConfig create(java.nio.file.Path confFile) {
		return create(gnu.kawa.io.Path.coerceToPathOrNull(confFile));
	}

	public static void setPath(java.nio.file.Path path) {
		pathToConfig = gnu.kawa.io.Path.coerceToPathOrNull(path);
	}

	public static void setPath(gnu.kawa.io.Path path) {
		pathToConfig = path;
	}

	public static AccessConfig create() {
		if (pathToConfig == null) {
			log.error(
					"path to langrid-conf.json has not been set yet. This method should be called after setPath method.");
			throw new RuntimeException();
		}
		return create(pathToConfig);
	}

}
