package com.car.pojo;

import java.util.Date;

public class LoginLogs {
	private int loginLogId;
	private String loginName;
	private String loginIp;
	private Date loginTime;

	public LoginLogs() {
		super();
	}

	public LoginLogs(int loginLogId, String loginName, String loginIp, Date loginTime) {
		super();
		this.loginLogId = loginLogId;
		this.loginName = loginName;
		this.loginIp = loginIp;
		this.loginTime = loginTime;
	}

	public int getLoginLogId() {
		return loginLogId;
	}

	public void setLoginLogId(int loginLogId) {
		this.loginLogId = loginLogId;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public Date getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	@Override
	public String toString() {
		return "LoginLogs [loginLogId=" + loginLogId + ", loginName=" + loginName + ", loginIp=" + loginIp + ", loginTime=" + loginTime + "]";
	}

}