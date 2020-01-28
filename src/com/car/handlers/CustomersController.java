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
import org.springframework.web.bind.annotation.ResponseBody;

import com.car.pojo.Customers;
import com.car.service.CustomersService;
import com.car.utils.PageBean;

@Controller
@Scope("prototype")
@RequestMapping("/customer")
public class CustomersController {
	@Resource
	private CustomersService customerservice;
	
	public void setCustomerservice(CustomersService customerservice) {
		this.customerservice = customerservice;
	}
	
	public CustomersService getCustomerservice() {
		return customerservice;
	}
	
	@RequestMapping("/findIdentity.do")
	@ResponseBody
	public Object findIdentity(String identity){
		//添加用户时验证登录名是否重复
		if (identity == null || identity == "") {
			return true;
		}
		Customers customer = customerservice.selectCustomer(identity);
		if (customer != null) {
			return false;
		}
		return true;
	}
	
	@RequestMapping("/addCustomer.do")
	public String addCustomer(Customers customers){
		//添加客户信息
		customerservice.addCustomer(customers);
			
		return "redirect:/tips.jsp";
	}
	
	@RequestMapping("/findCustomers.do")
	public String findCustomers(Customers customers,Model model,@RequestParam(value="index",defaultValue="1")Integer index){
		//查询客户信息（高级查询）（分页）
		PageBean<Customers> pageBean = new PageBean<>();
		pageBean.setIndex(index);
		customerservice.findCustomers(pageBean, customers);
		model.addAttribute("oldCust", customers);
		model.addAttribute("pageBean", pageBean);
		return "customers/showCustomers";
	}
	
	@RequestMapping("/DeleteCustomer.do")
	public String DeleteCustomer(String identity,Model model){
		//删除客户信息
		boolean flag = customerservice.removeCustomer(identity);
		if (flag) {
			return "redirect:findCustomers.do";
		}
		model.addAttribute("message", "客户正在出租汽车或者保存出租资料，因不能删除");
		return "error";
	}
	
	@RequestMapping("/SelectCustomer.do")
	public String selectCustomer(String identity,Model model){
		//查询客户信息
		Customers customer = customerservice.selectCustomer(identity);
		model.addAttribute("Customer", customer);
		return "customers/updateCustomer";
	}
	
	@RequestMapping("/ModifyCustomer.do")
	public String modifyCustomer(Customers customers){
		//修改客户信息
		customerservice.modifyCustomer(customers);
		return "redirect:/tips.jsp";
	}
	
	@RequestMapping("/queryCustomer.do")
	public String queryCustomer(String identity,Model model){
		//验证客户信息
		Customers customers = customerservice.queryCustomer(identity);
		if (customers != null) {
			//生成出租单编号
			DateFormat d = new SimpleDateFormat("yyyyMMddHHmmss");
			Date date = new Date();
			String tableId = d.format(date);
			model.addAttribute("tableId", tableId);
			
			model.addAttribute("customer", customers);
			return "carservice/createRenting";
		}
		model.addAttribute("message", "客户身份证编号填写错误！！");
		return "carservice/rentCar";
	}
	
}
