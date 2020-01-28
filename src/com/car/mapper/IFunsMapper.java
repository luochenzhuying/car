package com.car.mapper;

import java.util.List;

import com.car.pojo.Funs;

public interface IFunsMapper {

	/**
	 * 查询对应权限能访问的页面
	 * @param menuId 
	 * @return
	 */
	List<Funs> selectByMenuId(Integer menuId);
   
}