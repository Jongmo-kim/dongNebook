package com.dongnebook.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.admin.model.vo.Admin;
import com.dongnebook.book.model.vo.Book;
import com.dongnebook.user.model.vo.User;

@Repository
public class AdminDao {
	@Autowired
	private SqlSessionTemplate sqlsession;

	public Admin adminLogin(Admin admin) {
		return sqlsession.selectOne("admin.adminLogin", admin);
	}


	public ArrayList<User> selectUserList(int start, int end) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		List<User> list = sqlsession.selectList("admin.selectUserList",map);
		return (ArrayList<User>)list;	
	}


	public int totalCount() {
		return sqlsession.selectOne("admin.selectTotalCount",int.class);
	}


	public int deleteBooks(ArrayList<Integer> list) {
		return sqlsession.delete("admin.deleteBooks",list);
	}


	public int selectBook(String string) {
		System.out.println(string);
		return sqlsession.selectOne("admin.selectBook",string);
	}
	
	//Start
}
