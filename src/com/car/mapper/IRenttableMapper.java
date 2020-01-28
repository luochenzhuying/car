package com.car.mapper;

import java.util.List;
import java.util.Map;

import com.car.pojo.RentTable;

public interface IRenttableMapper {
   
	/**
	 * 添加汽车出租信息
	 * @param record
	 * @return
	 */
    boolean insert(RentTable record);

    /**
     * 查询出租单编号信息
     * @param tableId
     * @return
     */
	RentTable selectByTableId(Long tableId);

	/**
	 * 修改出租单信息
	 * @param rentTable
	 */
	void updateRent(RentTable rentTable);

	/**
	 * 查询出租单条数（数量Size）
	 * @param rentTable
	 * @return
	 */
	int selectSize(RentTable rentTable);

	/**
	 * 查询出租单信息（高级查询）（分页）
	 * @param map
	 * @return
	 */
	List<RentTable> selectByRents(Map<String, Object> map);

	/**
	 * 删除出租单信息
	 * @param tableId
	 */
	void deleteRent(Long tableId);

	/**
	 * 根据汽车号查询出租单信息
	 * @param carNumber 
	 * @return
	 */
	List<RentTable> selectBycarId(String carNumber);

	/**
	 * 根据客户号查询出租单信息
	 * @param identity
	 * @return
	 */
	List<RentTable> selectByCustId(String identity);

	/**
	 * 根据用户登录名查询出租单信息
	 * @param userName
	 * @return
	 */
	List<RentTable> selectByUserId(String userName);

}