package com.dongnebook.alert.model.vo;

/**
 * @author 진수경
 *
 */
public class Alert {
	private int bookRentalNo;
	private int userNo;
	private String bookName;
	private int chk;
	
	public Alert() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public Alert(int bookRentalNo, int userNo, String bookName, int chk) {
		super();
		this.bookRentalNo = bookRentalNo;
		this.userNo = userNo;
		this.bookName = bookName;
		this.chk = chk;
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


	public int getChk() {
		return chk;
	}


	public void setChk(int chk) {
		this.chk = chk;
	}


	@Override
	public String toString() {
		return "Alert [ bookRentalNo = "+bookRentalNo+", user_no = "+userNo+", bookName = "+bookName+", chk = "+chk+"]";
	}
}
