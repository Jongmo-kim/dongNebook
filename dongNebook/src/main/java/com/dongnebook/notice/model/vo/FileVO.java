package com.dongnebook.notice.model.vo;

public class FileVO {
	private int fileNo;
	private int boardNo;
	private String filename;
	private String filepath;
	public FileVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FileVO(int fileNo, int boardNo, String filename, String filepath) {
		super();
		this.fileNo = fileNo;
		this.boardNo = boardNo;
		this.filename = filename;
		this.filepath = filepath;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
}
