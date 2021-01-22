package com.dongnebook.main.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongnebook.book.model.service.BookService;
import com.dongnebook.book.model.vo.Book;
import com.dongnebook.main.model.service.mainService;
import com.dongnebook.rank.model.service.RankService;
import com.dongnebook.user.model.vo.User;

@Controller
@RequestMapping("/main")
	public class mainController {
	@Autowired
	private mainService service;
	@Autowired
	private RankService rService;
	@Autowired
	private BookService bService;
	
	
	@RequestMapping("/main.do")
	public String main(Model model) {
		ArrayList<Book> rankList = rService.mainRank();
		model.addAttribute("rankList", rankList);
		ArrayList<Book> newBook = bService.newBook();
		model.addAttribute("newBook", newBook);
		return "main/main";
	}
	@RequestMapping(value="/memberSessionCheck.do",method=RequestMethod.POST)
	@ResponseBody
	public String memberSessionCheck(HttpSession session) {
		System.out.println("진입");
		User u = (User)session.getAttribute("loginUser");
		
		return u.getUserId();
	}
}
