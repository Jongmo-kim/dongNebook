package com.dongnebook.calendar.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongnebook.calendar.model.dao.CalendarDao;

@Service
public class CalendarService {
	@Autowired
	private CalendarDao dao;
}
