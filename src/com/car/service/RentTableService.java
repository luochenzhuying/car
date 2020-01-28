package com.car.service;

import com.car.pojo.RentTable;
import com.car.utils.PageBean;

public interface RentTableService {

	/**
	 * 添加出租汽车信息
	 * @param rentTable
	 * @return 
	 */
	boolean addRent(RentTable rentTable);

	/**
	 * 修改出租单信息
	 * @param rentTable
	 */
	void modifyRent(RentTable rentTable);

	/**
	 * 查询出租单信息（高级查询）
	 * @param pageBean
	 * @param rentTable
	 */
	void findRents(PageBean<RentTable> pageBean, RentTable rentTable);

	/**
	 * 查询出租单信息（单独查询）
	 * @param tableId
	 * @return
	 */
	RentTable selectRent(Long tableId);

	/**
	 * 删除出租单信息
	 * @param rentTable
	 */
	void deleteRent(RentTable rentTable);

}
