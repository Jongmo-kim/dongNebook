package com.dongnebook.book.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongnebook.book.model.dao.BookDao;

/**
 * @author 김종모
 *
 */
@Service
public class BookService {
	
	@Autowired
	private BookDao dao;
}
