package com.dongnebook.chat.model.vo;

public class ChatMessage {
	private int cmNo;
	private String cmSender;
	private String cmReceiver;
	private String message;
	private String checkMessage;
	private String cmDate;
	public ChatMessage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChatMessage(int cmNo, String cmSender, String cmReceiver, String message, String checkMessage,
			String cmDate) {
		super();
		this.cmNo = cmNo;
		this.cmSender = cmSender;
		this.cmReceiver = cmReceiver;
		this.message = message;
		this.checkMessage = checkMessage;
		this.cmDate = cmDate;
	}
	public int getCmNo() {
		return cmNo;
	}
	public void setCmNo(int cmNo) {
		this.cmNo = cmNo;
	}
	public String getCmSender() {
		return cmSender;
	}
	public void setCmSender(String cmSender) {
		this.cmSender = cmSender;
	}
	public String getCmReceiver() {
		return cmReceiver;
	}
	public void setCmReceiver(String cmReceiver) {
		this.cmReceiver = cmReceiver;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getCheckMessage() {
		return checkMessage;
	}
	public void setCheckMessage(String checkMessage) {
		this.checkMessage = checkMessage;
	}
	public String getCmDate() {
		return cmDate;
	}
	public void setCmDate(String cmDate) {
		this.cmDate = cmDate;
	}
	
	
}
