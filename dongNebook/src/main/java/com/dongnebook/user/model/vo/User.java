package com.dongnebook.user.model.vo;

import com.dongnebook.category.model.vo.Category;


/**
 * @author 김종모 
 *
 */
public class User {
	private int userNo;
	private Category category;
	private String userId;
	private String userPw;
	private String userName;
	private String phone;
	private String email;
	private String addr;
	public int getUserNo() {
		return userNo;
	}
	public Category getCategory() {
		return category;
	}
	public String getUserId() {
		return userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public String getUserName() {
		return userName;
	}
	public String getPhone() {
		return phone;
	}
	public String getEmail() {
		return email;
	}
	public String getAddr() {
		return addr;
	}
	
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public User(int userNo, Category category, String userId, String userPw, String userName, String phone,
			String email, String addr) {
		super();
		this.userNo = userNo;
		this.category = category;
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.addr = addr;
	}
	public User() {
		super();
	}
	public User(int userNo) {
		this.userNo = userNo;
	}
	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", category=" + category + ", userId=" + userId + ", userPw=" + userPw
				+ ", userName=" + userName + ", phone=" + phone + ", email=" + email + ", addr=" + addr + "]";
	}
	
	
	
}
