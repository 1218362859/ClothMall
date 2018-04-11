package com.femtoapp.service.test;

import java.util.UUID;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.femtoapp.pojo.User;
import com.femtoapp.pojo.UserCustom;
import com.femtoapp.pojo.UserQueryVo;
import com.femtoapp.service.UserService;
import com.github.pagehelper.PageInfo;

public class UserTest {
	@Test
	public void findObjectById() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		UserService service = ac.getBean(UserService.class);
		User user = service.findObjectByid("1");
		System.out.println(user);
	}

	@Test
	public void deleteObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		UserService service = ac.getBean(UserService.class);
		service.deleteObject("1");
	}

	@Test
	public void insertObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		UserService service = ac.getBean(UserService.class);
		User user = new User();
		user.setUid(UUID.randomUUID().toString());
		user.setUsername("12");
		service.insertObject(user);
	}

	@Test
	public void updateObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		UserService service = ac.getBean(UserService.class);
		User user = new User();
		service.updateObject(user);
	}

	@Test
	public void findObjectlist() throws Exception {
		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		UserService service = ac.getBean(UserService.class);
		UserQueryVo uqv = new UserQueryVo();
		UserCustom uc = new UserCustom();
		uqv.setUserCustom(uc);
		PageInfo<UserCustom> queryByPage = service.queryByPage(uqv, 1, 10);
		System.out.println(queryByPage);

	}
}
