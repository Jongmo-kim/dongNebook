package com.dongnebook.rental.model.vo;

import java.sql.Date;

/**
 * @author 진수경
 *
 */
//대출 정보를 갖고 있는 VO
//book_rental, book, rental_location 테이블을 조인한 컬럼

public class Rental {
	private int bookRentalNo;
	private int userNo;
	private int bookNo;
	private String bookName;	//book
	private String bookWriter;	//book
	private String placeName;	//rental_location
	private String addr;		//rental_location
	private Date enrollDate;
	private Date returnDate;
	private String imageurl;
	private String isReturn;
	public Rental() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Rental(int bookRentalNo, int userNo, int bookNo, String bookName, String bookWriter, String placeName,
			String addr, Date enrollDate, Date returnDate, String imageurl, String isReturn) {
		super();
		this.bookRentalNo = bookRentalNo;
		this.userNo = userNo;
		this.bookNo = bookNo;
		this.bookName = bookName;
		this.bookWriter = bookWriter;
		this.placeName = placeName;
		this.addr = addr;
		this.enrollDate = enrollDate;
		this.returnDate = returnDate;
		this.imageurl = imageurl;
		this.isReturn = isReturn;
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
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookWriter() {
		return bookWriter;
	}
	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
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
	public String getImageurl() {
		return imageurl;
	}
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
	public String getIsReturn() {
		return isReturn;
	}
	public void setIsReturn(String isReturn) {
		this.isReturn = isReturn;
	}
	
	@Override
	public String toString() {
		return "Rental [ bookRentalNo = "+bookRentalNo+", userNo = "+userNo+", bookNo = "+bookNo+", bookName = "+bookName+", bookWriter ="+bookWriter+", placeName = "+placeName+", addr = "+addr+
				"enrollDate = "+enrollDate+", returnDate = "+returnDate+", imageurl = "+imageurl+", isReturn = "+isReturn+"]";
	}
}
