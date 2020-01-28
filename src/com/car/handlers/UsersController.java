package com.car.handlers;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.car.pojo.Menus;
import com.car.pojo.Users;
import com.car.service.RolesService;
import com.car.service.UsersService;
import com.car.utils.PageBean;

@Controller
@Scope("prototype")
@RequestMapping("/user")
public class UsersController {
	@Resource
	private UsersService usersService;
	@Resource
	private RolesService rolesService;
	
	public void setRolesService(RolesService rolesService) {
		this.rolesService = rolesService;
	}
	
	public RolesService getRolesService() {
		return rolesService;
	}
	
	public void setService(UsersService usersService) {
		this.usersService = usersService;
	}
	
	public UsersService getService() {
		return usersService;
	}
	
	@RequestMapping("/addUser.do")
	public String addUser(Users user){
		//添加用户信息
		usersService.addUser(user);
			
		return "redirect:/tips.jsp";
	}
	
	@RequestMapping("/findName.do")
	@ResponseBody
	public Object FindName(String userName){
		//添加用户时验证登录名是否重复
		if (userName == null || userName == "") {
			return true;
		}
		Users users = usersService.selectUser(userName);
		if (users != null) {
			return false;
		}
		return true;
	}
	
	@RequestMapping("/findIdentity.do")
	@ResponseBody
	public Object findIdentity(String identity){
		//添加用户时验证登录名是否重复
		if (identity == null || identity == "") {
			return true;
		}
		Users users = usersService.selectByIdentity(identity);
		if (users != null) {
			return false;
		}
		return true;
	}
	
	@RequestMapping("/findUsers.do")
	public String findUsers(Users users,Model model,@RequestParam(value="index",defaultValue="1") Integer index){
		//查询用户信息（高级查询）（分页）
		PageBean<Users> pageBean = new PageBean<>();
		pageBean.setIndex(index);
		usersService.findUsers(pageBean, users);
		model.addAttribute("oldUser", users);
		model.addAttribute("pageBean", pageBean);
		return "users/showUsers";
	}
	
	@RequestMapping("/DeleteUser.do")
	public String deleteUser(String userName,Model model){
		//删除用户信息
		boolean flag = usersService.removeUser(userName);
		if (flag) {
			return "redirect:findUsers.do";
		}
		model.addAttribute("message", "用户操作过出租汽车功能或者汽车入库功能，因不能删除");
		return "error";
	}
	
	@RequestMapping("/SelectUser.do")
	public String selectUser(String userName,Model model){
		//查询用户信息
		Users user = usersService.selectUser(userName);
		model.addAttribute("user", user);
		return "users/updateUser";
	}
	
	@RequestMapping("/ModifyUser.do")
	public String modifyUser(Users user,HttpSession session){
		//修改用户信息
		usersService.modifyUser(user);
		Users user2 = (Users) session.getAttribute("user");
		//如果用户和修改的用户是同一用户，则退出系统，需重新登录
		if (user.getUserName() == user2.getUserName()) {
			return "redirect:logout.do";
		}
		return "redirect:/tips.jsp";
	}

	@RequestMapping("/login.do")
	public String login(Users user1,Model model,HttpServletRequest request){
		//验证用户登录信息
		Users user2 = usersService.login(user1);
		if (user2 != null) {
			List<Menus> menuList = rolesService.selectByRoleId(user2.getUserLevel());
			request.getSession().setAttribute("menuList", menuList);
			request.getSession().setAttribute("user", user2);
			return "redirect:/index.jsp";
		}
		model.addAttribute("message", "用户名或密码错误！！");
		return "login";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest req){
		//销毁Session
		req.getSession().invalidate();
		return "redirect:/login.jsp";
	}
}
