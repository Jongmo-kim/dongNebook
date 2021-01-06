package com.dongnebook.rank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dongnebook.book.model.vo.Book;
import com.dongnebook.book.model.vo.BookPageData;
import com.dongnebook.rank.model.service.RankService;

@Controller
@RequestMapping("/rank")
public class RankController {
	
		@Autowired
		private RankService service;
		
		
		@RequestMapping("/rankList.do")
		public String RankList(Model model, int reqPage) {
			BookPageData bpd = service.searchRankList(reqPage);
			System.out.println("reqPage"+reqPage);
			model.addAttribute("list",bpd.getList());
			model.addAttribute("pageNavi",bpd.getPageNavi());
			
			return "/rank/rankList";
		
	}
}
