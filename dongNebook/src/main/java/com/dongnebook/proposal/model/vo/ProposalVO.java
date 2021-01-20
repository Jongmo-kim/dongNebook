package com.dongnebook.proposal.model.vo;

public class ProposalVO {
	private int bookNo;
	private int userNo;
	private String userName;
	private String bookName;
	private String bookKind;
	private String bookWriter;
	private String bookPublisher;
	private String bookIntroduce;
	private String imageurl;
	private String ISBN;
	private String reason;
	private String isproposal;
	public ProposalVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProposalVO(int bookNo, int userNo, String userName, String bookName, String bookKind, String bookWriter,
			String bookPublisher, String bookIntroduce, String imageurl, String ISBN, String reason,String isproposal) {
		super();
		this.bookNo = bookNo;
		this.userNo = userNo;
		this.userName = userName;
		this.bookName = bookName;
		this.bookKind = bookKind;
		this.bookWriter = bookWriter;
		this.bookPublisher = bookPublisher;
		this.bookIntroduce = bookIntroduce;
		this.imageurl = imageurl;
		this.ISBN =ISBN;
		this.reason = reason;
		this.isproposal = isproposal;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookKind() {
		return bookKind;
	}
	public void setBookKind(String bookKind) {
		this.bookKind = bookKind;
	}
	public String getBookWriter() {
		return bookWriter;
	}
	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
	}
	public String getBookPublisher() {
		return bookPublisher;
	}
	public void setBookPublisher(String bookPublisher) {
		this.bookPublisher = bookPublisher;
	}
	public String getBookIntroduce() {
		return bookIntroduce;
	}
	public void setBookIntroduce(String bookIntroduce) {
		this.bookIntroduce = bookIntroduce;
	}
	public String getImageurl() {
		return imageurl;
	}
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getIsproposal() {
		return isproposal;
	}
	public void setIsproposal(String isproposal) {
		this.isproposal = isproposal;
	}
	
}
