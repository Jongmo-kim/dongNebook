package com.dongnebook.calendar.model.vo;
/**
 * @author 진수경
 *
 */
public class Calendar {
	private int calendarNo;
	private String calendarTitle;
	private String calendarStartDate;
	private String calendarEndDate;
	private String backgroundColor;
	private String textColor;
	private String borderColor;
	
	public Calendar() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Calendar(int calendarNo, String calendarTitle, String calendarStartDate, String calendarEndDate,
			String backgroundColor, String textColor, String borderColor) {
		super();
		this.calendarNo = calendarNo;
		this.calendarTitle = calendarTitle;
		this.calendarStartDate = calendarStartDate;
		this.calendarEndDate = calendarEndDate;
		this.backgroundColor = backgroundColor;
		this.textColor = textColor;
		this.borderColor = borderColor;
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

	public String getBackgroundColor() {
		return backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}

	public String getTextColor() {
		return textColor;
	}

	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}

	public String getBorderColor() {
		return borderColor;
	}

	public void setBorderColor(String borderColor) {
		this.borderColor = borderColor;
	}

	@Override
	public String toString() {
		return "Calendar [calendarNo = "+calendarNo+", calendarTitle = "+calendarTitle
				+", calendarStartDate = "+calendarStartDate+", calendarEndDate = "+calendarEndDate
				+", backgroundColor = "+backgroundColor+", textColor = "+textColor+", borderColor ="+borderColor+"]";
	}
}
