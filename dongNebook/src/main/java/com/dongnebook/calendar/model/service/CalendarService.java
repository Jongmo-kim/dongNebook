package com.dongnebook.calendar.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongnebook.calendar.model.dao.CalendarDao;
import com.dongnebook.calendar.model.vo.Calendar;
/**
 * @author 진수경
 *
 */
@Service
public class CalendarService {
	@Autowired
	private CalendarDao dao;

	public ArrayList<Calendar> selectCalendarList() {
		return dao.selectCalendarList();
	}

	public int insertCalendar(Calendar c) {
		return dao.insertCalendar(c);
	}

	public int maxCalendarNo() {
		return dao.maxCalendarNo();
	}

	public Calendar selectOneCalendar(int calendarNo) {
		return dao.selectOneCalendar(calendarNo);
	}

	public int deleteCalendar(int calendarNo) {
		return dao.deleteCalendar(calendarNo);
	}

	public int updateCalendar(Calendar c) {
		return dao.updateCalendar(c);
	}
}
