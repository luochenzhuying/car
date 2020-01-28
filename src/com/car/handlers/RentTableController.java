package com.car.handlers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.car.pojo.Cars;
import com.car.pojo.RentTable;
import com.car.pojo.Users;
import com.car.service.CarsService;
import com.car.service.RentTableService;
import com.car.service.UsersService;
import com.car.utils.PageBean;

@Controller
@Scope("prototype")
@RequestMapping("/rent")
public class RentTableController {
	@Resource
	private RentTableService rentservice;
	@Resource
	private CarsService carsservice;
	@Resource
	private UsersService usersService;
	
	public void setRentservice(RentTableService rentservice) {
		this.rentservice = rentservice;
	}
	
	public RentTableService getRentservice() {
		return rentservice;
	}
	
	public void setCarsservice(CarsService carsservice) {
		this.carsservice = carsservice;
	}
	
	public CarsService getCarsservice() {
		return carsservice;
	}
	
	public void setService(UsersService usersService) {
		this.usersService = usersService;
	}
	
	public UsersService getService() {
		return usersService;
	}
	
	@RequestMapping("/addRent.do")
	public String addRent(RentTable rentTable,Model model){
		//添加出租信息
		boolean flag = rentservice.addRent(rentTable);
		if (flag) {
			
			return "redirect:/tips.jsp";
		}
		model.addAttribute("message", "出租汽车失败");
		return "carservice/createRenting";
	}
	
	@RequestMapping("/queryTableId.do")
	public String queryTableId(Long tableId,Model model){
		//查询出租单编号信息
		RentTable rentTable = rentservice.selectRent(tableId);
		if (rentTable != null) {
			//出租单状态
			model.addAttribute("rentTable", rentTable);
			
			//车辆信息
			Cars car = carsservice.selectCar(rentTable.getCarId());
			model.addAttribute("car", car);
			//用户信息
			Users user = usersService.selectUser(rentTable.getUserId());
			model.addAttribute("user", user);
			
			//生成检查单编号
			DateFormat d1 = new SimpleDateFormat("yyyyMMddHHmmss");
			Date date = new Date();
			String checkId = d1.format(date);
			model.addAttribute("checkId", checkId);
			
			//生成检查单日期
			DateFormat d2 = new SimpleDateFormat("yyyy-MM-dd");
			String checkDate = d2.format(date);
			model.addAttribute("checkDate", checkDate);
			
			return "carservice/createRenturning";
		}
		model.addAttribute("message", "出租单号填写错误！！");
		return "carservice/returnCar";
	}
	
	@RequestMapping("/findRents.do")
	public String findRents(RentTable rentTable,Model model,@RequestParam(value="index",defaultValue="1")Integer index){
		//查询出租单信息（高级查询）
		System.out.println(rentTable);
		PageBean<RentTable> pageBean = new PageBean<>();
		pageBean.setIndex(index);
		rentservice.findRents(pageBean, rentTable);
		System.out.println(pageBean.getList());
		model.addAttribute("oldRent", rentTable);
		model.addAttribute("pageBean", pageBean);
		return "rentManager/showRents";
	}
	
	@RequestMapping("/SelectRent.do")
	public String selectRent(Long tableId,Model model){
		//查找出租单信息
		RentTable rentTable = rentservice.selectRent(tableId);
		model.addAttribute("rent", rentTable);
		return "rentManager/updateRent";
	}
	
	@RequestMapping("/DeleteRent.do")
	public String deleteRent(RentTable rentTable){
		//删除出租单信息
		rentservice.deleteRent(rentTable);
		
		return "redirect:/tips.jsp";
	}
	
	@RequestMapping("/ModifyRent.do")
	public String modifyRent(RentTable rentTable){
		//修改出租单信息
		rentservice.modifyRent(rentTable);
		
		return "redirect:/tips.jsp";
	}
	
	@RequestMapping("/MonthStatisticsCar.do")
	public String theCurrentMonth(Model model,@RequestParam(value="index",defaultValue="1")Integer index){
		//查询当月应还汽车信息
		PageBean<RentTable> pageBean = new PageBean<>();
		pageBean.setIndex(index);
		RentTable rentTable = new RentTable();
		rentTable.setRentFlag(1);
		rentservice.findRents(pageBean, rentTable);
		model.addAttribute("pageBean", pageBean);
		
		return "carservice/theCurrentMonth";
	}
	
	@RequestMapping("/SelectRUC.do")
	public String selectRUC(Long tableId,Model model){
		//查找出租单信息
		RentTable rentTable = rentservice.selectRent(tableId);
		model.addAttribute("rentTable", rentTable);
		
		//车辆信息
		Cars car = carsservice.selectCar(rentTable.getCarId());
		model.addAttribute("car", car);
		
		//用户信息
		Users user = usersService.selectUser(rentTable.getUserId());
		model.addAttribute("user", user);
		
		return "carservice/findMonthReturnCar";
	}
}
