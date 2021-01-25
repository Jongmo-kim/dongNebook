package com.dongnebook.book.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.book.model.vo.Book;
import com.dongnebook.proposal.model.vo.ProposalVO;
import com.dongnebook.rental.model.vo.BookRental;



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
		System.out.println(bookNo);
		return session.delete("book.deleteBook",bookNo);
	}
	public ArrayList<Book> selectBookByKeyword(String inputStr, String searchKeyword) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("inputStr", inputStr);
		map.put("searchKeyword", searchKeyword);
		List<Book> list = session.selectList("book.selectBookByKeyword", map);
		return (ArrayList<Book>)list;
	}

	public ArrayList<Book> selectBookByKeyword(String inputStr, String searchKeyword, int reqPage) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("inputStr", inputStr);
		map.put("searchKeyword", searchKeyword);
		map.put("reqPage", reqPage);
		List<Book> list = session.selectList("book.selectBookByKeyword", map);
		return (ArrayList<Book>)list;
	}

	public int updateBook(Book b) {
		return session.update("book.updateBook", b);
	}

	public ArrayList<String> selectBookMarkList(int userNo) {
		List<String> list = session.selectList("book.selectBookMark", userNo);
		return (ArrayList<String>)list;
	}
	
	public Book selectOneBook(int bookNo) {
		System.out.println("dao"+bookNo);
		return session.selectOne("book.selectOneBook", bookNo);
	}	
	public ArrayList<Book> newBook() {
		List<Book> list = session.selectList("book.newBook");
		return (ArrayList<Book>)list;
	}

	public Book selectOneBook(String isbn) {
		return session.selectOne("book.selectOneBookISBN",isbn);
	}

	public int updateCntBook(Book book) {
		return session.update("book.updateCntBook", book.getISBN());
	}

	public ArrayList<Book> selectAllBook() {
		List<Book> list =  session.selectList("book.selectAllBook");
		return (ArrayList<Book>)list;
	}
	public ArrayList<Book> selectBook(Book b) {
		List<Book> list =  session.selectList("book.selectBook",b);
		return (ArrayList<Book>)list;
	}

	public int totalCount(String inputStr, String searchKeyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("inputStr", inputStr);
		map.put("searchKeyword", searchKeyword);
		return session.selectOne("book.selectSearchCount",map);
	}

	public ArrayList<BookRental> selectIsRental(int bookNo) {
		List<BookRental> list = session.selectList("rental.selectIsRental", bookNo);
		return (ArrayList<BookRental>)list;
	}

	public int deleteBooks(String[] books) {
		return session.delete("book.deleteBooks",books);
	}

	


	public ArrayList<Integer> selectBookNo(String[] books) {
		List<Integer> list = session.selectList("book.selectBookNo",books);
		
		return (ArrayList<Integer>)list;
	}

	public int updateIsRental(int userNo, ArrayList<Integer> no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bookNo", no);
		map.put("userNo",userNo);
		
		return session.update("book.updateIsRental",map);
	}


}
