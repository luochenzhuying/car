package com.car.mapper;

import java.util.List;
import java.util.Map;

import com.car.pojo.CheckTable;

public interface IChecktableMapper {

	/**
	 * 添加检查单信息
	 * @param checkTable
	 * @return
	 */
    boolean insert(CheckTable checkTable);

    /**
     * 通过出租单号删除检查单信息
     * @param tableId
     */
	void delectCheckByTableId(Long tableId);

	/**
	 * 查询检查单信息条数（数量Size）
	 * @param checkTable
	 * @return
	 */
	int selectSize(CheckTable checkTable);

	/**
	 * 查询检查单信息（高级查询）（分页）
	 * @param map
	 * @return
	 */
	List<CheckTable> selectByChecks(Map<String, Object> map);

	/**
	 * 查询检查单信息（单独查询）
	 * @param checkId
	 * @return
	 */
	CheckTable selectCheckByCheckId(Long checkId);

	/**
	 * 通过检查单号删除检查单信息
	 * @param checkId
	 */
	void delectCheckByCheckId(Long checkId);

	/**
	 * 修改检查单信息
	 * @param checkTable
	 */
	void updateReturn(CheckTable checkTable);

	/**
	 * 根据用户登录名查询检查单号
	 * @param userName
	 * @return
	 */
	List<CheckTable> selectByUserId(String userName);
    
}