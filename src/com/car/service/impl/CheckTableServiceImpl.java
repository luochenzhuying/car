package com.car.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.car.mapper.ICarsMapper;
import com.car.mapper.IChecktableMapper;
import com.car.mapper.IRenttableMapper;
import com.car.pojo.Cars;
import com.car.pojo.CheckTable;
import com.car.pojo.RentTable;
import com.car.service.CheckTableService;
import com.car.utils.PageBean;

public class CheckTableServiceImpl implements CheckTableService {

	private IChecktableMapper mapper;
	private IRenttableMapper rentMapper;
	private ICarsMapper carMapper;
	
	public void setCarMapper(ICarsMapper carMapper) {
		this.carMapper = carMapper;
	}
	
	public ICarsMapper getCarMapper() {
		return carMapper;
	}
	
	public void setRentMapper(IRenttableMapper rentmapper) {
		this.rentMapper = rentmapper;
	}
	
	public IRenttableMapper getRentMapper() {
		return rentMapper;
	}
	
	public void setMapper(IChecktableMapper mapper) {
		this.mapper = mapper;
	}
	
	public IChecktableMapper getMapper() {
		return mapper;
	}
	
	@Override
	public boolean addCheck(CheckTable checkTable,String carNumber) {
		boolean flag = mapper.insert(checkTable);
		if (flag) {
			//修改出租单的出租状态
			RentTable rentTable = new RentTable(checkTable.getRentId(), -1.0, -1.0, -1.0, null, null, checkTable.getCheckDate(), 0, null, null, null);
			rentMapper.updateRent(rentTable);
			
			//修改汽车的出租状态
			Cars cars = new Cars(carNumber, null, null, null, null, null, "未出租", null, null);
			carMapper.updateCar(cars);
			return true;
		}
		return false;
	}

	@Override
	public void findChecks(PageBean<CheckTable> pageBean, CheckTable checkTable) {
		//查询数据库中CheckTable记录总数
		int totalCount = mapper.selectSize(checkTable);
		
		//使用记录总数初始化PageBean
		pageBean.setTotalCount(totalCount);
		
		//调用持久层获取指定页的用户数据并放入PageBean中
		int startRow = pageBean.getStartRow();
		int endRow = pageBean.getEndRow();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("check", checkTable);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<CheckTable> list = mapper.selectByChecks(map);
		pageBean.setList(list);
	}

	@Override
	public CheckTable selectCheck(Long checkId) {
		
		return mapper.selectCheckByCheckId(checkId);
	}

	@Override
	public void deleteReturn(Long checkId) {
		
		mapper.delectCheckByCheckId(checkId);
	}

	@Override
	public void modifyReturn(CheckTable checkTable) {
		
		mapper.updateReturn(checkTable);
	}

}
