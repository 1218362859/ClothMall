package com.femtoapp.pojo;

import java.util.List;

public class CollectCustom extends Collect{
	
	
	private String s_sid;
	private String s_name;
	private String s_photourl;
	private List<String > p_imageurl;
	private String p_type;
	public String getS_sid() {
		return s_sid;
	}
	public void setS_sid(String s_sid) {
		this.s_sid = s_sid;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_photourl() {
		return s_photourl;
	}
	public void setS_photourl(String s_photourl) {
		this.s_photourl = s_photourl;
	}
	public List<String> getP_imageurl() {
		return p_imageurl;
	}
	public void setP_imageurl(List<String> p_imageurl) {
		this.p_imageurl = p_imageurl;
	}
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	
	
}
