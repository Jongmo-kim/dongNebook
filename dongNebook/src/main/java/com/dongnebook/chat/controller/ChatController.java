package com.dongnebook.chat.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongnebook.chat.model.service.ChatService;
import com.dongnebook.chat.model.vo.ChatMessage;
import com.dongnebook.chat.model.vo.ChatUserPageData;
import com.dongnebook.user.model.vo.User;


@Controller
@RequestMapping("/chat")
public class ChatController {
	@Autowired
	ChatService service;
	
	@RequestMapping("/oneByOneChat.do")
	public String oneByOneChat(Model model, int reqPage) {
		ChatUserPageData cupd = service.chatUserList(reqPage);
		System.out.println(cupd.getList().get(0).getCmSender());
		model.addAttribute("list", cupd.getList());
		model.addAttribute("pageNavi", cupd.getPageNavi());
		return "chat/chatRoom";
	}
	@RequestMapping("/chatRoom.do")
	public String chatRoom(String chatUser,Model model) {
		System.out.println("이거지"+chatUser);
		ArrayList<ChatMessage> list = service.selectOneCmList(chatUser);
		model.addAttribute("chatUser",chatUser);
		model.addAttribute("cmList",list);
		return "chat/chatting";
	}
	@ResponseBody
	@RequestMapping("/cmInsert.do")
	public int dmInsert(ChatMessage cm,HttpSession session) {
		//채팅 유저중에 있는 사람인지 체크
		String cmSender = service.selectCmSender(cm);
		//여기까지 완성
		System.out.println("보내는사람"+cmSender);
		//없으면
		/*if(cmSender==null && !cm.getCmSender().equals("admin")) {
			service.insertCmSender(cm);
		}
		//Member member= (Member)session.getAttribute("m");
		User serverUser= service.selectOneMember(cm.getCmReceiver());
		System.out.println(serverUser);
		if(cm.getCmReceiver().equals(cm.getCmSender())) {
			return 2;
		}else if(serverUser==null) {
			return 3;
		}else{
			return service.insertDM(cm);
		}*/
		return 1;
	}
	@ResponseBody
	@RequestMapping("/cmAdminInsert")
	public int cmAdminInsert(ChatMessage cm,HttpSession session) {
		
		User serverUser= service.selectOneMember(cm.getCmReceiver());
		System.out.println(serverUser);
		if(cm.getCmReceiver().equals(cm.getCmSender())) {
			return 2;
		}else if(serverUser==null) {
			return 3;
		}else{
			return service.insertCM(cm);
		}
	}
}
