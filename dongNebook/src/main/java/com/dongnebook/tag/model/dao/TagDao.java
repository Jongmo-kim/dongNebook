package com.dongnebook.tag.model.dao;


import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.book.model.service.BookService;
import com.dongnebook.book.model.vo.Book;
import com.dongnebook.review.model.vo.Review;
import com.dongnebook.tag.model.vo.Tag;

@Repository
public class TagDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private BookService bookService;

	public int insertTag(Tag t) {
		int result = session.insert("tag.insertTag",t);
		if(result == 0) {
			return 0;
		}
		return t.getTagNo();
	}


	public ArrayList<Tag> selectTags(Review review) {
		List<Tag> list = session.selectList("tag.selectTags", review);
		for(Tag t : list) {
			List<Book> bookList = bookService.selectBook(t.getBook());
			if(bookList.size() == 0) {
				t.setBook(bookService.selectOneBook(1));
			} else {
			Book b = bookList.get(0);
			t.setBook(b);
			}
		}
		return (ArrayList<Tag>)list;
	}


	public int deleteTagByReview(Review review) {
		return session.delete("tag.deleteTagByReview", review);
	}
	
}
