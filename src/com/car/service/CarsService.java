package com.car.service;

import java.util.List;

import com.car.pojo.Cars;
import com.car.utils.PageBean;

public interface CarsService {

	/**
	 * 添加汽车信息
	 * @param cars
	 * @return
	 */
	boolean addCar(Cars cars);

	/**
	 * 查询汽车信息（高级查询）
	 * @param pageBean
	 * @param cars
	 */
	void findCars(PageBean<Cars> pageBean, Cars cars);

	/**
	 * 删除汽车信息
	 * @param carNumber
	 * @return 
	 */
	boolean removeCar(String carNumber);

	/**
	 * 查询汽车信息（单独查询）
	 * @param carNumber
	 * @return
	 */
	Cars selectCar(String carNumber);

	/**
	 * 修改汽车信息
	 * @param cars
	 */
	void modifyCar(Cars cars);

	/**
	 * 查询所有汽车信息
	 * @return
	 */
	List<Cars> queryCars();
}
