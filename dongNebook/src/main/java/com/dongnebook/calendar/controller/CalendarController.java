package com.dongnebook.calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dongnebook.calendar.model.service.CalendarService;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	@Autowired
	private CalendarService service;
	
	@RequestMapping("/calendarView.do")
	public String calendarView() {
		return "calendar/calendarView";
	}
	
	@RequestMapping("/insertCalendar.do")
	public String insertCalendar() {
		return "";
	}
}
