package com.car.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CheckTable {
	private Long checkId;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date checkDate;
	private String field;
	private String problem;
	private Double paying;
	private String checkUserId;
	private Long rentId;

	public CheckTable() {
		super();
	}

	public CheckTable(Long checkId, Date checkDate, String field, String problem, Double paying, String checkUserId, Long rentId) {
		super();
		this.checkId = checkId;
		this.checkDate = checkDate;
		this.field = field;
		this.problem = problem;
		this.paying = paying;
		this.checkUserId = checkUserId;
		this.rentId = rentId;
	}

	public Long getCheckId() {
		return checkId;
	}

	public void setCheckId(Long checkId) {
		this.checkId = checkId;
	}

	public Date getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getProblem() {
		return problem;
	}

	public void setProblem(String problem) {
		this.problem = problem;
	}

	public Double getPaying() {
		return paying;
	}

	public void setPaying(Double paying) {
		this.paying = paying;
	}

	public String getCheckUserId() {
		return checkUserId;
	}

	public void setCheckUserId(String checkUserId) {
		this.checkUserId = checkUserId;
	}

	public Long getRentId() {
		return rentId;
	}

	public void setRentId(Long rentId) {
		this.rentId = rentId;
	}

	@Override
	public String toString() {
		return "Checktable [checkId=" + checkId + ", checkDate=" + checkDate + ", field=" + field + ", problem=" + problem + ", paying=" + paying + ", checkUserId=" + checkUserId + ", rentId=" + rentId + "]";
	}

}