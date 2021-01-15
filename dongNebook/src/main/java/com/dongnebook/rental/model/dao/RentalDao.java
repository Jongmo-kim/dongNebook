package com.dongnebook.rental.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.book.model.vo.Book;
import com.dongnebook.rental.model.vo.BookRental;
import com.dongnebook.rental.model.vo.BookRentalReserve;
import com.dongnebook.rental.model.vo.RentalLoc;

@Repository
public class RentalDao {

	@Autowired SqlSessionTemplate session;

	public int insertLoc(RentalLoc loc) {
		
		return session.insert("location.insertLoc",loc);
	}

	public RentalLoc lastLoc() {
		List<RentalLoc> list = session.selectList("location.selectLast");
		RentalLoc loc=null;
		if(list.size()>0) {
			loc=list.get(0);
		}
		
		return loc;
	}

	public int insertReserve(BookRentalReserve reserve) {
		return session.insert("book.insertReserve", reserve);
	}

	public ArrayList<Book> selectBooks(int[] bookNo) {
		List<Book> list = session.selectList("book.selectBooks", bookNo);
		return (ArrayList<Book>)list;
	}

	public ArrayList<BookRental> rentalInfo(int userNo) {
		List<BookRental> list = session.selectList("book.rentalInfo",userNo);
		return (ArrayList<BookRental>)list;
	}

	public Book rBookList(int bookNo) {
		return session.selectOne("book.rBookList",bookNo);
	}
	
}
