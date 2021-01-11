package com.dongnebook.calendar.model.vo;

import java.sql.Date;

public class Calendar {
	private int calendarNo;
	private String calendarTitle;
	private Date calendarStartdate;
	private Date calendarEnddate;
	public Calendar() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Calendar(int calendarNo, String calendarTitle, Date calendarStartdate, Date calendarEnddate) {
		super();
		this.calendarNo = calendarNo;
		this.calendarTitle = calendarTitle;
		this.calendarStartdate = calendarStartdate;
		this.calendarEnddate = calendarEnddate;
	}
	public int getCalendarNo() {
		return calendarNo;
	}
	public void setCalendarNo(int calendarNo) {
		this.calendarNo = calendarNo;
	}
	public String getCalendarTitle() {
		return calendarTitle;
	}
	public void setCalendarTitle(String calendarTitle) {
		this.calendarTitle = calendarTitle;
	}
	public Date getCalendarStartdate() {
		return calendarStartdate;
	}
	public void setCalendarStartdate(Date calendarStartdate) {
		this.calendarStartdate = calendarStartdate;
	}
	public Date getCalendarEnddate() {
		return calendarEnddate;
	}
	public void setCalendarEnddate(Date calendarEnddate) {
		this.calendarEnddate = calendarEnddate;
	}
	
}
