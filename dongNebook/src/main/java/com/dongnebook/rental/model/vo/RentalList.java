package com.dongnebook.rental.model.vo;

import java.util.ArrayList;

import com.dongnebook.book.model.vo.Book;


public class RentalList {
	private ArrayList<Book> list;

	public RentalList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RentalList(ArrayList<Book> list) {
		super();
		this.list = list;
	}

	public ArrayList<Book> getList() {
		return list;
	}

	public void setList(ArrayList<Book> list) {
		this.list = list;
	}
	
}
