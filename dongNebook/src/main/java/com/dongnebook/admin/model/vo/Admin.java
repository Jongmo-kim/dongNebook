package com.dongnebook.admin.model.vo;

public class Admin {
	private int adminNo;
	private String adminId;
	private String adminPw;
	private String adminNickName;
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Admin(int adminNo, String adminId, String adminPw, String adminNickName) {
		super();
		this.adminNo = adminNo;
		this.adminId = adminId;
		this.adminPw = adminPw;
		this.adminNickName = adminNickName;
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
	public String getAdminNickName() {
		return adminNickName;
	}
	public void setAdminNickName(String adminNickName) {
		this.adminNickName = adminNickName;
	}
	
	
	
}
