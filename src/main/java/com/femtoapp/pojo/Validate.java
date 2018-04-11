package com.femtoapp.pojo;

public class Validate {

	private Integer id;
	private  String phonenum;
	private String validateCode;
	private String create_time;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getValidateCode() {
		return validateCode;
	}
	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	@Override
	public String toString() {
		return "Validate [id=" + id + ", phonenum=" + phonenum + ", validateCode=" + validateCode + ", create_time="
				+ create_time + "]";
	}
	
	
	
	
	
}
