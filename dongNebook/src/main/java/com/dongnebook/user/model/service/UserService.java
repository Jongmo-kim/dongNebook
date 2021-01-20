package com.dongnebook.user.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongnebook.user.model.dao.UserDao;
import com.dongnebook.user.model.vo.User;

/**
 * @author 김종모
 *
 */
@Service
public class UserService {
	@Autowired
	private UserDao dao;

	public int insertUser(User u) {
		return dao.insertUser(u);
	}

	public User selectOneUser(User u) {
		return dao.selectOneUser(u);
	}

	public int updateUser(User u) {
		return dao.updateUser(u);
	}

	public User loginUser(User u) {
		return dao.loginUser(u);
	}

	public int deleteUser(User u) {
		return dao.deleteUser(u);
	}

	public ArrayList<User> selectUserBySearch(int reqPage, String inputStr, String searchKeyword) {
		return dao.selectUserBySearch(reqPage,inputStr,searchKeyword);
	}

	public int totalCount(String inputStr, String searchKeyword) {
		return dao.selectCountBySearch(inputStr,searchKeyword);
	}
}
