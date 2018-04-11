package com.femtoapp.pojo;

import java.util.List;

public class Collect {
	
	
	private String coid;
	private String type;
	private String cid;
	private String sid;
	private String create_time;
	private String uid;
	private Seller seller;
	private List<Photo> photoList;
	private Goods goods;
	private Category category;
	
	
	
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public String getCoid() {
		return coid;
	}
	public void setCoid(String coid) {
		this.coid = coid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public Seller getSeller() {
		return seller;
	}
	public void setSeller(Seller seller) {
		this.seller = seller;
	}
	public List<Photo> getPhotoList() {
		return photoList;
	}
	public void setPhotoList(List<Photo> photoList) {
		this.photoList = photoList;
	}
	@Override
	public String toString() {
		return "Collect [coid=" + coid + ", type=" + type + ", cid=" + cid + ", sid=" + sid + ", create_time="
				+ create_time + ", uid=" + uid + ", seller=" + seller + ", photoList=" + photoList + ", goods=" + goods
				+ ", category=" + category + "]";
	}
	
 	
	
}
