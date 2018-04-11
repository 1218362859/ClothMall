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
		//如果文件夹不存在则创建    
		if  (!file .exists()  && !file .isDirectory())      
		{       
		    System.out.println("//不存在");  
		     //file .mkdir();  //只能创建单个目录
		    file.mkdirs();// 创建多级目录
		}   
		String newfileName = null;
		if (multipartFile != null && originalFilename != null&& !originalFilename.toString().equals("")) {

			
			
		
			newfileName = UUID.randomUUID()
					+ originalFilename.substring(originalFilename
							.lastIndexOf("."));
			File newFile=new File(path+newfileName);
			
			//将内存中的数据写入
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
