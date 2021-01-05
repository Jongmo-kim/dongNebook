package com.dongnebook.bookmark.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongnebook.bookmark.model.dao.BookmarkDao;

@Service
public class BookmarkService {

	@Autowired
	private BookmarkDao dao;
	
	public int insertBookmark(String isbn, int userNo) {
		return dao.insertBookmark(isbn,userNo);
	}

	public int deleteBookmark(String isbn, int userNo) {
		return dao.deleteBookmark(isbn,userNo);
	}

}
