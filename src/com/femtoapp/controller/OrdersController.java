package com.femtoapp.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.femtoapp.pojo.OrdersCustom;
import com.femtoapp.pojo.OrdersQueryVo;
import com.femtoapp.service.OrdersService;
import com.github.pagehelper.PageInfo;



@Controller
@RequestMapping("/orders")
public class OrdersController {

	@Autowired
	private OrdersService ordersService;


	@RequestMapping("/findorderslist")
	public ModelAndView findorderslist(OrdersCustom ordersCustom,Integer pageNo, Integer pageSize)throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		
		OrdersQueryVo ordersQueryVo = new OrdersQueryVo();
		ordersQueryVo.setOrdersCustom(ordersCustom);
		PageInfo<OrdersCustom> queryByPage = ordersService.queryByPage(ordersQueryVo, pageNo,pageSize);
		
		modelAndView.setViewName("/WEB-INF/admin/orderslist.jsp");
		modelAndView.addObject("queryByPage", queryByPage);
		modelAndView.addObject("orders", ordersCustom);
		return modelAndView;
	}


}
