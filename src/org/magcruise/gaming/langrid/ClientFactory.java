package org.magcruise.gaming.langrid;

import java.net.MalformedURLException;
import java.net.URL;

import gnu.lists.LList;
import jp.go.nict.langrid.client.soap.SoapClientFactory;

public class ClientFactory {

	public static <T> T create(Class<T> clazz, String serviceInterfaceURL,
			String userId, String passwd, LList bindings) {

		try {
			T client = new SoapClientFactory().create(clazz,
					new URL(serviceInterfaceURL), userId, passwd);
			BindingUtil.setBindings(client, bindings);
			return client;
		} catch (MalformedURLException e) {
			e.printStackTrace();

		}
		return null;
	}

}
