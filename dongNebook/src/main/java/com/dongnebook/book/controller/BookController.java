package com.dongnebook.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dongnebook.book.model.service.BookService;
import com.dongnebook.book.model.vo.Book;
import com.dongnebook.book.model.vo.BookPageData;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * @author 김종모
 *
 */
@Controller
@RequestMapping("/book")
public class BookController {
	@Autowired
	private BookService service;
	
	@RequestMapping("/insertAsJson")
	public String insert(Book b, Model model,String item) {
		JsonParser parser = new JsonParser();
		JsonElement o = parser.parse(item);
		b.setBookIntroduce(o.getAsJsonObject().get("description").getAsString());
		b.setBookKind(o.getAsJsonObject().get("categoryName").getAsString());
		b.setBookName(o.getAsJsonObject().get("title").getAsString());
		b.setBookPublisher(o.getAsJsonObject().get("publisher").getAsString());
		b.setBookWriter(o.getAsJsonObject().get("author").getAsString());
		b.setImageurl(o.getAsJsonObject().get("cover").getAsString());
		System.out.println(b);
		int result = service.insertBook(b);
		if(result > 0) {
			return b.getBookName()+" 입력 성공";
		}else {
			return b.getBookName()+" 입력 실패";
		}
		
	}
	
	@RequestMapping("/bookList")
	public String bookList(Model model,int reqPage) {
		BookPageData bpd = service.searchBookList(reqPage);
		
		model.addAttribute("list",bpd.getList());
		model.addAttribute("pageNavi",bpd.getPageNavi());
		
		return "book/bookList";
	}
	@RequestMapping("/bookDelete")
	public String bookDelete(Model model,Book b) {
		System.out.println(b.getBookNo());
		int result = service.bookDelete(b.getBookNo());
		
		if(result > 0) {
			model.addAttribute("msg","삭제 성공");
			model.addAttribute("result", "true");
		}else {
			model.addAttribute("msg","삭제 실패");
		}
		model.addAttribute("loc","/book/bookList.do?reqPage=1");
		
		return "common/msg";
	}
}
