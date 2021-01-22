package com.dongnebook.rental.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongnebook.book.model.vo.Book;
import com.dongnebook.rental.model.dao.RentalDao;
import com.dongnebook.rental.model.vo.BookRental;
import com.dongnebook.rental.model.vo.BookRentalReserve;
import com.dongnebook.rental.model.vo.Rental;
import com.dongnebook.rental.model.vo.RentalLoc;

@Service
public class RentalService {
	
	@Autowired
	private RentalDao dao;

	public int insertLoc(RentalLoc loc) {
		return dao.insertLoc(loc);
	}

	public RentalLoc lastLoc() {
		return dao.lastLoc();
	}

	public int insertReserve(BookRentalReserve reserve) {
		return dao.insertReserve(reserve);
	}

	public ArrayList<Book> selectBooks(int[] bookNo) {
		return dao.selectBooks(bookNo);
	}

	public Book rBookList(int bookNo) {
		return dao.rBookList(bookNo);
	}

	public ArrayList<BookRental> rentalInfo(int userNo) {
		return dao.rentalInfo(userNo);
	}

	public int insertBookRental(ArrayList<BookRental> bRList) {
		return dao.insertBookRental(bRList);
	}

	public int updateCount(int[] bookNo) {
		return dao.updateCount(bookNo);
	}
	
	
	/**
	 * @author 진수경
	 *
	 */
	public ArrayList<Rental> rentalList(int userNo) {
		//매개변수 reqPage와 userNo로 바꾸고, service내에서 list = dao.rentalList(userNo)하기
		//pagination처리도 여기서 진행
		return dao.rentalList(userNo);
	}
	
	
}
