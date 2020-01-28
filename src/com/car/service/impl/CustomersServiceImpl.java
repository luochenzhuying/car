package com.car.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.car.mapper.ICustomersMapper;
import com.car.mapper.IRenttableMapper;
import com.car.pojo.Customers;
import com.car.pojo.RentTable;
import com.car.service.CustomersService;
import com.car.utils.PageBean;

public class CustomersServiceImpl implements CustomersService {

	private ICustomersMapper mapper;
	private IRenttableMapper rMapper;
	
	public void setrMapper(IRenttableMapper rMapper) {
		this.rMapper = rMapper;
	}
	
	public IRenttableMapper getrMapper() {
		return rMapper;
	}
	
	public void setMapper(ICustomersMapper mapper) {
		this.mapper = mapper;
	}
	
	public ICustomersMapper getMapper() {
		return mapper;
	}
	
	@Override
	public boolean addCustomer(Customers customers) {
		
		return mapper.insert(customers);
	}

	@Override
	public void findCustomers(PageBean<Customers> pageBean, Customers customers) {
		//查询数据库中Customers记录总数
		int totalCount = mapper.selectSize(customers);
		
		//使用记录总数初始化PageBean
		pageBean.setTotalCount(totalCount);
		
		//调用持久层获取指定页的客户数据并放入PageBean中
		int startRow = pageBean.getStartRow();
		int endRow = pageBean.getEndRow();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cust", customers);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<Customers> list = mapper.selectByCustomers(map);
		pageBean.setList(list);
	}

	@Override
	public boolean removeCustomer(String identity) {
		//查询出租单中是否有出租记录
		List<RentTable> rentTable = rMapper.selectByCustId(identity);
		if (rentTable.size() == 0) {
			return mapper.deleteCustomer(identity);
		}
		return false;
	}

	@Override
	public Customers selectCustomer(String identity) {
		
		return mapper.toUpdateCustomer(identity);
	}

	@Override
	public void modifyCustomer(Customers customers) {
		
		mapper.updateCustomer(customers);
	}

	@Override
	public Customers queryCustomer(String identity) {
		
		return mapper.selectByIdentity(identity);
	}
}
