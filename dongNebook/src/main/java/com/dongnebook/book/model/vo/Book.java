package com.dongnebook.book.model.vo;

public class Book {
	private int bookNo;
	private String bookName;
	private String bookKind;
	private String bookWriter;
	private String bookPublisher;
	private String bookIntroduce;
	private String imageurl;
	public Book(int bookNo, String bookName, String bookKind, String bookWriter, String bookPublisher,
			String bookIntroduce, String imageurl) {
		super();
		this.bookNo = bookNo;
		this.bookName = bookName;
		this.bookKind = bookKind;
		this.bookWriter = bookWriter;
		this.bookPublisher = bookPublisher;
		this.bookIntroduce = bookIntroduce;
		this.imageurl = imageurl;
	}
	public Book() {
		super();
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
	public String getBookKind() {
		return bookKind;
	}
	public void setBookKind(String bookKind) {
		this.bookKind = bookKind;
	}
	public String getBookWriter() {
		return bookWriter;
	}
	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
	}
	public String getBookPublisher() {
		return bookPublisher;
	}
	public void setBookPublisher(String bookPublisher) {
		this.bookPublisher = bookPublisher;
	}
	public String getBookIntroduce() {
		return bookIntroduce;
	}
	public void setBookIntroduce(String bookIntroduce) {
		this.bookIntroduce = bookIntroduce;
	}
	public String getImageurl() {
		return imageurl;
	}
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
	@Override
	public String toString() {
		return "Book [bookNo=" + bookNo + ", bookName=" + bookName + ", bookKind=" + bookKind + ", bookWriter="
				+ bookWriter + ", bookPublisher=" + bookPublisher + ", bookIntroduce=" + bookIntroduce + ", imageurl="
				+ imageurl + "]";
	}
	
	
}
