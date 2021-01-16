package com.dongnebook.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dongnebook.review.model.service.ReviewService;
import com.dongnebook.review_co_comment.model.vo.ReviewCoComment;
import com.dongnebook.review_comment.model.vo.ReviewComment;
import com.dongnebook.user.model.vo.User;

/**
 * @author 김종모
 *
 */
@Controller
@RequestMapping("/review")
public class ReviewController {
	@Autowired
	private ReviewService service;
	
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
	public String write(String content, String choices,String userNo) {
		System.out.println(content);
		System.out.println(choices);
		System.out.println(userNo);
		return "/review/main";
	}
}
