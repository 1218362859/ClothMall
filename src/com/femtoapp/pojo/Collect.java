package com.femtoapp.pojo;

public class Collect {
	
	
	private String coid;
	private String type;
	private String gid;
	private String sid;
	private String create_time;
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
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
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
	@Override
	public String toString() {
		return "Collect [coid=" + coid + ", type=" + type + ", gid=" + gid + ", sid=" + sid + ", create_time="
				+ create_time + "]";
	}
	
}
