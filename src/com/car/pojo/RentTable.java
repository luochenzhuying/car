package com.car.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class RentTable {
	private Long tableId;
	private Double imprest;
	private Double shouldPayPrice;
	private Double price;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date beginDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date shouldReturnDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date returnDate;
	private Integer rentFlag;
	private String custId;
	private String carId;
	private String userId;

	public RentTable() {
		super();
	}

	public RentTable(Long tableId, Double imprest, Double shouldPayPrice, Double price, Date beginDate, Date shouldReturnDate, Date returnDate, Integer rentFlag, String custId, String carId, String userId) {
		super();
		this.tableId = tableId;
		this.imprest = imprest;
		this.shouldPayPrice = shouldPayPrice;
		this.price = price;
		this.beginDate = beginDate;
		this.shouldReturnDate = shouldReturnDate;
		this.returnDate = returnDate;
		this.rentFlag = rentFlag;
		this.custId = custId;
		this.carId = carId;
		this.userId = userId;
	}

	public Long getTableId() {
		return tableId;
	}

	public void setTableId(Long tableId) {
		this.tableId = tableId;
	}

	public Double getImprest() {
		return imprest;
	}

	public void setImprest(Double imprest) {
		this.imprest = imprest;
	}

	public Double getShouldPayPrice() {
		return shouldPayPrice;
	}

	public void setShouldPayPrice(Double shouldPayPrice) {
		this.shouldPayPrice = shouldPayPrice;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getShouldReturnDate() {
		return shouldReturnDate;
	}

	public void setShouldReturnDate(Date shouldReturnDate) {
		this.shouldReturnDate = shouldReturnDate;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public Integer getRentFlag() {
		return rentFlag;
	}

	public void setRentFlag(Integer rentFlag) {
		this.rentFlag = rentFlag;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getCarId() {
		return carId;
	}

	public void setCarId(String carId) {
		this.carId = carId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "RentTable [tableId=" + tableId + ", imprest=" + imprest + ", shouldPayPrice=" + shouldPayPrice + ", price=" + price + ", beginDate=" + beginDate + ", shouldReturnDate=" + shouldReturnDate + ", returnDate=" + returnDate + ", rentFlag=" + rentFlag + ", custId=" + custId + ", carId=" + carId + ", userId=" + userId + "]";
	}

}