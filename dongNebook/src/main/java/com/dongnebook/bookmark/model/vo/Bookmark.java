package com.dongnebook.bookmark.model.vo;

public class Bookmark {
	private int userNo;
	private int bookNo;
	private String bookName;
	private String bookWriter;
	private String imageurl;
	private String ISBN;
	public Bookmark() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Bookmark(int userNo, int bookNo, String bookName, String bookWriter, String imageurl, String iSBN) {
		super();
		this.userNo = userNo;
		this.bookNo = bookNo;
		this.bookName = bookName;
		this.bookWriter = bookWriter;
		this.imageurl = imageurl;
		ISBN = iSBN;
	}
	
	public String getImageurl() {
		return imageurl;
	}
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
	public String getBookWriter() {
		return bookWriter;
	}
	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	
	
}
