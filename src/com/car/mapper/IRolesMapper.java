package com.car.mapper;

import com.car.pojo.Roles;
import java.util.List;

public interface IRolesMapper {
    
	/**
	 * 查询所有角色信息
	 * @return
	 */
	List<Roles> selectAllRoles();
	
	/**
	 * 添加角色
	 * @param roles
	 * @return
	 */
	boolean insert(Roles roles);

}