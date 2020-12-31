package com.dongnebook.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dongnebook.book.model.service.BookService;
import com.dongnebook.book.model.vo.Book;

/**
 * @author 김종모
 *
 */
@Controller
@RequestMapping("/book")
public class BookController {
	@Autowired
	private BookService service;
	
	@RequestMapping("/insert")
	public String insert(Book b, Model model) {
		int result = service.insertBook(b);
		
		return "common/msg";
	}
}
