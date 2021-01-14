package com.dongnebook.user.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongnebook.book.model.vo.Book;
import com.dongnebook.rental.model.vo.BookRental;
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

	public ArrayList<BookRental> returnAlert(User u) {
		return dao.returnAlert(u);
	}

	public ArrayList<Book> selectBookList(User u, int[] arr) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", u.getUserNo());
		map.put("list", arr);
		

		if(arr.length!=0) {
			return dao.selectBookList(map);
		} else {
			return null;
		}
	}
	
	
}
