package com.dongnebook.book.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongnebook.book.model.dao.BookDao;
import com.dongnebook.book.model.vo.Book;

/**
 * @author 김종모
 *
 */
@Service
public class BookService {
	
	@Autowired
	private BookDao dao;

	public int insertBook(Book b) {
		return dao.insertBook(b);
	}
}
