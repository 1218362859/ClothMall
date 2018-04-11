package com.femtoapp.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.femtoapp.pojo.User;

public class LoginInterceptors implements HandlerInterceptor{

	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {

		//获取url
		//判断url是否是公开地址  实际开发公开地址要配置在配置文件中
		String url=request.getRequestURI();
		//如果url含login.action放行
		if(url.indexOf("login.action")>=0||url.indexOf("register.action")>=0||url.indexOf("client.action")>=0){
			
			return true;
		}
		HttpSession session = request.getSession();
		User user=(User) session.getAttribute("admin");
		//用户登陆存在
		 if(user!=null){
			 
			 return true;
		 }
		 
		 //执行到这 说明需要登陆
		 request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
		
		return false;
		
	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
