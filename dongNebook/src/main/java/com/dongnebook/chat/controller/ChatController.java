package com.dongnebook.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dongnebook.chat.model.service.ChatService;
import com.dongnebook.chat.model.vo.ChatUserPageData;

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
}
