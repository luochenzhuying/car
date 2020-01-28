package com.car.service;

import com.car.pojo.CheckTable;
import com.car.utils.PageBean;

public interface CheckTableService {

	/**
	 * 添加检查单信息
	 * @param checkTable
	 * @return
	 */
	boolean addCheck(CheckTable checkTable,String carNumber);

	/**
	 * 查询检查单信息（高级查询）（分页）
	 * @param pageBean
	 * @param checkTable
	 */
	void findChecks(PageBean<CheckTable> pageBean, CheckTable checkTable);

	/**
	 * 查询检查单信息（单独查询）
	 * @param checkId
	 * @return
	 */
	CheckTable selectCheck(Long checkId);

	/**
	 * 删除检查单信息
	 * @param checkId
	 */
	void deleteReturn(Long checkId);

	/**
	 * 修改检查单信息
	 * @param checkTable
	 */
	void modifyReturn(CheckTable checkTable);

}
