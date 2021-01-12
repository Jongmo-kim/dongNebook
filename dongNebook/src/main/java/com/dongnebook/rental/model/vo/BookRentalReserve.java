package com.dongnebook.rental.model.vo;

public class BookRentalReserve {
	private int bookRentalReserveNo;
	private int bookNo;
	private int userNo;
	public int getBookRentalReserveNo() {
		return bookRentalReserveNo;
	}
	public void setBookRentalReserveNo(int bookRentalReserveNo) {
		this.bookRentalReserveNo = bookRentalReserveNo;
	}
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public BookRentalReserve(int bookRentalReserveNo, int bookNo, int userNo) {
		super();
		this.bookRentalReserveNo = bookRentalReserveNo;
		this.bookNo = bookNo;
		this.userNo = userNo;
	}
	public BookRentalReserve() {
		super();
		// TODO Auto-generated constructor stub
	}
}
