package com.dongnebook.proposalAlert.model.vo;

public class ProposalAlert {
	private int alertNo;
	private int userNo;
	private String userName;
	private String bookName;
	private int chk;
	private String isproposal;
	public ProposalAlert() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProposalAlert(int alertNo, int userNo, String userName, String bookName, int chk,String isproposal) {
		super();
		this.alertNo = alertNo;
		this.userNo = userNo;
		this.userName = userName;
		this.bookName = bookName;
		this.chk = chk;
		this.isproposal = isproposal;
	}
	public int getAlertNo() {
		return alertNo;
	}
	public void setAlertNo(int alertNo) {
		this.alertNo = alertNo;
	}
	public String getIsproposal() {
		return isproposal;
	}
	public void setIsproposal(String isproposal) {
		this.isproposal = isproposal;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	
}
