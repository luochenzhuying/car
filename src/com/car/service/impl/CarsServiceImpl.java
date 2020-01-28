package com.car.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.car.mapper.ICarsMapper;
import com.car.mapper.IRenttableMapper;
import com.car.pojo.Cars;
import com.car.pojo.RentTable;
import com.car.service.CarsService;
import com.car.utils.PageBean;

public class CarsServiceImpl implements CarsService {

	private ICarsMapper mapper;
	private IRenttableMapper rMapper;
	
	public void setrMapper(IRenttableMapper rMapper) {
		this.rMapper = rMapper;
	}
	
	public IRenttableMapper getrMapper() {
		return rMapper;
	}
	
	public void setMapper(ICarsMapper mapper) {
		this.mapper = mapper;
	}
	
	public ICarsMapper getMapper() {
		return mapper;
	}
	
	@Override
	public boolean addCar(Cars cars) {
		
		return mapper.insert(cars);
	}

	@Override
	public void findCars(PageBean<Cars> pageBean, Cars cars) {
		//查询数据库中Cars记录总数
		int totalCount = mapper.selectSize(cars);
		
		//使用记录总数初始化PageBean
		pageBean.setTotalCount(totalCount);
		
		//调用持久层获取指定页的用户数据并放入PageBean中
		int startRow = pageBean.getStartRow();
		int endRow = pageBean.getEndRow();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("car", cars);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<Cars> list = mapper.selectByCars(map);
		pageBean.setList(list);
	}

	@Override
	public boolean removeCar(String carNumber) {
		//查询汽车是否被出租过
		List<RentTable> rentTable= rMapper.selectBycarId(carNumber);
		if (rentTable.size() == 0) {
			return mapper.deleteCar(carNumber);
		}
		return false;
	}

	@Override
	public Cars selectCar(String carNumber) {
		
		return mapper.toUpdateCar(carNumber);
	}

	@Override
	public void modifyCar(Cars cars) {
		
		mapper.updateCar(cars);
	}

	@Override
	public List<Cars> queryCars() {
		
		return mapper.selectCars();
	}

}
