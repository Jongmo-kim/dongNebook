package com.dongnebook.rental.model.vo;

public class BookAlert {
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
