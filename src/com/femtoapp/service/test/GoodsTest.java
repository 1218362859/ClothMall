package com.femtoapp.service.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.femtoapp.pojo.Goods;
import com.femtoapp.pojo.GoodsCustom;
import com.femtoapp.pojo.GoodsQueryVo;
import com.femtoapp.service.GoodsService;
import com.github.pagehelper.PageInfo;

public class GoodsTest {
	@Test
	public void findObjectById() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		GoodsService service = ac.getBean(GoodsService.class);
		Goods goods = service.findObjectByid("1");
		System.out.println(goods);
	}

	@Test
	public void deleteObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		GoodsService service = ac.getBean(GoodsService.class);
		service.deleteObject("1");
	}

	@Test
	public void insertObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		GoodsService service = ac.getBean(GoodsService.class);
		Goods goods = new Goods();
		goods.setSid("123");
		goods.setGid("1234");
		service.insertObject(null);
	}

	@Test
	public void updateObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		GoodsService service = ac.getBean(GoodsService.class);
		Goods goods = new Goods();
		service.updateObject(goods);
	}

	@Test
	public void findObjectlist() throws Exception {
		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		GoodsService service = ac.getBean(GoodsService.class);
		GoodsQueryVo uqv = new GoodsQueryVo();
		GoodsCustom uc = new GoodsCustom();
		uqv.setGoodsCustom(uc);
		PageInfo<GoodsCustom> queryByPage = service.queryByPage(uqv, 1, 10);
		System.out.println(queryByPage);

	}
}
