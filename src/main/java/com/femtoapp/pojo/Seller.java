package com.femtoapp.pojo;

import java.util.List;

public class Seller {

	private String sid;
	private String name;
	private String create_time;
	private String type;
	
	private String username;
	private String password;
	private String photourl;
	private String phonenum;
	private String describes;
	private String seller_name;
	private Integer state;
	private List<Goods> goodsList;
	
	public List<Goods> getGoodsList() {
		return goodsList;
	}
	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}
	
	
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getDescribes() {
		return describes;
	}
	public void setDescribes(String describes) {
		this.describes = describes;
	}
	public String getSeller_name() {
		return seller_name;
	}
	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}
	
	
	public String getPhotourl() {
		return photourl;
	}
	public void setPhotourl(String photourl) {
		this.photourl = photourl;
	}
	@Override
	public String toString() {
		return "Seller [sid=" + sid + ", name=" + name + ", create_time=" + create_time + ", type=" + type
				+ ", username=" + username + ", password=" + password + ", photourl=" + photourl + ", phonenum="
				+ phonenum + ", describes=" + describes + ", seller_name=" + seller_name + ", state=" + state
				+ ", goodsList=" + goodsList + "]";
	}
	
}
