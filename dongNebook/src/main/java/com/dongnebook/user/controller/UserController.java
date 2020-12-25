package com.dongnebook.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dongnebook.category.model.vo.Category;
import com.dongnebook.user.model.service.UserService;
import com.dongnebook.user.model.vo.User;

/**
 * @author 김종모
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService service;
	
	@RequestMapping("/signupFrm.do")
	public String signupFrm() {
		return "/user/signupFrm";
	}
	
	@RequestMapping("/signup.do")
	public String signup(User u,Category c,Model model) {
		u.setCategory(c);
		int result = service.insertUser(u);
		if(result > 0 ) {
			model.addAttribute("msg", "회원가입 성공");
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("msg", "회원가입 성공");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}
	
	@RequestMapping("/loginFrm.do")
	public String loginFrm() {
 		return "/user/loginFrm";
	}
	
	@RequestMapping("/login.do")
	public String login(Model model, User u, HttpSession session) {
		User loginUser = service.loginUser(u);
		if(loginUser != null) {
			model.addAttribute("msg", "로그인 성공");
			session.setAttribute("loginUser", loginUser);
			model.addAttribute("result", "true");
		}else {
			model.addAttribute("msg", "로그인 실패");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}
	@RequestMapping("/logout.do")
	public String logout(HttpSession session,Model model) {
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser != null) {
			model.addAttribute("msg", "로그아웃 성공");
			session.invalidate();
			model.addAttribute("result", "true");
		}else {
			model.addAttribute("msg", "로그아웃 실패");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}
	@RequestMapping("/update.do")
	public String update(User u,Model model,HttpSession session) {
		int result = service.updateUser(u);
		if(result >0) {
			model.addAttribute("msg", "수정 성공");
			session.setAttribute("loginUser", service.selectOneUser(u));
			model.addAttribute("result", "true");
		}else {
			model.addAttribute("msg", "수정 실패");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}
	@RequestMapping("/mypageFrm.do")
	public String mypage() {
		return "user/mypageFrm";
	}
	@RequestMapping("/delete.do")
	public String delete(User u,Model model,HttpSession session) {
		int result = service.deleteUser(u);
		if(result >0) {
			model.addAttribute("msg", "탈퇴 성공");
			session.invalidate();
			model.addAttribute("result", "true");
		}else {
			model.addAttribute("msg", "탈퇴 실패");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}
}
