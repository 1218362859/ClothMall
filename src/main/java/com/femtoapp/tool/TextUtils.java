package com.femtoapp.tool;

import java.math.BigDecimal;
import java.util.Calendar;

public class TextUtils {
	public static int getYear() {
        Calendar a = Calendar.getInstance();
        return a.get(Calendar.YEAR);
    }
	
	public static boolean isEmpty(String str) {
		if (("".equals(str)) || (str == null)) {
			return true;
		}
		return false;
	}

	public static boolean isMobile(String str) {
		if (str.matches("^1[3-8]\\d{9}$")){
			System.out.println(str);
			return true;
		}else
			return false;
	}

	public static boolean isDate(String str) {
		if (str
				.matches("^((\\d{2}(([02468][048])|([13579][26]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])))))|(\\d{2}(([02468][1235679])|([13579][01345789]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))(\\s(((0?[0-9])|([1-2][0-3]))\\:([0-5]?[0-9])((\\s)|(\\:([0-5]?[0-9])))))?$")) {
			return true;
		} else {
			return false;
		}
	}
	public static boolean isMail(String str){
		if(str.matches("^([a-zA-Z0-9]*[-_]?[a-zA-Z0-9]+)*@([a-zA-Z0-9]*[-_]?[a-zA-Z0-9]+)+[\\.][A-Za-z]{2,3}([\\.][A-Za-z]{2})?$")){
			System.out.println(str);
			return true;
		}else{
			return false;
		}
	}
	public static boolean isIp(String str){
		if(str.matches("\\b((?!\\d\\d\\d)\\d+|1\\d\\d|2[0-4]\\d|25[0-5])\\.((?!\\d\\d\\d)\\d+|1\\d\\d|2[0-4]\\d|25[0-5])\\.((?!\\d\\d\\d)\\d+|1\\d\\d|2[0-4]\\d|25[0-5])\\.((?!\\d\\d\\d)\\d+|1\\d\\d|2[0-4]\\d|25[0-5])\\b")){
			return true;
		}else{
			return false;
		}
	}
	public static String Stringinsert(String a,String b,int t){
		return a.substring(0,t)+b+a.substring(t+1,a.length());
		} 
	public static String isNull(String text){
	
		if(null==text){
			return "";
		}
		
		return text;		
	}
	
    private static final int DEF_DIV_SCALE = 10;

	 public static double add(double v1, double v2) {
	        BigDecimal b1 = new BigDecimal(Double.toString(v1));
	        BigDecimal b2 = new BigDecimal(Double.toString(v2));
	        return b1.add(b2).doubleValue();
	    }

	    public static double sub(double v1, double v2) {
	        BigDecimal b1 = new BigDecimal(Double.toString(v1));
	        BigDecimal b2 = new BigDecimal(Double.toString(v2));
	        return b1.subtract(b2).doubleValue();
	    }

	    public static double mul(double v1, double v2) {
	        BigDecimal b1 = new BigDecimal(Double.toString(v1));
	        BigDecimal b2 = new BigDecimal(Double.toString(v2));
	        return b1.multiply(b2).doubleValue();
	    }

	    public static double div(double v1, double v2) {
	        return div(v1, v2, DEF_DIV_SCALE);
	    }

	    public static double div(double v1, double v2, int scale) {
	        if (scale < 0) {
	            throw new IllegalArgumentException("The scale must be a positive integer or zero");
	        }
	        BigDecimal b1 = new BigDecimal(Double.toString(v1));
	        BigDecimal b2 = new BigDecimal(Double.toString(v2));
	        return b1.divide(b2, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
	    }

	    public static double round(double v, int scale) {
	        if (scale < 0) {
	            throw new IllegalArgumentException("The scale must be a positive integer or zero");
	        }
	        BigDecimal b = new BigDecimal(Double.toString(v));
	        BigDecimal one = new BigDecimal("1");
	        return b.divide(one, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
	    }

}
