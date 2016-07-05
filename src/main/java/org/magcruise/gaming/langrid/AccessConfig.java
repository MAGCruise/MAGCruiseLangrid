package org.magcruise.gaming.langrid;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class AccessConfig {

	private String serviceInterfaceURL = "http://langrid.org/service_manager/invoker";
	private String userId;
	private String password;

	public AccessConfig() {
	}

	public AccessConfig(String userId, String password) {
		this.userId = userId;
		this.password = password;
	}

	public String getServiceInterfaceURL() {
		return serviceInterfaceURL;
	}

	public String getPassword() {
		return password;
	}

	public String getUserId() {
		return userId;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,
				ToStringStyle.SHORT_PREFIX_STYLE);
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
