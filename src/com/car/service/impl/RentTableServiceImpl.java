package com.car.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.car.mapper.ICarsMapper;
import com.car.mapper.IChecktableMapper;
import com.car.mapper.IRenttableMapper;
import com.car.pojo.Cars;
import com.car.pojo.RentTable;
import com.car.service.RentTableService;
import com.car.utils.PageBean;

public class RentTableServiceImpl implements RentTableService {

	private IRenttableMapper mapper;
	private ICarsMapper carMapper;
	private IChecktableMapper checkMapper;
	
	public void setCheckMapper(IChecktableMapper checkMapper) {
		this.checkMapper = checkMapper;
	}
	
	public IChecktableMapper getCheckMapper() {
		return checkMapper;
	}
	
	public void setCarMapper(ICarsMapper carMapper) {
		this.carMapper = carMapper;
	}
	
	public ICarsMapper getCarMapper() {
		return carMapper;
	}
	
	public void setMapper(IRenttableMapper mapper) {
		this.mapper = mapper;
	}
	
	public IRenttableMapper getMapper() {
		return mapper;
	}
	
	@Override
	public boolean addRent(RentTable rentTable) {
		boolean flag = mapper.insert(rentTable);
		if (flag) {
			//修改汽车信息的出租状态
			Cars cars = new Cars(rentTable.getCarId(), null, null, null, null, null, "已出租", null, null);
			carMapper.updateCar(cars);
			return true;
		}
		return false;
	}

	@Override
	public void modifyRent(RentTable rentTable) {
		
		mapper.updateRent(rentTable);
	}

	@Override
	public void findRents(PageBean<RentTable> pageBean, RentTable rentTable) {
		//查询数据库中RentTable记录总数
		int totalCount = mapper.selectSize(rentTable);
		
		//使用记录总数初始化PageBean
		pageBean.setTotalCount(totalCount);
		
		//调用持久层获取指定页的用户数据并放入PageBean中
		int startRow = pageBean.getStartRow();
		int endRow = pageBean.getEndRow();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rent", rentTable);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<RentTable> list = mapper.selectByRents(map);
		pageBean.setList(list);
	}

	@Override
	public RentTable selectRent(Long tableId) {
		
		return mapper.selectByTableId(tableId);
	}

	@Override
	public void deleteRent(RentTable rentTable) {
		if (rentTable.getRentFlag() == 1) {
			//修改汽车信息的出租状态
			Cars cars = new Cars(rentTable.getCarId(), null, null, null, null, null, "未出租", null, null);
			carMapper.updateCar(cars);
		}
		checkMapper.delectCheckByTableId(rentTable.getTableId());
		mapper.deleteRent(rentTable.getTableId());
	}

}
