package org.magcruise.gaming.langrid;

import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import jp.go.nict.langrid.repackaged.net.arnx.jsonic.JSON;
import jp.go.nict.langrid.repackaged.net.arnx.jsonic.JSONException;

public class AccessConfigFactory {

	private static Logger log = LogManager.getLogger();

	public static void main(String[] args) {
		System.out.println(AccessConfigFactory.create());
	}

	public static AccessConfig create(Path confFile) {
		try {
			return JSON.decode(new FileReader(confFile.toFile()),
					AccessConfig.class);
		} catch (JSONException | IOException e) {
			log.error(e, e);
			throw new RuntimeException(e);
		}
	}

	public static AccessConfig create() {
		return create(
				Paths.get("../MAGCruiseLangrid/config/langrid-conf.json"));
	}

}
