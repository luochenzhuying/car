package com.car.pojo;

public class Funs {
	private Integer funId;
	private String funName;
	private String funUrl;
	private Integer menuId;

	public Funs() {
		super();
	}

	public Funs(Integer funId, String funName, String funUrl, Integer menuId) {
		super();
		this.funId = funId;
		this.funName = funName;
		this.funUrl = funUrl;
		this.menuId = menuId;
	}

	public Integer getFunId() {
		return funId;
	}

	public void setFunId(Integer funId) {
		this.funId = funId;
	}

	public String getFunName() {
		return funName;
	}

	public void setFunName(String funName) {
		this.funName = funName;
	}

	public String getFunUrl() {
		return funUrl;
	}

	public void setFunUrl(String funUrl) {
		this.funUrl = funUrl;
	}

	public Integer getMenuId() {
		return menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}

	@Override
	public String toString() {
		return "Funs [funId=" + funId + ", funName=" + funName + ", funUrl=" + funUrl + ", menuId=" + menuId + "]";
	}

}