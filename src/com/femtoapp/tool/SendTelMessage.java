package com.femtoapp.tool;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;


public class SendTelMessage {
	public static void main(String[] avgs) throws Exception{
	       
	       
	       SMSsend("2345","18379607713");
//	       SendShare("(深圳市深南jianidgesfdsadfs中路电子科)","18379607713");
	      
	   }
	 
	 
	 static public int SMSsend(String msg , String mobile) throws Exception{
		   int error_code = 1;
		   String result = "";
		   String CorpID="302237"; //登录ID号
	       String LoginName="Admin";//登录名
	       String passwd="216811";//登录密码
	       Date now = new Date(); 
	       SimpleDateFormat dateFormat = new SimpleDateFormat("MMddHHmmss");//日期格式化
	       String timeStamp = dateFormat.format(now);	 
	       String strPwsd = MD5Tools.MD5(CorpID+passwd+timeStamp);//MD5加密方式
		   String urls="";
	       	 
	       
	       try{
	    	   msg=URLEncoder.encode("您的验证码为" + msg,"GBK");//转码
	    	   String baseUrl = "sms3.mobset.com";//广州首易短信接口地址,CorpID开头数字是3，对应地址是sms3.mobset.com
		       urls="http://"+baseUrl+"/SDK2/Sms_Send.asp?CorpID="+CorpID+"&LoginName="+LoginName+"&TimeStamp="+timeStamp+"&passwd="+strPwsd+"&send_no="+mobile+"&Timer=&msg="+msg+"&LongSms=1";
		       System.out.println(urls);
		       URL U = new URL(urls);
			   URLConnection connection = U.openConnection();
			   connection.connect();
			   BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			   String line;
			   while ((line = in.readLine())!= null) {
			     result += line;
			   }
			   
			   in.close();   
		   }catch(Exception e){
		    System.out.println("没有结果！"+e);
		    error_code = -1;
		   }
	       System.out.println(error_code);
	       return  error_code;
	  }


	public static String SendShare(String msg , String mobile) throws Exception {
		// TODO Auto-generated method stub
	   int error_code = 0;
	   String result = "";
	   String CorpID="302237"; //登录ID号
    String LoginName="Admin";//登录名
    String passwd="216811";//登录密码
    Date now = new Date(); 
    SimpleDateFormat dateFormat = new SimpleDateFormat("MMddHHmmss");//日期格式化
    String timeStamp = dateFormat.format(now);	 
    String strPwsd = MD5Tools.MD5(CorpID+passwd+timeStamp);//MD5加密方式
	   String urls="";
	   String urls2="";
	   
    try{
 	   msg=URLEncoder.encode("尊敬的用户，您现在可以通过百创鹰眼APP直接掌控"+msg+"的现场施工情况，若需下载百创鹰眼APP，请点击下方地址进行下载：http://www.bc100.com/download/bcyingyan.apk。如有问题，请致电客服热线：400-888-6266。回复TD退订","GBK");	
 	   //msg=URLEncoder.encode("尊敬的用户，您好！您现在已经可以通过百创鹰眼app直接观看"+msg+"现场施工情况，若需下载请点击www.bc100.com。如有问题，请致电公司客服热线：400-888-6266","GBK");//转码
 	   String baseUrl = "sms3.mobset.com";//广州首易短信接口地址,CorpID开头数字是3，对应地址是sms3.mobset.com
	       urls="http://"+baseUrl+"/SDK2/Sms_Send.asp?CorpID="+CorpID+"&LoginName="+LoginName+"&TimeStamp="+timeStamp+"&passwd="+strPwsd+"&send_no="+mobile+"&Timer=&msg="+msg+"&LongSms=1";
	       System.out.println(urls);
	       URL U = new URL(urls);
		   URLConnection connection = U.openConnection();
		   connection.connect();
		   BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
		   String line;
		   while ((line = in.readLine())!= null) {
		     result += line;
		   }
		   
		   in.close();   
	   }catch(Exception e){
	    System.out.println("没有结果！"+e);
	    error_code = 1;
	   }
    System.out.println(error_code);
    return  "" + error_code;
	}
}
