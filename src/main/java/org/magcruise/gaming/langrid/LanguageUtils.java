package org.magcruise.gaming.langrid;

import jp.go.nict.langrid.language.InvalidLanguageTagException;
import jp.go.nict.langrid.language.Language;

public class LanguageUtils {

	public static Language parse(String code) {
		try {
			return new Language(code);
		} catch (InvalidLanguageTagException e) {
			throw new IllegalArgumentException(e);
		}
	}

}
