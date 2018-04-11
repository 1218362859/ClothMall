package com.femtoapp.service.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.femtoapp.pojo.Photo;
import com.femtoapp.pojo.PhotoCustom;
import com.femtoapp.pojo.PhotoQueryVo;
import com.femtoapp.service.PhotoService;
import com.github.pagehelper.PageInfo;

public class PhotoTest {
	@Test
	public void findObjectById() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		PhotoService service = ac.getBean(PhotoService.class);
		Photo photo = service.findObjectByid("1");
		System.out.println(photo);
	}

	@Test
	public void deleteObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		PhotoService service = ac.getBean(PhotoService.class);
		service.deleteObject("1");
	}

	@Test
	public void insertObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		PhotoService service = ac.getBean(PhotoService.class);
		Photo photo = new Photo();
		service.insertObject(photo);
	}

	@Test
	public void updateObject() throws Exception {

		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		PhotoService service = ac.getBean(PhotoService.class);
		Photo photo = new Photo();
		service.updateObject(photo);
	}

	@Test
	public void findObjectlist() throws Exception {
		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext-dao.xml",
				"applicationContext-service.xml", "applicationContext-transation.xml" });
		PhotoService service = ac.getBean(PhotoService.class);
		PhotoQueryVo uqv = new PhotoQueryVo();
		PhotoCustom uc = new PhotoCustom();
		uqv.setPhotoCustom(uc);
		PageInfo<PhotoCustom> queryByPage = service.queryByPage(uqv, 1, 10);
		System.out.println(queryByPage);

	}
}
