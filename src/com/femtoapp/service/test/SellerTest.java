package com.femtoapp.service.test;

import java.util.UUID;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.femtoapp.pojo.Seller;
import com.femtoapp.pojo.SellerCustom;
import com.femtoapp.pojo.SellerQueryVo;
import com.femtoapp.service.SellerService;
import com.github.pagehelper.PageInfo;

public class SellerTest {

	@Test
	public void insertObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		SellerService service = ac.getBean(SellerService.class);
		Seller seller = new Seller();
		seller.setSid(UUID.randomUUID().toString());
		service.insertObject(seller);
	}

	
}
