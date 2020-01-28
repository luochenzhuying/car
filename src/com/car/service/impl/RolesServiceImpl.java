package com.car.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.car.mapper.IMenusMapper;
import com.car.mapper.IRolesMapper;
import com.car.mapper.IRolesMenusMapper;
import com.car.pojo.Menus;
import com.car.pojo.Roles;
import com.car.pojo.RolesMenusKey;
import com.car.service.RolesService;

public class RolesServiceImpl implements RolesService {
	
	private IRolesMapper mapper;
	private IRolesMenusMapper rMapper;
	private IMenusMapper menusMapper;
	
	public void setMenusMapper(IMenusMapper menusMapper) {
		this.menusMapper = menusMapper;
	}
	
	public IMenusMapper getMenusMapper() {
		return menusMapper;
	}
	
	public void setrMapper(IRolesMenusMapper rMapper) {
		this.rMapper = rMapper;
	}
	
	public IRolesMenusMapper getrMapper() {
		return rMapper;
	}
	
	public void setMapper(IRolesMapper mapper) {
		this.mapper = mapper;
	}
	
	public IRolesMapper getMapper() {
		return mapper;
	}

	@Override
	public List<Roles> selectAllRoles() {
		
		return mapper.selectAllRoles();
	}

	@Override
	public void addRole(Roles roles) {
		System.out.println(roles);
		boolean flag = mapper.insert(roles);
		System.out.println(roles);
		if (flag) {
			rMapper.insert(new RolesMenusKey(1, roles.getRoleId()));
		}
	}

	@Override
	public List<Menus> findRoleMenu(Integer roleId) {
		List<Menus> mList = new ArrayList<Menus>();
		//查询角色拥有的权限菜单ID
		List<RolesMenusKey> list = rMapper.selectByRoleId(roleId);
		for (RolesMenusKey rm : list) {
			if (rm.getMenuId() != 1) { //如果权限菜单Id为1，该信息不放入集合中（默认角色必有不可改）
				//查询拥有的权限具体信息
				Menus menus = menusMapper.selectByMenuId(rm.getMenuId());
				//一级菜单不放入权限中
				if (menus.getFatherId() != 1) {
					mList.add(menus);
				}
			}
		}
		return mList;
	}

	@Override
	public List<Menus> findRoleMenuNo(Integer roleId) {
		List<Menus> list = new ArrayList<Menus>();
		//查询所有的权限
		List<Menus> mList = menusMapper.selectAll();
		//查询角色拥有的权限
		List<RolesMenusKey> rList = rMapper.selectByRoleId(roleId);

		//第二方案（两个集合求差集，须重写对象的equals()方法）
		for (RolesMenusKey rm : rList) {
			//查询拥有的权限具体信息
			Menus menus = menusMapper.selectByMenuId(rm.getMenuId());
			//一级菜单不放入权限中
			if(menus.getFatherId() != 1){
				list.add(menus);
			}
		}
		mList.removeAll(list);
		
		return mList;
	}

	@Override
	public void modifyRoleMenu(Integer roleId, String menuIdStr) {
		//修改后有的权限
		String[] str1 = menuIdStr.split(",");
		Set<Integer> menuId = new HashSet<>();
		for (int i = 0; i < str1.length; i++) {
			menuId.add(Integer.valueOf(str1[i]));
		}
		
		//查找二级菜单权限的一级菜单权限是否存在
		Set<Integer> fatherId = new HashSet<>();
		for (Integer i : menuId) {
			Menus menus = menusMapper.selectByMenuId(i);
			fatherId.add(menus.getFatherId());
		}
		
		//修改完后最终的权限绑定
		menuId.add(1);
		menuId.addAll(fatherId);

		//先移除之前该角色拥有的所有权限，然后重新添加权限
		rMapper.removeRoleMenu(roleId);
		for (Integer i : menuId) {
			rMapper.insert(new RolesMenusKey(i, roleId));
		}
		
	}

	@Override
	public List<Menus> selectByRoleId(Integer roleId) {
		List<Menus> list = new ArrayList<>();
		List<RolesMenusKey> rmList = rMapper.selectByRoleId(roleId);
		for (RolesMenusKey rm : rmList) {
			Menus menus = menusMapper.selectByMenuId(rm.getMenuId());
			list.add(menus);
		}
		return list;
	}
	
}
