package com.dongnebook.rental.model.vo;

/**
 * @author 진수경
 *
 */
public class BookAlert {
	//true : 안읽음 , false : 읽음
	private boolean read;
	private String bookName;
	public BookAlert() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookAlert(boolean read, String bookName) {
		super();
		this.read = read;
		this.bookName = bookName;
	}
	public boolean isRead() {
		return read;
	}
	public void setRead(boolean read) {
		this.read = read;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	
}
