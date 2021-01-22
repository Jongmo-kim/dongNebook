package com.dongnebook.alert.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.alert.model.vo.Alert;
import com.dongnebook.user.model.vo.User;
/**
 * @author 진수경
 *
 */
@Repository
public class AlertDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public ArrayList<Alert> selectUserAlert(int userNo) {
		List<Alert> list = sqlSession.selectList("alert.selectUserAlert", userNo);
		return (ArrayList<Alert>) list;
	}


	public int insertAlert() {
		return sqlSession.insert("alert.insertAlert");
	}


	public int deleteAlert() {
		return sqlSession.delete("alert.deleteAlert");
	}


	public int countChk(int bookRentalNo) {
		return sqlSession.update("alert.countChk", bookRentalNo);
	}
}
