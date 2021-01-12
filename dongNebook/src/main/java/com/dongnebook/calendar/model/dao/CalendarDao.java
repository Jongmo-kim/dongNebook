package com.dongnebook.calendar.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.calendar.model.vo.Calendar;

@Repository
public class CalendarDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Calendar> selectCalendarList() {
		List<Calendar> list = sqlSession.selectList("calendar.selectCalendarList");
		return (ArrayList<Calendar>)list;
	}

	public int insertCalendar(Calendar c) {
		return sqlSession.insert("calendar.insertCalendar", c);
	}

	public int maxCalendarNo() {
		return sqlSession.selectOne("calendar.maxCalendarNo");
	}

	public Calendar selectOneCalendar(int calNo) {
		return sqlSession.selectOne("calendar.selectOneCalendar", calNo);
	}
}
