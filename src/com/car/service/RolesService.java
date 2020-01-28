package com.car.service;

import java.util.List;

import com.car.pojo.Menus;
import com.car.pojo.Roles;

public interface RolesService {

	/**
	 * 查询所有角色信息
	 * @return
	 */
	List<Roles> selectAllRoles();

	/**
	 * 添加角色
	 * @param roleName
	 */
	void addRole(Roles roles);

	/**
	 * 查询角色拥有的权限信息
	 * @param roleId
	 * @return
	 */
	List<Menus> findRoleMenu(Integer roleId);

	/**
	 * 查询角色没有的权限信息
	 * @param roleId
	 * @return
	 */
	List<Menus> findRoleMenuNo(Integer roleId);

	/**
	 * 修改角色权限
	 * @param roleId
	 * @param menuIdStr
	 */
	void modifyRoleMenu(Integer roleId, String menuIdStr);

	/**
	 * 查询角色拥有的权限菜单
	 * @param roleId
	 * @return
	 */
	List<Menus> selectByRoleId(Integer roleId);

}
