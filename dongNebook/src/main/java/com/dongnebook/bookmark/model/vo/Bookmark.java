package com.dongnebook.bookmark.model.vo;

public class Bookmark {
	private int userNo;
	private String ISBN;
	public Bookmark() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Bookmark(int userNo, String ISBN) {
		super();
		this.userNo = userNo;
		ISBN = ISBN;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String ISBN) {
		ISBN = ISBN;
	}
	
	
}
