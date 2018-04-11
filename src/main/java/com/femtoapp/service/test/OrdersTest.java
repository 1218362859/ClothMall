package com.femtoapp.service.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.femtoapp.pojo.Orders;
import com.femtoapp.pojo.OrdersCustom;
import com.femtoapp.pojo.OrdersQueryVo;
import com.femtoapp.service.OrdersService;
import com.github.pagehelper.PageInfo;

public class OrdersTest {
	@Test
	public void findObjectById() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		OrdersService service = ac.getBean(OrdersService.class);
		Orders orders = service.findObjectByid("1");
		System.out.println(orders);
	}

	@Test
	public void deleteObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		OrdersService service = ac.getBean(OrdersService.class);
		service.deleteObject("1");
	}

	@Test
	public void insertObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		OrdersService service = ac.getBean(OrdersService.class);
		Orders orders = new Orders();
		service.insertObject(orders);
	}

	@Test
	public void updateObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		OrdersService service = ac.getBean(OrdersService.class);
		Orders orders = new Orders();
		service.updateObject(orders);
	}

	@Test
	public void findObjectlist() throws Exception {
		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		OrdersService service = ac.getBean(OrdersService.class);
		OrdersQueryVo uqv = new OrdersQueryVo();
		OrdersCustom uc = new OrdersCustom();
		uqv.setOrdersCustom(uc);
		PageInfo<OrdersCustom> queryByPage = service.queryByPage(uqv, 1, 10);
		System.out.println(queryByPage);

	}
}
