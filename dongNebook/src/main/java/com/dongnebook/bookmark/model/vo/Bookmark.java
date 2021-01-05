package com.dongnebook.bookmark.model.vo;

public class Bookmark {
	private int userNo;
	private String ISBN13;
	public Bookmark() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Bookmark(int userNo, String iSBN13) {
		super();
		this.userNo = userNo;
		ISBN13 = iSBN13;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getISBN13() {
		return ISBN13;
	}
	public void setISBN13(String iSBN13) {
		ISBN13 = iSBN13;
	}
	
	
}
