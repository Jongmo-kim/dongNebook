package com.dongnebook.common;
/**
 * @author 진수경
 *
 */
public class FileVO {
	private int fileNo;
	private int tableNo;
	private String tableName;
	private String filename;
	private String filepath;
	
	public FileVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FileVO(int fileNo, int tableNo, String tableName, String filename, String filepath) {
		super();
		this.fileNo = fileNo;
		this.tableNo = tableNo;
		this.tableName = tableName;
		this.filename = filename;
		this.filepath = filepath;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getTableNo() {
		return tableNo;
	}
	public void setTableNo(int tableNo) {
		this.tableNo = tableNo;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
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
