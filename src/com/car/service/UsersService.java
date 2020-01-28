package com.car.service;

import com.car.pojo.Users;
import com.car.utils.PageBean;

public interface UsersService {
	
	/**
	 * 添加用户信息
	 * @param users
	 * @return
	 */
	boolean addUser(Users users);

	/**
	 * 查询用户信息（高级查询）
	 * @param pageBean 
	 * @param user
	 * @return
	 */
	void findUsers(PageBean<Users> pageBean, Users users);

	/**
	 * 删除该用户
	 * @param userName
	 * @return 
	 */
	boolean removeUser(String userName);

	/**
	 * 查询用户信息（单独查询）
	 * @param userName
	 * @return
	 */
	Users selectUser(String userName);

	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 */
	boolean modifyUser(Users user);

	/**
	 * 验证用户登录信息
	 * @param users
	 */
	Users login(Users users);

	/**
	 * 添加用户时验证用户身份证是否重复
	 * @param identity
	 * @return
	 */
	Users selectByIdentity(String identity);
	
}
