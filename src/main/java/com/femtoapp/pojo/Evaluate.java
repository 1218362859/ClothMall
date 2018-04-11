package com.femtoapp.pojo;

public class Evaluate {

	private String eid;
	private String gid;
	private String  cid;
	private String uid;
	private String content;
	private float score;
	private String pid;
	public String getEid() {
		return eid;
	}
	public void setEid(String eid) {
		this.eid = eid;
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
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	@Override
	public String toString() {
		return "Evaluate [eid=" + eid + ", gid=" + gid + ", cid=" + cid + ", uid=" + uid + ", content=" + content
				+ ", score=" + score + ", pid=" + pid + "]";
	}
	
}
