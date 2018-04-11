package com.femtoapp.pojo;

public class Shopp {

	private String scid;
	private String gid;
	
	private String uid;
	private Integer counts;
	private String create_time;
	public String getScid() {
		return scid;
	}
	public void setScid(String scid) {
		this.scid = scid;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public Integer getCounts() {
		return counts;
	}
	public void setCounts(Integer counts) {
		this.counts = counts;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	@Override
	public String toString() {
		return "Shopp [scid=" + scid + ", gid=" + gid + ", uid=" + uid + ", counts=" + counts + ", create_time="
				+ create_time + "]";
	}
	
}
