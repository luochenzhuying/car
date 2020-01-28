package com.car.pojo;

public class Menus {
	private Integer menuId;
	private String menuName;
	private String connUrl;
	private Integer fatherId;

	public Menus() {
		super();
	}

	public Menus(Integer menuId, String menuName, String connUrl, Integer fatherId) {
		super();
		this.menuId = menuId;
		this.menuName = menuName;
		this.connUrl = connUrl;
		this.fatherId = fatherId;
	}

	public Integer getMenuId() {
		return menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getConnUrl() {
		return connUrl;
	}

	public void setConnUrl(String connUrl) {
		this.connUrl = connUrl;
	}

	public Integer getFatherId() {
		return fatherId;
	}

	public void setFatherId(Integer fatherId) {
		this.fatherId = fatherId;
	}

	@Override
	public String toString() {
		return "Menus [menuId=" + menuId + ", menuName=" + menuName + ", connUrl=" + connUrl + ", fatherId=" + fatherId + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((connUrl == null) ? 0 : connUrl.hashCode());
		result = prime * result + ((fatherId == null) ? 0 : fatherId.hashCode());
		result = prime * result + ((menuId == null) ? 0 : menuId.hashCode());
		result = prime * result + ((menuName == null) ? 0 : menuName.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Menus other = (Menus) obj;
		if (connUrl == null) {
			if (other.connUrl != null)
				return false;
		} else if (!connUrl.equals(other.connUrl))
			return false;
		if (fatherId == null) {
			if (other.fatherId != null)
				return false;
		} else if (!fatherId.equals(other.fatherId))
			return false;
		if (menuId == null) {
			if (other.menuId != null)
				return false;
		} else if (!menuId.equals(other.menuId))
			return false;
		if (menuName == null) {
			if (other.menuName != null)
				return false;
		} else if (!menuName.equals(other.menuName))
			return false;
		return true;
	}
	
}