package com.car.handlers;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.car.pojo.Menus;
import com.car.pojo.Roles;
import com.car.service.RolesService;

@Controller
@Scope("prototype")
@RequestMapping("/role")
public class RolesController {
	@Resource
	private RolesService rolesService;
	
	public void setRolesService(RolesService rolesService) {
		this.rolesService = rolesService;
	}
	
	public RolesService getRolesService() {
		return rolesService;
	}
	
	@RequestMapping("/addRole.do")
	public String addRole(Roles roles){
		//添加角色信息
		rolesService.addRole(roles);
			
		return "redirect:/tips.jsp";
	}
	
	@RequestMapping("/FindRole.do")
	@ResponseBody
	public Object FindRole(){
		//查询所有角色信息
		List<Roles> list = rolesService.selectAllRoles();
		
		return list;
	}
	
	@RequestMapping("/FindRoleMenu.do")
	@ResponseBody
	public Object findRoleMenu(Integer roleId){
		//查询角色权限信息(拥有的权限)
		List<Menus> list = rolesService.findRoleMenu(roleId);
			
		return list;
	}
	
	@RequestMapping("/FindRoleMenuNo.do")
	@ResponseBody
	public Object findRoleMenuNo(Integer roleId){
		//查询角色权限信息(没有的权限)
		List<Menus> list = rolesService.findRoleMenuNo(roleId);
			
		return list;
	}
	
	@RequestMapping("/modifyRoleMenu.do")
	public Object modifyRoleMenu(Integer roleId,String menuIdStr){
		//修改角色权限
		rolesService.modifyRoleMenu(roleId,menuIdStr);
			
		return "redirect:/tips.jsp";
	}
	
}
