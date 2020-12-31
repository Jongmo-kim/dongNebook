package com.dongnebook.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.notice.model.vo.Notice;

/**
 * @author 진수경
 *
 */

@Repository
public class NoticeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Notice> noticeList(){
		List<Notice> list = sqlSession.selectList("notice.noticeList");
		return (ArrayList<Notice>)list;
	}
}
