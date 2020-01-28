package com.car.mapper;

import java.util.List;

import com.car.pojo.Menus;

public interface IMenusMapper {

	/**
	 * 查询菜单信息
	 * @param menus
	 * @return
	 */
	Menus selectByMenuId(Integer roleId);
	
	/**
	 * 查询所有菜单信息(不含一级菜单)
	 * @return
	 */
	List<Menus> selectAll();
}