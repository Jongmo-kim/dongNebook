package com.dongnebook.rental.model.vo;
/**
 * @author 진수경
 *
 */
//대출 정보를 갖고 있는 VO
//book_rental, book, rental_location 테이블을 조인한 컬럼
import java.util.Date;

public class Rental {
	private int bookRentalNo;
	private int userNo;
	private String bookName;	//book
	private String placeName;	//rental_location
	private String addr;		//rental_location
	private Date enrollDate;
	private Date returnDate;
	private String isReturn;
	public Rental() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Rental(int bookRentalNo, int userNo, String bookName, String placeName, String addr, Date enrollDate,
			Date returnDate, String isReturn) {
		super();
		this.bookRentalNo = bookRentalNo;
		this.userNo = userNo;
		this.bookName = bookName;
		this.placeName = placeName;
		this.addr = addr;
		this.enrollDate = enrollDate;
		this.returnDate = returnDate;
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
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
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
	public String getIsReturn() {
		return isReturn;
	}
	public void setIsReturn(String isReturn) {
		this.isReturn = isReturn;
	}
	
	
}
