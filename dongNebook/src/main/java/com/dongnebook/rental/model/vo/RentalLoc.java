package com.dongnebook.rental.model.vo;

public class RentalLoc {
	private int rentalLocationNo;
	private String placeName;
	private String addr;
	private String phone;
	public RentalLoc() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RentalLoc(int rentalLocationNo, String placeName, String addr, String phone) {
		super();
		this.rentalLocationNo = rentalLocationNo;
		this.placeName = placeName;
		this.addr = addr;
		this.phone = phone;
	}
	public int getRentalLocationNo() {
		return rentalLocationNo;
	}
	public void setRentalLocationNo(int rentalLocationNo) {
		this.rentalLocationNo = rentalLocationNo;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
		
}
