package com.car.test;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.car.mapper.IFunsMapper;
import com.car.mapper.IMenusMapper;
import com.car.mapper.IRolesMenusMapper;
import com.car.pojo.Funs;
import com.car.pojo.Menus;
import com.car.pojo.RolesMenusKey;
import com.car.utils.MyBatisUtils;

public class UserTest {

	private IMenusMapper menusMapper;
	private IRolesMenusMapper rMapper;
	private IFunsMapper mapper;
	private SqlSession sqlSession;

	@Before
	public void before() {
		// 1.获取SQLSession对象
		sqlSession = MyBatisUtils.getSqlSession();
		// 2.获取mapper
		mapper = sqlSession.getMapper(IFunsMapper.class);
		menusMapper = sqlSession.getMapper(IMenusMapper.class);
		rMapper = sqlSession.getMapper(IRolesMenusMapper.class);
	}

	@After
	public void After() {
		// 最后关闭资源
		MyBatisUtils.closeAll();
	}

	@Test
	public void findRoleMenu() {
		// 查询所有的权限
		List<Menus> mList = menusMapper.selectAll();

		List<Menus> arrayList = new ArrayList<>();

		// 查询角色拥有的权限
		List<RolesMenusKey> rList = rMapper.selectByRoleId(2);
		for (Menus menus : mList) {

			for (RolesMenusKey rmk : rList) {

				// 如果Menus中角色有对应的权限,删除该权限
				if (menus.getMenuId() == rmk.getMenuId()) {
					break;
				}
				arrayList.add(menus);
			}
		}
		for (Menus menus : arrayList) {
			System.out.println(menus);
		}
	}

	@Test
	public void auth() {
		List<Menus> menuList = new ArrayList<>();
		List<RolesMenusKey> rmList = rMapper.selectByRoleId(1);
		for (RolesMenusKey rm : rmList) {
			Menus menus = menusMapper.selectByMenuId(rm.getMenuId());
			menuList.add(menus);
		}
		
		List<Funs> funsList = new ArrayList<>();
		for (Menus menus : menuList) {
			List<Funs> funsList2 = mapper.selectByMenuId(menus.getMenuId());
			funsList.addAll(funsList2);
		}
		
		for (int i = 0; i < funsList.size(); i++) {
			System.out.println(i + ":" + funsList.get(i));
		}
		
		String uri = "/car/user/logout.do";
		for (Funs funs : funsList) {
			if (uri.indexOf(funs.getFunUrl()) != -1) {
				System.out.println(funs.getFunUrl());
				System.out.println("1111111111111111111");
			}
		}
		
	}

	@Test
	public void teststr() {
		List<Menus> list = new ArrayList<>();
		List<RolesMenusKey> rmList = rMapper.selectByRoleId(2);
		for (RolesMenusKey rm : rmList) {
			Menus menus = menusMapper.selectByMenuId(rm.getMenuId());
			list.add(menus);
		}
		for (Menus rm : list) {
			System.out.println(rm);
		}
	}
	
	@Test
	public void auth2(){
		String uri = "/car/user/login.do";
		System.out.println(uri.indexOf("user/login.do"));
		if (uri.indexOf("uesr/login.do") >= 0) {
			System.out.println(11111111);
		}
	}
}