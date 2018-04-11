package com.femtoapp.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

//全局异常解析器
public class ClothMallExceptionResolver  implements HandlerExceptionResolver {

	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object hander, Exception ex) {
	
		ClothMallException ClothmallException=null;
		
		if(ex instanceof ClothMallException){
			ClothmallException=(ClothMallException) ex;
		}else{
			ClothmallException=new ClothMallException("服务器忙");
			
		}
		String  message=ClothmallException.getMessage();
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("message",message);
		
		modelAndView.setViewName("/error.jsp");
		
		return modelAndView;
	}

}
