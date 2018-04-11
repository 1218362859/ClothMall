package com.femtoapp.service.test;

import java.util.UUID;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.femtoapp.pojo.Address;
import com.femtoapp.pojo.AddressCustom;
import com.femtoapp.pojo.AddressQueryVo;
import com.femtoapp.service.AddressService;
import com.github.pagehelper.PageInfo;

public class AddressTest {
	@Test
	public void findObjectById() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		AddressService service = ac.getBean(AddressService.class);
		Address address = service.findObjectByid("1");
		System.out.println(address);
	}

	@Test
	public void deleteObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		AddressService service = ac.getBean(AddressService.class);
		service.deleteObject("1");
	}

	@Test
	public void insertObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		AddressService service = ac.getBean(AddressService.class);
		Address address = new Address();
		address.setAid(UUID.randomUUID().toString());
		address.setName("1");
		address.setPhonenum("18379607713");
		address.setSite("…Ó€⁄");
		address.setName("¡ı¿⁄");
		address.setUid("1");
		service.insertObject(address);
	}

	@Test
	public void updateObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		AddressService service = ac.getBean(AddressService.class);
		Address address = new Address();
		address.setPhonenum("123");
		address.setAid("817c1c52-6310-43ef-a3a6-d5a679f68425");
		service.updateObject(address);
	}

	@Test
	public void findObjectlist() throws Exception {
		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		AddressService service = ac.getBean(AddressService.class);
		AddressQueryVo uqv = new AddressQueryVo();
		AddressCustom uc = new AddressCustom();
		uqv.setAddressCustom(uc);
		PageInfo<AddressCustom> queryByPage = service.queryByPage(uqv, 1, 10);
		System.out.println(queryByPage);

	}
}
