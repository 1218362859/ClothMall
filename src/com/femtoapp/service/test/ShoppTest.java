package com.femtoapp.service.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.femtoapp.pojo.Shopp;
import com.femtoapp.pojo.ShoppCustom;
import com.femtoapp.pojo.ShoppQueryVo;
import com.femtoapp.service.ShoppService;
import com.github.pagehelper.PageInfo;

public class ShoppTest {
	@Test
	public void findObjectById() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		ShoppService service = ac.getBean(ShoppService.class);
		Shopp shopp = service.findObjectByid("1");
		System.out.println(shopp);
	}

	@Test
	public void deleteObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		ShoppService service = ac.getBean(ShoppService.class);
		service.deleteObject("1");
	}

	@Test
	public void insertObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		ShoppService service = ac.getBean(ShoppService.class);
		Shopp shopp = new Shopp();
		service.insertObject(shopp);
	}

	@Test
	public void updateObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		ShoppService service = ac.getBean(ShoppService.class);
		Shopp shopp = new Shopp();
		service.updateObject(shopp);
	}

	@Test
	public void findObjectlist() throws Exception {
		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		ShoppService service = ac.getBean(ShoppService.class);
		ShoppQueryVo uqv = new ShoppQueryVo();
		ShoppCustom uc = new ShoppCustom();
		uqv.setShoppCustom(uc);
		PageInfo<ShoppCustom> queryByPage = service.queryByPage(uqv, 1, 10);
		System.out.println(queryByPage);

	}
}
