package com.dongnebook.calendar.model.vo;

public class Calendar {
	private int calendarNo;
	private String calendarTitle;
	private String calendarStartDate;
	private String calendarEndDate;
	public Calendar() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Calendar(int calendarNo, String calendarTitle, String calendarStartDate, String calendarEndDate) {
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
	public String getCalendarStartDate() {
		return calendarStartDate;
	}
	public void setCalendarStartDate(String calendarStartDate) {
		this.calendarStartDate = calendarStartDate;
	}
	public String getCalendarEndDate() {
		return calendarEndDate;
	}
	public void setCalendarEndDate(String calendarEndDate) {
		this.calendarEndDate = calendarEndDate;
	}
	@Override
	public String toString() {
		return "Calendar [calendarNo = "+calendarNo+", calendarTitle = "+calendarTitle
				+", calendarStartDate = "+calendarStartDate+", calendarEndDate = "+calendarEndDate+"]";
	}
}
