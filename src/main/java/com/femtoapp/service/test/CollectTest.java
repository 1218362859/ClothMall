package com.femtoapp.service.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.femtoapp.pojo.Collect;
import com.femtoapp.pojo.CollectCustom;
import com.femtoapp.pojo.CollectQueryVo;
import com.femtoapp.service.CollectService;
import com.github.pagehelper.PageInfo;

public class CollectTest {
	@Test
	public void findObjectById() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		CollectService service = ac.getBean(CollectService.class);
		Collect collect = service.findObjectByid("1");
		System.out.println(collect);
	}

	@Test
	public void deleteObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		CollectService service = ac.getBean(CollectService.class);
		service.deleteObject("1");
	}

	@Test
	public void insertObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		CollectService service = ac.getBean(CollectService.class);
		Collect collect = new Collect();
		service.insertObject(collect);
	}

	@Test
	public void updateObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		CollectService service = ac.getBean(CollectService.class);
		Collect collect = new Collect();
		service.updateObject(collect);
	}

	@Test
	public void findObjectlist() throws Exception {
		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		CollectService service = ac.getBean(CollectService.class);
		CollectQueryVo uqv = new CollectQueryVo();
		CollectCustom uc = new CollectCustom();
		uqv.setCollectCustom(uc);
		PageInfo<CollectCustom> queryByPage = service.queryByPage(uqv, 1, 10);
		System.out.println(queryByPage);

	}
}
