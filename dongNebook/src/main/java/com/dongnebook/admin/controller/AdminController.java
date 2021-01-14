package com.dongnebook.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dongnebook.admin.model.service.AdminService;
import com.dongnebook.admin.model.vo.Admin;
import com.dongnebook.user.model.vo.User;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	// Start
	@RequestMapping("/adminLogin.do")
	public String adminLogin(Model model,Admin admin,HttpSession session) {
		Admin loginAdmin = service.adminLogin(admin);
		if(loginAdmin!=null) {
			session.setAttribute("loginAdmin", loginAdmin);
			System.out.println(loginAdmin.toString());
			model.addAttribute("msg", "로그인 성공");
			model.addAttribute("result", "true");
		}else {
			model.addAttribute("msg", "로그인 실패");
		}
		model.addAttribute("loc","/");
		return "common/msg";
	}
	@RequestMapping("/logout.do")
	public String logout(HttpSession session,Model model) {
		Admin loginAdmin = (Admin)session.getAttribute("loginAdmin");
		if(loginAdmin != null) {
			model.addAttribute("msg", "로그아웃 성공");
			session.invalidate();
			model.addAttribute("result", "true");
		}else {
			model.addAttribute("msg", "로그아웃 실패");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}
}
