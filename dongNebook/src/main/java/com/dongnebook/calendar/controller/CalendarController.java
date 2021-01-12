package com.dongnebook.calendar.controller;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@ResponseBody
	@RequestMapping(value = "/insertCalendar.do", produces = "application/json;charset=utf-8")
	public String insertCalendar(String title, @DateTimeFormat(pattern="yyyy-MM-dd") Date start, @DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm:ss") Date end, Model model) {
		System.out.println(title); 
		System.out.println(start);
		System.out.println(end);
		//여기까지 잘 넘어옴
		
		Calendar c = new Calendar();
		c.setCalendarTitle(title);
		c.setCalendarStartDate(start);
		c.setCalendarEndDate(end);
		
		int result = service.insertCalendar(c);
		int calendarNo = service.maxCalendarNo();
		//추가한 캘린더 객체 가져오기
		Calendar cal = service.selectOneCalendar(calendarNo);
		
		JsonObject obj = new JsonObject();
		if(result>0) {
			obj.addProperty("no", cal.getCalendarNo());
			obj.addProperty("title", cal.getCalendarTitle());
			obj.addProperty("start", String.valueOf(cal.getCalendarStartDate()));
			obj.addProperty("end", String.valueOf(cal.getCalendarEndDate()));
			return new Gson().toJson(obj);
		} else {
			return null;
		}
	}
	
	@ResponseBody
	@RequestMapping("/deleteCalendar.do")
	public String deleteCalendar(int calendarNo) {
		int result = service.deleteCalendar(calendarNo);
		if(result>0) {
			return "1";
		} else {
			return "-1";
		}
	}
	
	@ResponseBody
	@RequestMapping("/updateCalendar.do")
	public String updateCalendar(int calendarNo, String title, Date start, Date end) {
		Calendar c = new Calendar();
		c.setCalendarNo(calendarNo);
		c.setCalendarTitle(title);
		c.setCalendarStartDate(start);
		c.setCalendarEndDate(end);
		
		int result = service.updateCalendar(c);
		if(result>0) {
			return "1";
		} else {
			return "-1";
		}
	}
}
