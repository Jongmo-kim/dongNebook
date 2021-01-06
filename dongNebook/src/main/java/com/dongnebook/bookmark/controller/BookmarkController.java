package com.dongnebook.bookmark.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongnebook.book.model.vo.Book;
import com.dongnebook.bookmark.model.service.BookmarkService;
import com.dongnebook.bookmark.model.vo.Bookmark;
import com.dongnebook.user.model.vo.User;

@Controller
@RequestMapping("/book")
@ResponseBody
public class BookmarkController {
	@Autowired
	private BookmarkService service;
	
	@RequestMapping("/insertBookmark.do")
	public int insertBookmark(String isbn,HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		
		int result= service.insertBookmark(isbn,loginUser.getUserNo());
		
		return result;
	}
	@RequestMapping("/deleteBookmark.do")
	public int deleteBookmark(String isbn,HttpSession session) {
		System.out.println("1");
		User loginUser = (User)session.getAttribute("loginUser");
		
		int result= service.deleteBookmark(isbn,loginUser.getUserNo());
		
		return result;
	}
	@RequestMapping("/bookMarkList.do")
	public String searchUser(HttpSession session, Model model) {
		User loginUser = (User)session.getAttribute("loginUser");
		System.out.println(loginUser.getUserNo());
		int userNo = loginUser.getUserNo();
		Bookmark bookmark = service.searchBookMark(userNo);
		System.out.println(bookmark.getISBN13());
		ArrayList<Book> list = service.searchBookMarkList(bookmark.getISBN13());
		model.addAttribute("bookList",list);
		return "bookmark/bookMark";
	}
	
}
