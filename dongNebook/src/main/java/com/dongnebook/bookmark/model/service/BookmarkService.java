package com.dongnebook.bookmark.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongnebook.book.model.vo.Book;
import com.dongnebook.bookmark.model.dao.BookmarkDao;
import com.dongnebook.bookmark.model.vo.Bookmark;
import com.dongnebook.user.model.vo.User;

@Service
public class BookmarkService {

	@Autowired
	private BookmarkDao dao;
	
	public int insertBookmark(String isbn, int userNo) {
		System.out.println("serviceisbn"+isbn);
		return dao.insertBookmark(isbn,userNo);
	}

	public int deleteBookmark(String isbn, int userNo) {
		return dao.deleteBookmark(isbn,userNo);
	}

	public ArrayList<Bookmark> searchBookMark(int userNo) {
		return dao.searchBookMark(userNo);
	}

	public Book searchBookMarkList(String isbn) {
		return dao.searchBookmarkList(isbn);
	}

	public int rentalCount(int userNo) {
		return dao.rentalCount(userNo);
	}

	
}
