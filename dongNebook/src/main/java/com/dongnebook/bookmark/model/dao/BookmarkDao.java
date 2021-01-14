package com.dongnebook.bookmark.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.book.model.vo.Book;
import com.dongnebook.bookmark.model.vo.Bookmark;
import com.dongnebook.user.model.vo.User;

@Repository
public class BookmarkDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public int insertBookmark(String isbn, int userNo) {
		System.out.println("dao"+isbn);
		Bookmark bookMark = new Bookmark();
		bookMark.setUserNo(userNo);
		bookMark.setISBN(isbn);
		System.out.println("daoisbn"+bookMark.getISBN());
		return session.insert("book.insertBookMark", bookMark);
	}

	public int deleteBookmark(String isbn, int userNo) {
		Bookmark bookMark = new Bookmark();
		bookMark.setUserNo(userNo);
		bookMark.setISBN(isbn);
		return session.delete("book.deleteBookMark", bookMark);
	}

	public ArrayList<Bookmark> searchBookMark(int userNo) {
		List<Bookmark> list = session.selectList("book.searchBookMark", userNo);
		return (ArrayList<Bookmark>)list;
	}

	public Book searchBookmarkList(String isbn) {
		
		return session.selectOne("book.searchBookList", isbn);
	}

	public int rentalCount(int userNo) {
		return session.selectOne("book.rentalCount",userNo);
	}
	
}
