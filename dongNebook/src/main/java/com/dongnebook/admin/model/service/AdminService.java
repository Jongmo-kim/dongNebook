package com.dongnebook.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongnebook.admin.model.dao.AdminDao;
import com.dongnebook.admin.model.vo.Admin;

@Service
public class AdminService {
	@Autowired
	private AdminDao dao;

	public Admin adminLogin(Admin admin) {
		return dao.adminLogin(admin);
	}
	
	//Start
}
