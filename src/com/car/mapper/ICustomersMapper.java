package com.car.mapper;

import java.util.List;
import java.util.Map;

import com.car.pojo.Customers;

public interface ICustomersMapper {
    
	/**
	 * 添加客户信息
	 * @param customers
	 * @return
	 */
	boolean insert(Customers customers);
	
	/**
	 * 查询客户信息条数（数量Size）
	 * @param customers
	 * @return
	 */
	int selectSize(Customers customers);
	
	/**
	 * 查询客户信息（高级查询）
	 * @param map
	 * @return
	 */
	List<Customers> selectByCustomers(Map<String, Object> map);

	/**
	 * 删除该客户
	 * @param identity
	 * @return 
	 */
	boolean deleteCustomer(String identity);

	/**
	 * 查询客户信息（单独查询）
	 * @param identity
	 * @return
	 */
	Customers toUpdateCustomer(String identity);

	/**
	 * 修改客户信息
	 * @param customers
	 */
	void updateCustomer(Customers customers);

	/**
	 * 验证客户信息
	 * @param identity
	 * @return
	 */
	Customers selectByIdentity(String identity);

}