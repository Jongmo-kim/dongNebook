package com.dongnebook.alert.model.vo;

/**
 * @author 진수경
 *
 */
public class Alert {
	private int bookRentalNo;
	private String bookName;
	private int read;
	public Alert() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Alert(int bookRentalNo, String bookName, int read) {
		super();
		this.bookRentalNo = bookRentalNo;
		this.bookName = bookName;
		this.read = read;
	}
	public int getBookRentalNo() {
		return bookRentalNo;
	}
	public void setBookRentalNo(int bookRentalNo) {
		this.bookRentalNo = bookRentalNo;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public int getRead() {
		return read;
	}
	public void setRead(int read) {
		this.read = read;
	}
	
	@Override
	public String toString() {
		return "Alert [ bookRentalNo = "+bookRentalNo+", bookName = "+bookName+", read = "+read+"]";
	}
}
