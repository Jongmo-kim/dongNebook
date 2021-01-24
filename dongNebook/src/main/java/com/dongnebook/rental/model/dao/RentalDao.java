package com.dongnebook.rental.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.book.model.vo.Book;
import com.dongnebook.rental.model.vo.BookRental;
import com.dongnebook.rental.model.vo.BookRentalReserve;
import com.dongnebook.rental.model.vo.Rental;
import com.dongnebook.rental.model.vo.RentalLoc;
import com.dongnebook.user.model.vo.User;

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

	public int insertBookRental(ArrayList<BookRental> bRList) {
		return session.insert("rental.insertBookRental", bRList);
	}
	public int updateCount(int[] bookNo) {
		return session.update("book.updateCount", bookNo);
	}

	public ArrayList<BookRental> userRentalList(int userNo) {
		List<BookRental> list = session.selectList("rental.userRentalList", userNo);
		return (ArrayList<BookRental>)list;
	}
	
	public boolean isBookRentalLimitOver(User loginUser) {
		return (Integer)session.selectOne("rental.isBookRentalLimitOver",loginUser) >= 3;
	}

	
	
	/**
	 * @author 진수경
	 *
	 */
	public ArrayList<Rental> selectRentalList(int userNo, int start, int end) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("userNo", userNo);
		map.put("start", start);
		map.put("end", end);
		List<Rental> list = session.selectList("rental.selectRentalList", map);
		return (ArrayList<Rental>) list;
	}

	public int totalCount(int userNo) {
		return session.selectOne("rental.totalCount", userNo);
	}

	
}
