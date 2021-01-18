package com.dongnebook.tag.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongnebook.book.model.service.BookService;
import com.dongnebook.book.model.vo.Book;
import com.dongnebook.review.model.vo.Review;
import com.dongnebook.tag.model.dao.TagDao;
import com.dongnebook.tag.model.vo.Tag;
import com.dongnebook.tag.model.vo.TagException;

@Service
public class TagService {
	@Autowired
	private BookService bookService;
	
	@Autowired
	private TagDao dao;

	public int insertTagByStr(Review review ,String[] tags) throws TagException{
		int result = 0;
		for(int i = 0 ; i < tags.length; ++i) {
			Tag t = new Tag();
			t.setReview(review);
			
			Book b = new Book();
			b.setBookName(tags[i]);
			ArrayList<Book> bookList = bookService.selectBook(b);
			
			if(bookList.size() == 0) 
				throw new TagException("북이 검색되지 않았습니다.");
			Book searchBook = bookList.get(0);
			t.setBook(searchBook);
			
			result = dao.insertTag(t);
			if(result == 0)
				throw new TagException("tag가 인서트되지 않았습니다.");
		}
		return result;
	}

	public ArrayList<Tag> selectTags(Review review) {
		return dao.selectTags(review);
	}

	public int deleteTagByReview(Review review) throws TagException {
		int result = dao.deleteTagByReview(review);
		return result;
	}

	
}
