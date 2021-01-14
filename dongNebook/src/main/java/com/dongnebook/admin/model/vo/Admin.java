package com.dongnebook.admin.model.vo;

public class Admin {
	private int adminNo;
	private String adminId;
	private String adminPw;
	private String nickName;
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Admin(int adminNo, String adminId, String adminPw, String nickName) {
		super();
		this.adminNo = adminNo;
		this.adminId = adminId;
		this.adminPw = adminPw;
		this.nickName = nickName;
	}
	public int getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPw() {
		return adminPw;
	}
	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	@Override
	public String toString() {
		return "Admin [adminNo = "+adminNo+", adminId = "+adminId+", adminPw = "+adminPw+", adminNickName = "+nickName+"]";
	}
	
}
