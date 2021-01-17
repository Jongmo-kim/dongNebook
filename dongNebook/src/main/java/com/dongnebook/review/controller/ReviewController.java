package com.dongnebook.review.controller;

import java.util.ArrayList;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongnebook.book.model.service.BookService;
import com.dongnebook.book.model.vo.Book;
import com.dongnebook.common.hangulTrie;
import com.dongnebook.common.hangulTrie.trieNode;
import com.dongnebook.review.model.service.ReviewService;
import com.dongnebook.review.model.vo.Review;
import com.dongnebook.user.model.service.UserService;
import com.dongnebook.user.model.vo.User;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

/**
 * @author 김종모
 *
 */
@Controller
@RequestMapping("/review")
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private UserService userService;
	
	private hangulTrie trie;
	
	

	public ReviewController() {
		super();
		trie = new hangulTrie();
	}


	@PostConstruct
	public void booklistInit() {
		ArrayList<Book> bookList = bookService.selectAllBook();
		for(Book b  : bookList) {
			trie.insert(b.getBookName());
		}
	}
	
	@RequestMapping("/main")
	public String sendToMain(Model model) {
		model.addAttribute("bookList", service.selectAllReview());
		return "/review/main";
	}
	
	@RequestMapping("/writeFrm")
	public String writeFrm(User u) {
		return "/review/writeFrm";
	}
	
	@RequestMapping("/write.do")
	public String write(Review review,User user, String[] tags,Model model) {
		review.setUser(userService.selectOneUser(user));
		int reviewResult = service.insertReview(review,tags);
		if(reviewResult > 0) {
				model.addAttribute("msg","글쓰기 성공");
				model.addAttribute("result", "true");
		} else {
				model.addAttribute("msg","글쓰기 실패");
		}
		model.addAttribute("loc", "/");
		return "/common/msg";
	}
	
	@ResponseBody
	@RequestMapping("/item.do")
	public JsonArray item(){
		JsonArray arr = new JsonArray();
		JsonObject o = new JsonObject();
		o.addProperty("value", "One");
		o.addProperty("label", "Label One");
		arr.add(o);
		arr.add(o);
		arr.add(o);
		return arr;
	}
	
	@ResponseBody
	@RequestMapping("/autocomplete.do")
	public JsonArray autocomplete(String inputVal) {
		ArrayList<trieNode> nodes = trie.findAllLeafsInclude(inputVal);
		JsonArray arr = new JsonArray();
		for(trieNode n : nodes) {
			JsonObject o = new JsonObject();
			o.addProperty("value", n.getCurrString());
			o.addProperty("label", n.getCurrString() + " Label");
			arr.add(o);
		}
		return arr;
	}
	
}
