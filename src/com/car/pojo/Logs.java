package com.car.pojo;

import java.util.Date;

public class Logs {
	private int id;
	private String userName;
	private String action;
	private Date actionTime;
	private int flag;

	public Logs() {
		super();
	}

	public Logs(int id, String userName, String action, Date actionTime, int flag) {
		super();
		this.id = id;
		this.userName = userName;
		this.action = action;
		this.actionTime = actionTime;
		this.flag = flag;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public Date getActionTime() {
		return actionTime;
	}

	public void setActionTime(Date actionTime) {
		this.actionTime = actionTime;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	@Override
	public String toString() {
		return "Logs [id=" + id + ", userName=" + userName + ", action=" + action + ", actionTime=" + actionTime + ", flag=" + flag + "]";
	}

}