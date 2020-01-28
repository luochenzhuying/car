package com.car.pojo;

public class Cars {
	private String carNumber;
	private String carType;
	private String color;
	private Double price;
	private Double rentPrice;
	private Double deposit;
	private String isRenting;
	private String carDesc;
	private String carImg;

	public Cars() {
		super();
	}

	public Cars(String carNumber, String carType, String color, Double price, Double rentPrice, Double deposit, String isRenting, String carDesc, String carImg) {
		super();
		this.carNumber = carNumber;
		this.carType = carType;
		this.color = color;
		this.price = price;
		this.rentPrice = rentPrice;
		this.deposit = deposit;
		this.isRenting = isRenting;
		this.carDesc = carDesc;
		this.carImg = carImg;
	}

	public String getCarNumber() {
		return carNumber;
	}

	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}

	public String getCarType() {
		return carType;
	}

	public void setCarType(String carType) {
		this.carType = carType;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getRentPrice() {
		return rentPrice;
	}

	public void setRentPrice(Double rentPrice) {
		this.rentPrice = rentPrice;
	}

	public Double getDeposit() {
		return deposit;
	}

	public void setDeposit(Double deposit) {
		this.deposit = deposit;
	}

	public String getIsRenting() {
		return isRenting;
	}

	public void setIsRenting(String isRenting) {
		this.isRenting = isRenting;
	}

	public String getCarDesc() {
		return carDesc;
	}

	public void setCarDesc(String carDesc) {
		this.carDesc = carDesc;
	}

	public String getCarImg() {
		return carImg;
	}

	public void setCarImg(String carImg) {
		this.carImg = carImg;
	}

	@Override
	public String toString() {
		return "Cars [carNumber=" + carNumber + ", carType=" + carType + ", color=" + color + ", price=" + price + ", rentPrice=" + rentPrice + ", deposit=" + deposit + ", isRenting=" + isRenting + ", carDesc=" + carDesc + ", carImg=" + carImg + "]";
	}

}