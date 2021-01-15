package com.dongnebook.alert.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.alert.model.vo.Alert;
import com.dongnebook.user.model.vo.User;

@Repository
public class AlertDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public ArrayList<Alert> returnAlert(int userNo) {
		List<Alert> list = sqlSession.selectList("alert.returnAlert", userNo);
		return (ArrayList<Alert>) list;
	}


	public int insertAlert(Alert a) {
		return sqlSession.insert("alert.insertAlert", a);
	}
}
