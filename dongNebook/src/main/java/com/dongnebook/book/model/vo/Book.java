package com.dongnebook.book.model.vo;

public class Book {
	private int bookNo;
	private String bookName;
	private String bookKind;
	private String bookWriter;
	private String bookPublisher;
	private String bookIntroduce;
	private String imageurl;
	private String ISBN13;
	private String ISBN10;
	private int bookCount;
	private int rCount;
	private int rankNum;
	public Book(int bookNo, String bookName, String bookKind, String bookWriter, String bookPublisher,
			String bookIntroduce, String imageurl, String ISBN13, String ISBN10, int bookCount, int rCount, int rankNum) {
		super();
		this.bookNo = bookNo;
		this.bookName = bookName;
		this.bookKind = bookKind;
		this.bookWriter = bookWriter;
		this.bookPublisher = bookPublisher;
		this.bookIntroduce = bookIntroduce;
		this.imageurl = imageurl;
		this.ISBN13 = ISBN13;
		this.ISBN10 = ISBN10;
		this.bookCount = bookCount;
		this.rCount = rCount;
		this.rankNum = rankNum;
	}
	public String getISBN10() {
		return ISBN10;
	}
	public void setISBN10(String iSBN10) {
		ISBN10 = iSBN10;
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
	public String getISBN13() {
		return ISBN13;
	}
	public void setISBN13(String iSBN13) {
		ISBN13 = iSBN13;
	}
	public int getBookCount() {
		return bookCount;
	}
	public void setBookCount(int bookCount) {
		this.bookCount = bookCount;
	}
	
	public int getrCount() {
		return rCount;
	}
	public void setrCount(int rCount) {
		this.rCount = rCount;
	}
	public int getRankNum() {
		return rankNum;
	}
	public void setRankNum(int rankNum) {
		this.rankNum = rankNum;
	}
	@Override
	public String toString() {
		return "Book [bookNo=" + bookNo + ", bookName=" + bookName + ", bookKind=" + bookKind + ", bookWriter="
				+ bookWriter + ", bookPublisher=" + bookPublisher + ", bookIntroduce=" + bookIntroduce + ", imageurl="
				+ imageurl + ", ISBN13=" + ISBN13 + ", bookCount=" + bookCount + "]";
	}
	
	
}
