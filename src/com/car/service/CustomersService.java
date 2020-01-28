package com.car.service;

import com.car.pojo.Customers;
import com.car.utils.PageBean;

public interface CustomersService {

	/**
	 * 添加客户信息
	 * @param customers
	 * @return
	 */
	boolean addCustomer(Customers customers);

	/**
	 * 查询客户信息（高级查询）
	 * @param pageBean
	 * @param customers
	 */
	void findCustomers(PageBean<Customers> pageBean, Customers customers);

	/**
	 * 删除该客户
	 * @param identity
	 * @return 
	 */
	boolean removeCustomer(String identity);

	/**
	 * 查询客户信息（单独查询）
	 * @param identity
	 * @return
	 */
	Customers selectCustomer(String identity);

	/**
	 * 修改客户信息
	 * @param customers
	 */
	void modifyCustomer(Customers customers);

	/**
	 * 验证客户信息
	 * @param identity
	 * @return
	 */
	Customers queryCustomer(String identity);
}
