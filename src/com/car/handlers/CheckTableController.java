package com.car.handlers;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.car.pojo.CheckTable;
import com.car.service.CheckTableService;
import com.car.utils.PageBean;

@Controller
@Scope("prototype")
@RequestMapping("/check")
public class CheckTableController {
	@Resource
	private CheckTableService checkservice;
	
	public void setCheckservice(CheckTableService checkservice) {
		this.checkservice = checkservice;
	}
	
	public CheckTableService getCheckservice() {
		return checkservice;
	}
	
	@RequestMapping("/addCheck.do")
	public String addCheck(CheckTable checkTable,String carNumber,Model model){
		//添加还车信息
		boolean flag = checkservice.addCheck(checkTable,carNumber);
		if (flag) {
			
			return "redirect:/tips.jsp";
		}
		model.addAttribute("message", "还车失败");
		return "carservice/createRenturning";
	}
	
	@RequestMapping("/findChecks.do")
	public String findChecks(CheckTable checkTable,Model model,@RequestParam(value="index",defaultValue="1")Integer index){
		//查询检查单信息（高级查询）
		PageBean<CheckTable> pageBean = new PageBean<>();
		pageBean.setIndex(index);
		checkservice.findChecks(pageBean, checkTable);
		model.addAttribute("oldCheck", checkTable);
		model.addAttribute("pageBean", pageBean);
		return "checkManager/showReturn";
	}
	
	@RequestMapping("/SelectCheck.do")
	public String selectCheck(Long checkId,Model model){
		//查找检查单信息
		CheckTable checkTable = checkservice.selectCheck(checkId);
		model.addAttribute("check", checkTable);
		return "checkManager/updateReturn";
	}
	
	@RequestMapping("/DeleteCheck.do")
	public String deleteCheck(Long checkId){
		//删除检查单信息
		checkservice.deleteReturn(checkId);
		
		return "redirect:/tips.jsp";
	}
	
	@RequestMapping("/ModifyReturn.do")
	public String modifyReturn(CheckTable checkTable){
		//修改检查单信息
		checkservice.modifyReturn(checkTable);
		
		return "redirect:/tips.jsp";
	}
	
}
