package com.dongnebook.rental.model.vo;

import java.util.Date;

public class BookRental {
	private int bookRentalNo;
	private int userNo;
	private int bookNo;
	private int RentalLocationNo;
	private Date enrollDate;
	private Date returnDate;
	private String isreturn;
	public BookRental() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookRental(int bookRentalNo, int userNo, int bookNo, int rentalLocationNo, Date enrollDate,
			Date returnDate, String isreturn) {
		super();
		this.bookRentalNo = bookRentalNo;
		this.userNo = userNo;
		this.bookNo = bookNo;
		RentalLocationNo = rentalLocationNo;
		this.enrollDate = enrollDate;
		this.returnDate = returnDate;
		this.isreturn = isreturn;
	}
	public String getIsreturn() {
		return isreturn;
	}
	public void setIsreturn(String isreturn) {
		this.isreturn = isreturn;
	}
	public int getBookRentalNo() {
		return bookRentalNo;
	}
	public void setBookRentalNo(int bookRentalNo) {
		this.bookRentalNo = bookRentalNo;
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
	public int getRentalLocationNo() {
		return RentalLocationNo;
	}
	public void setRentalLocationNo(int rentalLocationNo) {
		RentalLocationNo = rentalLocationNo;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public Date getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	
}
