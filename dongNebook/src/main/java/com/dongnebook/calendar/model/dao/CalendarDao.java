package com.dongnebook.calendar.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.calendar.model.vo.Calendar;
/**
 * @author 진수경
 *
 */
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

	public Calendar selectOneCalendar(int calendarNo) {
		return sqlSession.selectOne("calendar.selectOneCalendar", calendarNo);
	}

	public int deleteCalendar(int calendarNo) {
		return sqlSession.delete("calendar.deleteCalendar", calendarNo);
	}

	public int updateCalendar(Calendar c) {
		return sqlSession.update("calendar.updateCalendar", c);
	}
}
