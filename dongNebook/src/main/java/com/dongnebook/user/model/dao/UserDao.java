package com.dongnebook.user.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.book.model.vo.Book;
import com.dongnebook.rental.model.vo.BookRental;
import com.dongnebook.user.model.vo.User;

/**
 * @author 김종모
 *
 */
@Repository
public class UserDao {
	@Autowired
	private SqlSessionTemplate session;

	public int insertUser(User u) {
		u.getCategory().setCategoryNo(1);
		return session.insert("user.insertUser",u);
	}
	public User selectOneUser(User u) {
		return session.selectOne("user.selectOneUser", u);
	}
	public int updateUser(User u) {
		return session.update("user.updateUser", u);
	}
	public User loginUser(User u) {
		return session.selectOne("user.selectOneUser", u);
	}
	public int deleteUser(User u) {
		return session.delete("user.deleteUser", u);
	}
	public ArrayList<BookRental> returnAlert(User u) {
		List<BookRental> list = session.selectList("user.returnAlert", u);
		return (ArrayList<BookRental>)list;
	}
	public ArrayList<Book> selectBookList(HashMap<String, Object> map) {
		List<Book> list = session.selectList("user.selectBookList", map);
		return (ArrayList<Book>) list;
	}
}
