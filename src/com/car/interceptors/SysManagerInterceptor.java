package com.car.interceptors;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.car.mapper.IFunsMapper;
import com.car.pojo.Funs;
import com.car.pojo.Menus;
import com.car.pojo.Users;

public class SysManagerInterceptor implements HandlerInterceptor {

	private IFunsMapper mapper;

	public void setMapper(IFunsMapper mapper) {
		this.mapper = mapper;
	}

	public IFunsMapper getMapper() {
		return mapper;
	}

	@SuppressWarnings("unchecked")//去警告
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// 如果是登录页面或登录动作放行
		String uri = request.getRequestURI();
		if (uri.indexOf("login.jsp") != -1 || uri.indexOf("user/login.do") != -1 || "/car/".equals(uri)) {
			return true;
		}
		// 判断用户是否登录
		Users user = (Users) request.getSession().getAttribute("user");
		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/login.jsp");
			return false;
		}
		List<Funs> funsList = new ArrayList<>();
		// 得到该用户所拥有的权限List
		List<Menus> menuList = (List<Menus>) request.getSession().getAttribute("menuList");
		for (Menus menus : menuList) {
			List<Funs> funsList2 = mapper.selectByMenuId(menus.getMenuId());
			funsList.addAll(funsList2);
		}
		// 判断该用户是否有权限访问
		for (Funs funs : funsList) {
			if (uri.indexOf(funs.getFunUrl()) != -1) {

				return true;
			} 
		}
		request.setAttribute("message", "您无权访问该页面");
		request.getRequestDispatcher("/error.jsp").forward(request, response);
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

	}

}
