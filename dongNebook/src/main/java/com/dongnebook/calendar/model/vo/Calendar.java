package com.dongnebook.calendar.model.vo;

import java.sql.Date;

public class Calendar {
	private int calendarNo;
	private String calendarTitle;
	private Date calendarStartDate;
	private Date calendarEndDate;
	public Calendar() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Calendar(int calendarNo, String calendarTitle, Date calendarStartDate, Date calendarEndDate) {
		super();
		this.calendarNo = calendarNo;
		this.calendarTitle = calendarTitle;
		this.calendarStartDate = calendarStartDate;
		this.calendarEndDate = calendarEndDate;
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
	public Date getCalendarStartDate() {
		return calendarStartDate;
	}
	public void setCalendarStartDate(Date calendarStartDate) {
		this.calendarStartDate = calendarStartDate;
	}
	public Date getCalendarEndDate() {
		return calendarEndDate;
	}
	public void setCalendarEndDate(Date calendarEndDate) {
		this.calendarEndDate = calendarEndDate;
	}
	@Override
	public String toString() {
		return "Calendar [calendarNo = "+calendarNo+", calendarTitle = "+calendarTitle
				+", calendarStartDate = "+calendarStartDate+", calendarEndDate = "+calendarEndDate+"]";
	}
}
