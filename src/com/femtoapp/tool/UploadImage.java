package com.femtoapp.tool;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class UploadImage {
	public static  String  uploadimage(MultipartFile multipartFile) throws IllegalStateException, IOException {
		String originalFilename = multipartFile.getOriginalFilename();
		String currtenttime=current_time_day();
		String path="C:\\resources\\fileUpload\\images\\"+currtenttime+"\\";
		File file =new File(path);    
		//����ļ��в������򴴽�    
		if  (!file .exists()  && !file .isDirectory())      
		{       
		    System.out.println("//������");  
		     //file .mkdir();  //ֻ�ܴ�������Ŀ¼
		    file.mkdirs();// �����༶Ŀ¼
		}   
		String newfileName = null;
		if (multipartFile != null && originalFilename != null&& !originalFilename.toString().equals("")) {

			
			
		
			newfileName = UUID.randomUUID()
					+ originalFilename.substring(originalFilename
							.lastIndexOf("."));
			File newFile=new File(path+newfileName);
			
			//���ڴ��е�����д��
			multipartFile.transferTo(newFile);
		}
		return "/resources/fileUpload/images/"+ currtenttime+"/"+newfileName;
	}
	
	private static String current_time_day() {

		Date d = new Date();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String dateNowStr = sdf.format(d);

		return dateNowStr;
	}
}
