package com.dongnebook.book.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

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

	public ArrayList<Book> selectBookByKeyword(String inputStr, String searchKeyword) {
		return dao.selectBookByKeyword(inputStr, searchKeyword);
	}

	public ArrayList<Book> selectBookByKeyword(String inputStr, String searchKeyword, int reqPage) {
		return dao.selectBookByKeyword(inputStr, searchKeyword,reqPage);
	}
}
