package com.dongnebook.proposal.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongnebook.book.model.service.BookService;
import com.dongnebook.book.model.vo.Book;
import com.dongnebook.proposal.model.service.ProposalService;
import com.dongnebook.proposal.model.vo.ProposalPageData;
import com.dongnebook.proposal.model.vo.ProposalVO;
import com.dongnebook.user.model.service.UserService;
import com.dongnebook.user.model.vo.User;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

@Controller
@RequestMapping("/proposal")
public class ProposalController {

	@Autowired
	private ProposalService service;
	@Autowired
	private UserService userService;
	@Autowired
	private BookService bookService;
	//new로하면 의존성 주입 안됨
	
	@RequestMapping("/bookProposal.do")
	public String bookProposal() {
		return "proposal/bookProposal";
	}
	
	@RequestMapping("/proposalList.do")
	public String proposalList(Model model, int reqPage, int selectType) {
		ProposalPageData ppd = service.selectList(reqPage, selectType);
		System.out.println("controller list : "+ppd.getList().size());
		System.out.println("ppdSize = "+ppd.getList().size());
		model.addAttribute("list", ppd.getList());
		model.addAttribute("pageNavi", ppd.getPageNavi());
		model.addAttribute("selectType", selectType);
		return "proposal/proposal";
	}

	//아작스를 쓰기위해서는 @ResponseBody 를 해줘야함
	@RequestMapping(value = "/proposalSuccess.do", method=RequestMethod.POST)
	@ResponseBody
	public String proposalInsert(@RequestBody String json){
		//승인일때 북테이블에 신청테이블에 있던 책 정보 입력하고 
		//proposal테이블에 isproposal에 y입력
		System.out.println(json);
		System.out.println("json의 길이 = " +json.length());
		JsonParser list = new JsonParser();
		System.out.println(list.parse(json));
		System.out.println(list.parse(json));
		JsonArray arr = (JsonArray)list.parse(json);
		System.out.println(arr.size());
		for(int i = 0;i<arr.size();i++) {
			String bookstr = arr.get(i).toString();
			JSONObject bookList = new JSONObject(bookstr);
			Book b = new Book();
			b.setBookName(bookList.getString("bookName"));
			b.setBookKind(bookList.getString("bookKind"));
			b.setBookPublisher(bookList.getString("bookPublisher"));
			b.setBookIntroduce(bookList.getString("bookIntroduce"));
			b.setImageurl(bookList.getString("imageurl"));
			b.setISBN(bookList.getString("ISBN"));
			b.setBookWriter(bookList.getString("bookWriter"));
			System.out.println(b.getBookName());
			System.out.println(b.getBookKind());
			int result = service.insertBook(b);
			int result2 = service.updateProposal(b);
			System.out.println("isbn = "+b.getISBN());
		}
		
		//int result = service.proposalInsert();
		return "proposal/proposal";
	}
	
	
	@RequestMapping(value = "/proposalDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String deleteBook(@RequestBody String json) {
		//반려일때 
		//proposal테이블에 isproposal에 n입력
		JsonParser list = new JsonParser();
		JsonArray arr = (JsonArray)list.parse(json);
		for(int i=0;i<arr.size();i++) {
			String bookStr = arr.get(i).toString();
			JSONObject bookList = new JSONObject(bookStr);
			Book b = new Book();
			b.setISBN(bookList.getString("ISBN"));
			int result = service.nProposalBook(b);
		}
		
		return "proposal/proposal";
	}
	
	@ResponseBody
	@RequestMapping("/insertBookProposal")
	public String insertBookProposal(HttpSession session, ProposalVO p, Model model,String item) {
		System.out.println("사용자 도서 신청");
		User loginUser = (User)session.getAttribute("loginUser");
		JsonParser parser = new JsonParser();
		JsonElement o = parser.parse(item);
		p.setUserNo(loginUser.getUserNo());
		p.setBookIntroduce(o.getAsJsonObject().get("description").getAsString());
		p.setBookKind(o.getAsJsonObject().get("categoryName").getAsString());
		p.setBookName(o.getAsJsonObject().get("title").getAsString());
		p.setBookPublisher(o.getAsJsonObject().get("publisher").getAsString());
		p.setBookWriter(o.getAsJsonObject().get("author").getAsString());
		p.setImageurl(o.getAsJsonObject().get("cover").getAsString());
		p.setISBN(o.getAsJsonObject().get("isbn").getAsString());
				
		int result = service.insertProposal(p);

		if(result > 0) {
			return p.getBookName()+" 신청 완료";
		}else {
			return p.getBookName()+" 신청 불가";
		}
	}
}
