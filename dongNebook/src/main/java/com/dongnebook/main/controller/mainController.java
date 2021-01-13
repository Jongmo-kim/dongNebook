package com.dongnebook.main.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dongnebook.book.model.vo.Book;
import com.dongnebook.main.model.service.mainService;
import com.dongnebook.rank.model.service.RankService;

@Controller
@RequestMapping("/main")
	public class mainController {
	@Autowired
	private mainService service;
	private RankService rService;
	
	@RequestMapping("/main.do")
	public String main(Model model) {
		ArrayList<Book> list = rService.mainRank();
		model.addAttribute("rankList", list);
		return "main/main";
	}
	
}
