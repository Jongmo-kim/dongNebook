package com.dongnebook.proposal.model.vo;

public class ProposalVO {
	private int bookProposalNo;
	private int userNo;
	private String bookName;
	private String bookKind;
	private String bookWriter;
	private String bookPublisher;
	private String bookIntroduce;
	private String imageurl;
	private String ISBN13;
	private String ISBN10;
	private int reason;
	public ProposalVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProposalVO(int bookProposalNo, int userNo, String bookName, String bookKind, String bookWriter,
			String bookPublisher, String bookIntroduce, String imageurl, String iSBN13, String iSBN10, int reason) {
		super();
		this.bookProposalNo = bookProposalNo;
		this.userNo = userNo;
		this.bookName = bookName;
		this.bookKind = bookKind;
		this.bookWriter = bookWriter;
		this.bookPublisher = bookPublisher;
		this.bookIntroduce = bookIntroduce;
		this.imageurl = imageurl;
		ISBN13 = iSBN13;
		ISBN10 = iSBN10;
		this.reason = reason;
	}
	public int getBookProposalNo() {
		return bookProposalNo;
	}
	public void setBookProposalNo(int bookProposalNo) {
		this.bookProposalNo = bookProposalNo;
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
	public String getISBN13() {
		return ISBN13;
	}
	public void setISBN13(String iSBN13) {
		ISBN13 = iSBN13;
	}
	public String getISBN10() {
		return ISBN10;
	}
	public void setISBN10(String iSBN10) {
		ISBN10 = iSBN10;
	}
	public int getReason() {
		return reason;
	}
	public void setReason(int reason) {
		this.reason = reason;
	}

}
