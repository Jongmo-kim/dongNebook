package com.dongnebook.chat.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongnebook.admin.model.vo.Admin;
import com.dongnebook.chat.model.service.ChatService;
import com.dongnebook.chat.model.vo.ChatMessage;
import com.dongnebook.chat.model.vo.ChatUserPageData;
import com.dongnebook.user.model.vo.User;



@Controller
@RequestMapping("/chat")
public class ChatController {
	@Autowired
	ChatService service;
	
	@ResponseBody
	@RequestMapping("/chatReload.do")
	public ChatMessage chatReload(String loginUser,Model model) {
		System.out.println("이거닷"+loginUser);
		//리시버가 로그인 유저인걸로
		
		ChatMessage lastDm = service.selectLastCm(loginUser);
		System.out.println(lastDm.getMessage());
		return lastDm;
	}
	@RequestMapping("/oneByOneChat.do")
	public String oneByOneChat(Model model, int reqPage) {
		ChatUserPageData cupd = service.chatUserList(reqPage);
		System.out.println(cupd.getList().get(0).getCmSender());
		model.addAttribute("list", cupd.getList());
		model.addAttribute("pageNavi", cupd.getPageNavi());
		return "chat/chatRoom";
	}
	@RequestMapping("/chatRoom.do")
	public String chatRoom(String chatUser,Model model,HttpSession session) {
		System.out.println("이거지"+chatUser);
		if(chatUser.equals("admin")) {
			System.out.println("이걸 거친다"+chatUser);
			User loginUser =  (User)session.getAttribute("loginUser");
			ArrayList<ChatMessage> list = service.selectOneCmList(loginUser.getUserId());
			service.readChat(loginUser.getUserId());
			model.addAttribute("chatUser", "admin");
			model.addAttribute("cmList", list);
			System.out.println(list.get(0).getMessage());
		}else {
			System.out.println("이걸 거친다"+chatUser);
			ArrayList<ChatMessage> list = service.selectOneCmList(chatUser);
			service.readChat(chatUser);
			model.addAttribute("chatUser",chatUser);
			model.addAttribute("cmList",list);			
			System.out.println(list.get(0).getMessage());
		}
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
		System.out.println("보자 센더:"+cm.getCmSender());
		System.out.println("보자 리시버:"+cm.getCmReceiver());
		User serverUser=null;
		Admin admin=null;
		if(cm.getCmReceiver().equals("admin")) {
			String cmSender = service.selectCmSender(cm);
			if(cmSender==null && !cm.getCmSender().equals("admin")) {
				service.insertCmSender(cm);
			}
			serverUser=(User)session.getAttribute("loginUser");
		}else {
			serverUser= service.selectOneMember(cm.getCmReceiver());
			System.out.println(serverUser);			
		}
		if(cm.getCmReceiver().equals(cm.getCmSender())) {
			return 2;
		}else if(serverUser==null&&admin==null) {
			return 3;
		}else{
			return service.insertCM(cm);
		}
	}
}
