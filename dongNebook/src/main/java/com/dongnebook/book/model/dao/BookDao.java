package com.dongnebook.book.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.book.model.vo.Book;

/**
 * @author 김종모
 *
 */

@Repository
public class BookDao {
	@Autowired
	private SqlSessionTemplate session;

	public int insertBook(Book b) {
		return 0;
	}
}
