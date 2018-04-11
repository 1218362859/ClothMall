package com.femtoapp.pojo;

public class Category {

	private String cid;
	private String gid;
	private String name;
	private float price;
	private Integer inventory;
	private Integer min_unit;
	private String imageurl;
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public Integer getInventory() {
		return inventory;
	}
	public void setInventory(Integer inventory) {
		this.inventory = inventory;
	}
	public Integer getMin_unit() {
		return min_unit;
	}
	public void setMin_unit(Integer min_unit) {
		this.min_unit = min_unit;
	}
	public String getImageurl() {
		return imageurl;
	}
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
	@Override
	public String toString() {
		return "Category [cid=" + cid + ", gid=" + gid + ", name=" + name + ", price=" + price + ", inventory="
				+ inventory + ", min_unit=" + min_unit + ", imageurl=" + imageurl + "]";
	}
	
}
