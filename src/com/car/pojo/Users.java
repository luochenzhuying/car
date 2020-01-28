package com.car.pojo;

public class Users {

	private String userName;
	private String identity;
	private String fullName;
	private String sex;
	private String address;
	private String phone;
	private String position;
	private int userLevel;
	private String userPwd;

	public Users() {
		super();
	}

	public Users(String userName, String identity, String fullName, String sex, String address, String phone, String position, int userLevel, String userPwd) {
		super();
		this.userName = userName;
		this.identity = identity;
		this.fullName = fullName;
		this.sex = sex;
		this.address = address;
		this.phone = phone;
		this.position = position;
		this.userLevel = userLevel;
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public int getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	@Override
	public String toString() {
		return "Users [userName=" + userName + ", identity=" + identity + ", fullName=" + fullName + ", sex=" + sex + ", address=" + address + ", phone=" + phone + ", position=" + position + ", userLevel=" + userLevel + ", userPwd=" + userPwd + "]";
	}

}