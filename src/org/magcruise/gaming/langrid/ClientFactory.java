package org.magcruise.gaming.langrid;

import java.net.MalformedURLException;
import java.net.URL;

import gnu.lists.LList;
import jp.go.nict.langrid.client.soap.SoapClientFactory;
import jp.go.nict.langrid.commons.cs.binding.BindingNode;

public class ClientFactory {

	private static AccessConfig accessInfo;

	public static void setAccessInfo(AccessConfig accessInfo) {
		ClientFactory.accessInfo = accessInfo;
	}

	public static <T> T create(Class<T> clazz, String serviceId,
			BindingNode... bindings) {
		AccessConfig accessInfo = getAccessInfo();
		return create(clazz, accessInfo, serviceId, bindings);

	}

	private static AccessConfig getAccessInfo() {
		if (accessInfo == null) {
			throw new RuntimeException();
		}
		return accessInfo;
	}

	public static <T> T create(Class<T> clazz, AccessConfig accessInfo,
			String serviceId, BindingNode... bindings) {
		return create(clazz,
				accessInfo.getServiceInterfaceURL() + "/" + serviceId,
				accessInfo.getUserId(), accessInfo.getPassword(), bindings);
	}

	public static <T> T create(Class<T> clazz, String serviceInterfaceURL,
			String userId, String passwd, BindingNode... bindings) {
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
