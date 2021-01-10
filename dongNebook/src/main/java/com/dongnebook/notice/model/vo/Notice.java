package com.dongnebook.notice.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.dongnebook.common.FileVO;


/**
 * @author 진수경
 *
 */

public class Notice {
	private int rNum;
    private int noticeNo;
	private String noticeWriter;
	private String noticeTitle;
	private String noticeContent;
	private Date enrollDate;
	private ArrayList<FileVO> fileList;
	
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Notice(int rNum, int noticeNo, String noticeWriter, String noticeTitle, String noticeContent,
			Date enrollDate, ArrayList<FileVO> fileList) {
		super();
		this.rNum = rNum;
		this.noticeNo = noticeNo;
		this.noticeWriter = noticeWriter;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.enrollDate = enrollDate;
		this.fileList = fileList;
	}
	
	public Notice(String noticeWriter, String noticeTitle, String noticeContent) {
		super();
		this.noticeWriter = noticeWriter;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
	}
	
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeWriter() {
		return noticeWriter;
	}
	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public String getNoticeContentBr() {
		return noticeContent.replaceAll("\r\n","<br>");
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public ArrayList<FileVO> getFileList() {
		return fileList;
	}
	public void setFileList(ArrayList<FileVO> fileList) {
		this.fileList = fileList;
	}
	
	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeWriter=" + noticeWriter + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", enrollDate=" + enrollDate + "]";
	}
}
