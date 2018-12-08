package org.magcruise.gaming.langrid.client;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.magcruise.gaming.langrid.AccessConfig;
import org.magcruise.gaming.langrid.AccessConfigFactory;
import org.magcruise.gaming.langrid.ClientFactory;
import org.nkjmlab.util.lang.MessageUtils;

import jp.go.nict.langrid.commons.cs.binding.BindingNode;
import jp.go.nict.langrid.language.InvalidLanguageTagException;
import jp.go.nict.langrid.language.Language;
import jp.go.nict.langrid.service_1_2.AccessLimitExceededException;
import jp.go.nict.langrid.service_1_2.InvalidParameterException;
import jp.go.nict.langrid.service_1_2.NoAccessPermissionException;
import jp.go.nict.langrid.service_1_2.NoValidEndpointsException;
import jp.go.nict.langrid.service_1_2.ProcessFailedException;
import jp.go.nict.langrid.service_1_2.ServerBusyException;
import jp.go.nict.langrid.service_1_2.ServiceNotActiveException;
import jp.go.nict.langrid.service_1_2.ServiceNotFoundException;
import jp.go.nict.langrid.service_1_2.translation.TranslationService;

/**
 * 言語コードに関しては，以下のドキュメントを参照のこと．
 *
 * jp.go.nict.langrid.language.Language
 * http://langrid.org/developer/repo/java_apidocs_jp/jp/go/nict/langrid/language
 * /Language.html
 *
 * jp.go.nict.langrid.language.ISO639_1
 * http://langrid.org/developer/repo/java_apidocs_jp/jp/go/nict/langrid/language
 * /ISO639_1.html
 *
 * @author nkjm
 *
 */
public class TranslationClient {

	protected static Logger log = LogManager.getLogger();

	private TranslationService client;

	public static void main(String[] args) {

		TranslationClient tc = new TranslationClient(AccessConfigFactory.create(),
				TranslationServiceId.GoogleTranslate);
		//client = new TranslationClient("KyotoUJServer");

		log.debug(tc.translate("ja", "en", "今日は良い天気です．"));
		log.debug(tc.translate("ja", "vi", "今日は良い天気です．"));

	}

	public TranslationClient(TranslationServiceId serviceId, BindingNode... bindings) {
		this(serviceId.toString(), bindings);
	}

	public TranslationClient(String serviceId, BindingNode... bindings) {
		client = ClientFactory.create(
				jp.go.nict.langrid.service_1_2.translation.TranslationService.class,
				serviceId, bindings);
	}

	public TranslationClient(AccessConfig accessInfo, TranslationServiceId serviceId,
			BindingNode... bindings) {
		this(accessInfo, serviceId.toString(), bindings);
	}

	public TranslationClient(AccessConfig accessInfo, String serviceId, BindingNode... bindings) {
		client = ClientFactory.create(
				jp.go.nict.langrid.service_1_2.translation.TranslationService.class,
				accessInfo, serviceId, bindings);
	}

	public String translate(String sourceLang, String targetLang, String source) {
		if (sourceLang == null || targetLang == null) {
			throw new NullPointerException(MessageUtils.format(
					"All parameters should not be null. sourceLang={},targetLang={}",
					sourceLang, targetLang, source));
		}

		if (sourceLang.equals(targetLang)) {
			throw new IllegalArgumentException(MessageUtils.format(
					"The source language and the target language shuould not be same. {}, {}",
					sourceLang, source));
		}

		if (source == null || source.trim().length() == 0) {
			log.warn("Source shonld not be null and blank", sourceLang, targetLang, source);
			return "";
		}

		try {
			return client.translate(new Language(sourceLang).getCode(),
					new Language(targetLang).getCode(), source);
		} catch (AccessLimitExceededException | InvalidParameterException
				| NoAccessPermissionException | ProcessFailedException
				| NoValidEndpointsException | ServerBusyException
				| ServiceNotActiveException | ServiceNotFoundException
				| InvalidLanguageTagException e) {
			log.error(e, e);
			throw new RuntimeException(e);
		}
	}
}
