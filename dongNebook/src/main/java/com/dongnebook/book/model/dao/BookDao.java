package com.dongnebook.book.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
		return session.insert("book.insertBook", b);
	}

	public int totalCount() {
		
		return session.selectOne("book.selectTotalCount",int.class);
	}

	public ArrayList<Book> selectBookList(int start, int end) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		List<Book> list = session.selectList("book.selectBookList",map);
		return (ArrayList<Book>)list;
	}

	public int bookDelete(int bookNo) {
		
		return session.delete("book.bookDelete",bookNo);
	}
}
