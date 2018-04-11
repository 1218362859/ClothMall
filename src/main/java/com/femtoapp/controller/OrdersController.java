package com.femtoapp.controller;



import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.femtoapp.pojo.Orders;
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
	//客户端查询订单信息
	@RequestMapping("/findorderslistclient")
	public  @ResponseBody JSONObject findorderslistclient(OrdersCustom ordersCustom,Integer pageNo, Integer pageSize)throws Exception{
		JSONObject json = new JSONObject();
		
		OrdersQueryVo ordersQueryVo = new OrdersQueryVo();
		ordersQueryVo.setOrdersCustom(ordersCustom);
		try {
			PageInfo<OrdersCustom> queryByPage = ordersService.queryByPage(ordersQueryVo, pageNo,pageSize);
			json.put("result",-1);
			json.put("queryByPage",queryByPage);
			json.put("ordersCustom", ordersCustom);
			return json;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			json.put("result",-1);
			json.put("message",e.getMessage());
			return json;
		}
	}
	
	//添加订单信息
	@RequestMapping("/insertorderslistclient")
	public  @ResponseBody JSONObject insertorderslistclient(Orders orders)throws Exception{
		JSONObject json = new JSONObject();
		
		try {
			orders.setOid(UUID.randomUUID().toString());
			orders.setCreate_time(current_time());
		ordersService.insertObject(orders);
			json.put("result",-1);
			json.put("message","订单提交成功");
			return json;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			json.put("result",-1);
			json.put("message",e.getMessage());
			return json;
		}
	}
	
	//修改订单信息
		@RequestMapping("/updatetorderslistclient")
		public  @ResponseBody JSONObject updatetorderslistclient(Orders orders)throws Exception{
			JSONObject json = new JSONObject();
			
			try {
			ordersService.updateObject(orders);
				json.put("result",-1);
				json.put("message","订单修改成功");
				return json;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				json.put("result",-1);
				json.put("message",e.getMessage());
				return json;
			}
		}
	private String current_time() {

		Date d = new Date();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateNowStr = sdf.format(d);

		return dateNowStr;
	}
}
