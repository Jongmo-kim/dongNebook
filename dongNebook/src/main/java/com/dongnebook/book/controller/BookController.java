package com.dongnebook.book.controller;

import java.util.ArrayList;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongnebook.book.model.service.BookService;
import com.dongnebook.book.model.vo.Book;
import com.dongnebook.book.model.vo.BookPageData;
import com.dongnebook.common.hangulTrie;
import com.dongnebook.common.hangulTrie.trieNode;
import com.dongnebook.rental.model.vo.BookRental;
import com.dongnebook.user.model.vo.User;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

/**
 * @author 김종모, 윤석호
 *
 */
@Controller
@RequestMapping("/book")
public class BookController {
	@Autowired
	private BookService service;
	
	private hangulTrie trie;
	
	BookController(){
		trie = new hangulTrie();
	}
	/*
	 * 자동완성을 위한 메소드
	 * sql을 조회하여 오는것보단 차라리 서버를 시작할때 저장된 모든 북을 가져온다.
	 */
	@PostConstruct
	public void booklistInit() {
		ArrayList<Book> bookList = service.selectAllBook();
		for(Book b  : bookList) {
			trie.insert(b.getBookName());
		}
	}
	
	@ResponseBody
	@RequestMapping("/insertAsJson")
	public String insert(Book b, Model model,String item) {
		System.out.println("화긴");
		JsonParser parser = new JsonParser();
		JsonElement o = parser.parse(item);
		b.setBookIntroduce(o.getAsJsonObject().get("description").getAsString());
		b.setBookKind(o.getAsJsonObject().get("categoryName").getAsString());
		b.setBookName(o.getAsJsonObject().get("title").getAsString());
		b.setBookPublisher(o.getAsJsonObject().get("publisher").getAsString());
		b.setBookWriter(o.getAsJsonObject().get("author").getAsString());
		b.setImageurl(o.getAsJsonObject().get("cover").getAsString());
		b.setISBN(o.getAsJsonObject().get("isbn").getAsString());
		b.setBookCount(1);
		
		Book book = service.selectOneBook(b.getISBN());
		System.out.println(b.getBookName());
		int result=0;
		if(book==null) {			
			result = service.insertBook(b);
		}else {
			result = service.updateCntBook(book);

		}
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
	@RequestMapping("/searchBookFrm.do")
	public String searchBookFrm(){
		return "book/searchBook";
	}
	@RequestMapping("/searchBook.do")
	public String searchBook(Model model,String inputStr, String searchKeyword,int reqPage,HttpSession session) {
		ArrayList<Book> list = service.selectBookByKeyword(inputStr,searchKeyword,reqPage);
		model.addAttribute("bookList", list);
		model.addAttribute("navi", service.selectSearchBookNavi(inputStr,searchKeyword,reqPage));
		//여기부턴 북마크용 데이터 입출력 입니다.
		
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser!=null) {
			System.out.println(1);
			ArrayList<String> bookMarkList=service.selectBookMarkList(loginUser.getUserNo());
			model.addAttribute("bookMarkList", bookMarkList);
		}
		
		return "book/searchBook";
	}
	@RequestMapping("/updateBook.do")
	public String updateBook(Model model,Book b) {
		System.out.println(b.getBookName());
		int result = service.updateBook(b);
		
		if(result>0) {
			model.addAttribute("msg", "수정 성공");
			model.addAttribute("result", "true");
		}else {
			model.addAttribute("msg","수정 실패");
		}
		model.addAttribute("loc", "/");
		
		return "common/msg";
	}
	@RequestMapping("/selectOneBook.do")
	public String selectOneBook( Model model, int bookNo) {
		Book book = service.selectOneBook(bookNo);
		BookRental isRental = service.selectIsRental(bookNo);
		if(isRental != null) {
			model.addAttribute("returnDate", isRental);			
		}
		model.addAttribute("b", book);
		return "book/selectOneBook";
	}
	@ResponseBody
	@RequestMapping("/autocomplete.do")
	public JsonArray autocomplete(String inputVal) {
		ArrayList<trieNode> nodes = trie.findAllLeafsInclude(inputVal);
		JsonArray arr = new JsonArray();
		for(trieNode n : nodes) {
			arr.add(n.getCurrString());
		}
		return arr;
	}
	
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
	@RequestMapping("/deleteBooks")
	public String deleteBooks(Model model, String[] books) {
		System.out.println("책명"+books[0]);
		return null;
	}
}
