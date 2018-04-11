package com.femtoapp.pojo;

public class Photo {

	private String pid;
	private String gid;
	private String cid;
	
	private String type;
	private String imageurl;
	private String create_time;
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getImageurl() {
		return imageurl;
	}
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	@Override
	public String toString() {
		return "Photo [pid=" + pid + ", gid=" + gid + ", cid=" + cid + ", type=" + type + ", imageurl=" + imageurl
				+ ", create_time=" + create_time + "]";
	}
	
	
}
