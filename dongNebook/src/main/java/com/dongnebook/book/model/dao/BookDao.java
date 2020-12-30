package com.dongnebook.book.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author 김종모
 *
 */
public class BookDao {
	@Autowired
	private SqlSessionTemplate session;
}
