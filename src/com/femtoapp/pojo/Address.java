package com.femtoapp.pojo;

public class Address {

	private String aid;
	private String uid;
	private String site;
	private String phonenum;
	private String name;
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Address [aid=" + aid + ", uid=" + uid + ", site=" + site + ", phonenum=" + phonenum + ", name=" + name
				+ "]";
	}
	
}
