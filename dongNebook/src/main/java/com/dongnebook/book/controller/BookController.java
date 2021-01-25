package com.dongnebook.book.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
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
		System.out.println("2222222222");
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
		System.out.println("책번호"+b.getBookCount());
		
		int result = service.updateBook(b);
		
		if(result>0) {
			model.addAttribute("msg", "수정 성공");
			model.addAttribute("result", "true");
		}else {
			model.addAttribute("msg","수정 실패");
		}
		model.addAttribute("loc", "/book/bookList.do?reqPage=1");
		
		return "common/msg";
	}
	@RequestMapping("/selectOneBook.do")
	public String selectOneBook( Model model, int bookNo, HttpServletRequest request) {
		System.out.println("입장");
		System.out.println(bookNo);
		String referer = request.getHeader("Referer");
		Book book = service.selectOneBook(bookNo);
		ArrayList<BookRental> isRental = service.selectIsRental(bookNo);
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		if(book.getBookCount()>0) {	
			model.addAttribute("returnDate", null);
		}else if(book.getBookCount()==0 && book.getrCount()==0){
			model.addAttribute("returnDate", null);
		}else if(book.getBookCount()==0 && isRental!=null) {
			if(isRental.get(0).getIsreturn().equals("N")) {						//재고가 없고 rental테이블에 반납이 안된 책이 있는 경우
				String returnDate = transFormat.format(isRental.get(0).getReturnDate());
				model.addAttribute("returnDate", returnDate);				
			}else {
				String returnDate = transFormat.format(isRental.get(0).getReturnDate());
				model.addAttribute("returnDate", returnDate);				
			}
		}else if(book.getBookCount()==0 && isRental==null) {					//재고가 없고 rental테이블에 반납해야할 책이 없는경우
			System.out.println("bookCount나rental테이블 누락");						// 대출불가 처리
			model.addAttribute("returnDate", null);
		}else if(book.getBookCount()<0){										//재고가 마이너스인 경우
			model.addAttribute("msg", "관리자에게 문의하세요.");
			System.out.println("book테이블에 bookCount 마이너스값 오류 해당 bookNo : "+bookNo);
			return "redirect:"+referer;
		}else {
			model.addAttribute("returnDate", null);
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
	public String deleteBooks(Model model,int userNo, String[] books) {
		//int result = service.deleteBooks(books);
		System.out.println("유저넘버"+userNo);
		int result = service.deleteBooks(books);
		System.out.println("테스트1"+result);
		ArrayList<Integer> no = service.selectBookNo(books);
		System.out.println("no"+no.get(0));
		result=service.updateIsRental(userNo,no);
		System.out.println("테스트2"+result);
		if(result>0) {
			model.addAttribute("msg", "수정 성공");
			model.addAttribute("result", "true");
		}else {
			model.addAttribute("msg","수정 실패");
		}
		model.addAttribute("loc", "/admin/manageUser.do?reqPage=1");
		
		return "common/msg";
	}
}
