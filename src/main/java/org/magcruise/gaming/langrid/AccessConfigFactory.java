package org.magcruise.gaming.langrid;

import java.io.IOException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.nkjmlab.util.langrid.AccessConfig;

import jp.go.nict.langrid.repackaged.net.arnx.jsonic.JSON;
import jp.go.nict.langrid.repackaged.net.arnx.jsonic.JSONException;

public class AccessConfigFactory {

	private static Logger log = LogManager.getLogger();
	private static AccessConfig config = null;

	public static void setFileInResource(Class<?> clazz, String fileName) {
		config = create(gnu.kawa.io.Path.coerceToPathOrNull(clazz.getResource(fileName)));
	}

	private static AccessConfig create(gnu.kawa.io.Path confFile) {
		log.debug(confFile);
		try {
			if (confFile.isPlainFile()) {
				return JSON.decode(confFile.openInputStream(), AccessConfig.class);

			} else {
				return JSON.decode(confFile.toUri().toURL().openStream(), AccessConfig.class);
			}
		} catch (JSONException | IOException e) {
			log.error(e, e);
			throw new RuntimeException(e);
		}
	}

	public static AccessConfig create(java.nio.file.Path confFile) {
		return create(gnu.kawa.io.Path.coerceToPathOrNull(confFile));
	}

	public static void setPath(java.nio.file.Path path) {
		config = create(gnu.kawa.io.Path.coerceToPathOrNull(path));
	}

	public static void setPath(gnu.kawa.io.Path path) {
		config = create(path);
	}

	public static AccessConfig create() {
		if (config == null) {
			String msg = "config file is not set yet.";
			log.error(msg);
			throw new IllegalStateException(msg);
		}
		return config;
	}

}
