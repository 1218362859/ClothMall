package com.femtoapp.service.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.femtoapp.pojo.Evaluate;
import com.femtoapp.pojo.EvaluateCustom;
import com.femtoapp.pojo.EvaluateQueryVo;
import com.femtoapp.service.EvaluateService;
import com.github.pagehelper.PageInfo;

public class EvaluateTest {
	@Test
	public void findObjectById() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		EvaluateService service = ac.getBean(EvaluateService.class);
		Evaluate evaluate = service.findObjectByid("1");
		System.out.println(evaluate);
	}

	@Test
	public void deleteObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		EvaluateService service = ac.getBean(EvaluateService.class);
		service.deleteObject("1");
	}

	@Test
	public void insertObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		EvaluateService service = ac.getBean(EvaluateService.class);
		Evaluate evaluate = new Evaluate();
		service.insertObject(evaluate);
	}

	@Test
	public void updateObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		EvaluateService service = ac.getBean(EvaluateService.class);
		Evaluate evaluate = new Evaluate();
		service.updateObject(evaluate);
	}

	@Test
	public void findObjectlist() throws Exception {
		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		EvaluateService service = ac.getBean(EvaluateService.class);
		EvaluateQueryVo uqv = new EvaluateQueryVo();
		EvaluateCustom uc = new EvaluateCustom();
		uqv.setEvaluateCustom(uc);
		PageInfo<EvaluateCustom> queryByPage = service.queryByPage(uqv, 1, 10);
		System.out.println(queryByPage);

	}
}
