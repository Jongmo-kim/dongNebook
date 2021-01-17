package com.dongnebook.rental.model.vo;

public class RentalDate {
	private String enrollDate;
	private String returnDate;
	public RentalDate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RentalDate(String enrollDate, String returnDate) {
		super();
		this.enrollDate = enrollDate;
		this.returnDate = returnDate;
	}
	public String getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}
	
	
}
