package com.femtoapp.service.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.femtoapp.pojo.Category;
import com.femtoapp.pojo.CategoryCustom;
import com.femtoapp.pojo.CategoryQueryVo;
import com.femtoapp.service.CategoryService;
import com.github.pagehelper.PageInfo;

public class CategoryTest {
	@Test
	public void findObjectById() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		CategoryService service = ac.getBean(CategoryService.class);
		Category category = service.findObjectByid("1");
		System.out.println(category);
	}

	@Test
	public void deleteObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		CategoryService service = ac.getBean(CategoryService.class);
		service.deleteObject("1");
	}

	@Test
	public void insertObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		CategoryService service = ac.getBean(CategoryService.class);
		Category category = new Category();
		service.insertObject(null);
	}

	@Test
	public void updateObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		CategoryService service = ac.getBean(CategoryService.class);
		Category category = new Category();
		service.updateObject(null);
	}

	@Test
	public void findObjectlist() throws Exception {
		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		CategoryService service = ac.getBean(CategoryService.class);
		CategoryQueryVo uqv = new CategoryQueryVo();
		CategoryCustom uc = new CategoryCustom();
		uqv.setCategoryCustom(uc);
		PageInfo<CategoryCustom> queryByPage = service.queryByPage(uqv, 1, 10);
		System.out.println(queryByPage);

	}
}
