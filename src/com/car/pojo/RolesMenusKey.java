package com.car.pojo;

public class RolesMenusKey {
	private Integer roleId;
	private Integer menuId;

	public RolesMenusKey() {
		super();
	}

	public RolesMenusKey(Integer menuId, Integer roleId) {
		super();
		this.menuId = menuId;
		this.roleId = roleId;
	}

	public Integer getMenuId() {
		return menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	@Override
	public String toString() {
		return "RolesMenusKey [menuId=" + menuId + ", roleId=" + roleId + "]";
	}

}