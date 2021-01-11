package com.dongnebook.calendar.controller;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dongnebook.calendar.model.service.CalendarService;
import com.dongnebook.calendar.model.vo.Calendar;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	@Autowired
	private CalendarService service;
	
	@RequestMapping("/calendarView.do")
	public String calendarView(Model model) {
		ArrayList<Calendar> list = service.selectCalendarList();
		model.addAttribute("list", list);
		return "calendar/calendarView";
	}
	
	
	@RequestMapping(value = "/insertCalendar.do", produces = "application/json;charset=utf-8")
	public String insertCalendar(String title, Date start, Date end, Model model) {
		System.out.println(title);
		System.out.println(start);
		System.out.println(end);
		//여기까지 잘 넘어옴
		Calendar c = new Calendar();
		c.setCalendarTitle(title);
		c.setCalendarStartDate(start);
		c.setCalendarEndDate(end);
		int result = service.insertCalendar(c);
		JsonObject obj = new JsonObject();
		if(result>0) {
			obj.addProperty("title", title);
			obj.addProperty("start", String.valueOf(start));
			obj.addProperty("end", String.valueOf(end));
			return new Gson().toJson(obj);
		} else {
			return "";
		}
		
	}
}
