package com.car.pojo;

public class Customers {
	private String identity;
	private String custName;
	private String sex;
	private String address;
	private String phone;
	private String carEer;
	private String custPwd;

	public Customers() {
		super();
	}

	public Customers(String identity, String custName, String sex, String address, String phone, String carEer, String custPwd) {
		super();
		this.identity = identity;
		this.custName = custName;
		this.sex = sex;
		this.address = address;
		this.phone = phone;
		this.carEer = carEer;
		this.custPwd = custPwd;
	}

	public String getidentity() {
		return identity;
	}

	public void setidentity(String identity) {
		this.identity = identity;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
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

	public String getCarEer() {
		return carEer;
	}

	public void setCarEer(String carEer) {
		this.carEer = carEer;
	}

	public String getCustPwd() {
		return custPwd;
	}

	public void setCustPwd(String custPwd) {
		this.custPwd = custPwd;
	}

	@Override
	public String toString() {
		return "Customers [identity=" + identity + ", custName=" + custName + ", sex=" + sex + ", address=" + address + ", phone=" + phone + ", carEer=" + carEer + ", custPwd=" + custPwd + "]";
	}

}