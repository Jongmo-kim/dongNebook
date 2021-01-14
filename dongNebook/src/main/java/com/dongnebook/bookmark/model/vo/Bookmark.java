package com.dongnebook.bookmark.model.vo;

public class Bookmark {
	private int userNo;
	private String ISBN;
	public Bookmark() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Bookmark(int userNo, String iSBN) {
		super();
		this.userNo = userNo;
		ISBN = iSBN;
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
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	
	
	
}
