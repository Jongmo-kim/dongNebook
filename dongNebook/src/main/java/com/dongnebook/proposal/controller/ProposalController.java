package com.dongnebook.proposal.controller;

import java.util.ArrayList;
import java.util.StringTokenizer;

import org.json.JSONArray;
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
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import jdk.nashorn.internal.parser.JSONParser;

@Controller
@RequestMapping("/proposal")
public class ProposalController {

	@Autowired
	private ProposalService service;
	@Autowired
	private UserService userService;
	//new로하면 의존성 주입 안됨
	
	@RequestMapping("/proposalList.do")
	public String proposalList(Model model, int reqPage) {
		ProposalPageData ppd = service.selectList(reqPage);
		ArrayList<User> userList = new ArrayList<User>();
		
		for(int i=0; i<ppd.getList().size();i++) {
			User u = new User();
			u.setUserNo(ppd.getList().get(i).getUserNo());
			u = userService.selectOneUser(u);
			userList.add(u);
		}
		
		System.out.println("userList = "+userList.size());
		System.out.println("ppdSize = "+ppd.getList().size());
		model.addAttribute("list", ppd.getList());
		model.addAttribute("userList",userList);
		model.addAttribute("pageNavi", ppd.getPageNavi());
		return "proposal/proposal";
	}

	//아작스를 쓰기위해서는 @ResponseBody 를 해줘야함
	@RequestMapping(value = "/proposalSuccess.do", method=RequestMethod.POST)
	@ResponseBody
	public String proposalInsert(@RequestBody String json){
		
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
			int result2 = service.deleteBook(b);
			System.out.println("isbn = "+b.getISBN());
		}
		
		//int result = service.proposalInsert();
		return "proposal/proposal";
	}
	
	
	@RequestMapping(value = "/proposalDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String deleteBook(@RequestBody String json) {
		JsonParser list = new JsonParser();
		JsonArray arr = (JsonArray)list.parse(json);
		for(int i=0;i<arr.size();i++) {
			String bookStr = arr.get(i).toString();
			JSONObject bookList = new JSONObject(bookStr);
			Book b = new Book();
			b.setISBN(bookList.getString("ISBN"));
			int result = service.deleteBook(b);
		}
		
		return "proposal/proposal";
	}
}
