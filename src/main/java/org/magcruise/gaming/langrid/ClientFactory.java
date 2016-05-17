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

	public static <T> T create(Class<T> clazz, String serviceId,
			LList bindings) {

		AccessConfig accessInfo = getAccessInfo();
		T client = create(clazz, accessInfo, serviceId);
		if (bindings.isEmpty() || bindings.get(0) instanceof LList
				&& ((LList) bindings.get(0)).isEmpty()) {
			return client;
		}

		BindingUtils.setBindings(client, bindings);
		return client;

	}

	private static AccessConfig getAccessInfo() {
		if (accessInfo == null) {
			accessInfo = AccessConfigFactory.create();
		}
		return accessInfo;
	}

	public static <T> T create(Class<T> clazz, AccessConfig accessInfo,
			String serviceId, BindingNode... bindings) {
		try {
			T client = new SoapClientFactory().create(clazz,
					new URL(accessInfo.getServiceInterfaceURL() + "/"
							+ serviceId),
					accessInfo.getUserId(), accessInfo.getPassword());
			BindingUtils.setBindings(client, bindings);
			return client;
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
