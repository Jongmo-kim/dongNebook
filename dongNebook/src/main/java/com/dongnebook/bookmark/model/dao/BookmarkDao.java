package com.dongnebook.bookmark.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.bookmark.model.vo.Bookmark;

@Repository
public class BookmarkDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public int insertBookmark(String isbn, int userNo) {
		Bookmark bookMark = new Bookmark();
		bookMark.setUserNo(userNo);
		bookMark.setISBN13(isbn);
		return session.insert("book.insertBookMark", bookMark);
	}

	public int deleteBookmark(String isbn, int userNo) {
		Bookmark bookMark = new Bookmark();
		bookMark.setUserNo(userNo);
		bookMark.setISBN13(isbn);
		return session.delete("book.deleteBookMark", bookMark);
	}
	
}
