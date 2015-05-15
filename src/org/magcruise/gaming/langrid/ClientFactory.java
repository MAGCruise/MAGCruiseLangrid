package org.magcruise.gaming.langrid;

import gnu.lists.LList;

import java.net.MalformedURLException;
import java.net.URL;

import jp.go.nict.langrid.client.soap.SoapClientFactory;

public class ClientFactory {

	public static Object create(Class<?> clazz, String serviceInterfaceURL,
			String userId, String passwd, LList bindings) {

		try {
			Object client = new SoapClientFactory().create(clazz, new URL(
					serviceInterfaceURL), userId, passwd);
			BindingUtil.setBindings(client, bindings);
			return client;
		} catch (MalformedURLException e) {
			e.printStackTrace();

		}
		return null;
	}

}
