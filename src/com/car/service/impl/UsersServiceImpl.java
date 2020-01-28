package com.car.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.car.mapper.IChecktableMapper;
import com.car.mapper.IRenttableMapper;
import com.car.mapper.IUsersMapper;
import com.car.pojo.CheckTable;
import com.car.pojo.RentTable;
import com.car.pojo.Users;
import com.car.service.UsersService;
import com.car.utils.PageBean;

public class UsersServiceImpl implements UsersService {

	private IUsersMapper mapper;
	private IRenttableMapper rMapper;
	private IChecktableMapper checkMapper;
	
	public void setCheckMapper(IChecktableMapper checkMapper) {
		this.checkMapper = checkMapper;
	}
	
	public IChecktableMapper getCheckMapper() {
		return checkMapper;
	}
	
	public void setrMapper(IRenttableMapper rMapper) {
		this.rMapper = rMapper;
	}
	
	public IRenttableMapper getrMapper() {
		return rMapper;
	}
	
	public void setMapper(IUsersMapper mapper) {
		this.mapper = mapper;
	}
	
	public IUsersMapper getMapper() {
		return mapper;
	}
	
	@Override
	public boolean addUser(Users users) {
		
		return mapper.insert(users);
	}

	@Override
	public void findUsers(PageBean<Users> pageBean, Users users) {
		//查询数据库中Users记录总数
		int totalCount = mapper.selectSize(users);
		
		//使用记录总数初始化PageBean
		pageBean.setTotalCount(totalCount);
		
		//调用持久层获取指定页的用户数据并放入PageBean中
		int startRow = pageBean.getStartRow();
		int endRow = pageBean.getEndRow();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", users);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<Users> list = mapper.selectByUsers(map);
		pageBean.setList(list);
	}

	@Override
	public boolean removeUser(String userName) {
		//查询出租单中是否有出租记录
		List<RentTable> rentTable = rMapper.selectByUserId(userName);
		List<CheckTable> checkTable = checkMapper.selectByUserId(userName);
		if (rentTable.size() == 0 && checkTable.size() == 0) {
			return mapper.deleteUser(userName);
		}
		return false;
	}

	@Override
	public Users selectUser(String userName) {
		
		return mapper.toUpdateUser(userName);
	}

	@Override
	public boolean modifyUser(Users user) {
		
		return mapper.updateUser(user);
	}

	@Override
	public Users login(Users users) {
		
		return mapper.selectByPassword(users);
	}

	@Override
	public Users selectByIdentity(String identity) {
		
		return mapper.selectByIdentity(identity);
	}

}
