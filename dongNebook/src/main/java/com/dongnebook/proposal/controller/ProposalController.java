package com.dongnebook.proposal.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dongnebook.book.model.vo.Book;
import com.dongnebook.proposal.model.service.ProposalService;
import com.dongnebook.proposal.model.vo.ProposalPageData;
import com.dongnebook.proposal.model.vo.ProposalVO;
import com.dongnebook.user.model.service.UserService;
import com.dongnebook.user.model.vo.User;

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
		
		System.out.println("userNo1"+userList.get(0));
		System.out.println("userNo2"+userList.get(1));
		System.out.println("userNo2"+userList.get(2));
		System.out.println("userNo2"+userList.get(3));
		System.out.println("userList = "+userList.size());
		System.out.println("ppdSize = "+ppd.getList().size());
		model.addAttribute("list", ppd.getList());
		model.addAttribute("userList",userList);
		model.addAttribute("pageNavi", ppd.getPageNavi());
		return "proposal/proposal";
	}
	
	@RequestMapping("/proposalSuccess.do")
	public String proposalInsert(Model model) {
		
		return "";
	}
}
