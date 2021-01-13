package com.dongnebook.aladin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongnebook.aladin.service.AladinService;
import com.dongnebook.book.model.vo.Book;

@Controller
@RequestMapping("/aladin")
public class AladinController {
	@Autowired
	private AladinService service;
	
	@RequestMapping("/searchInAladin")
	public String searchInAladin() {
		return "book/searchInAladin";
	}
	@ResponseBody
	@RequestMapping(value = "/aladinPage", produces = "application/text; charset=utf8")
	public String aladinPage(int totalCount, int reqPage) {
		System.out.println("총페이지수"+totalCount);
		System.out.println("요청페이지"+reqPage);
		String pageNavi=service.aladinPage(totalCount,reqPage);
		return pageNavi.toString();
	}
	@RequestMapping("/insertBookInAladin")
	public String insertBookInAladin(Book b, Model model,String item) {
		
		return null;
	}
}
