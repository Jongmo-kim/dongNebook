package com.dongnebook.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.admin.model.vo.Admin;

@Repository
public class AdminDao {
	@Autowired
	private SqlSessionTemplate sqlsession;

	public Admin adminLogin(Admin admin) {
		return sqlsession.selectOne("admin.adminLogin", admin);
	}
	
	//Start
}
