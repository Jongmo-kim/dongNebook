package com.dongnebook.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;

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
	public ChatMessage chatReload(String loginUser,Model model,HttpSession session) {
		System.out.println(session.getAttribute("loginUser")+"이거닷"+loginUser);
		//리시버가 로그인 유저인걸로
		ChatMessage lastDm = service.selectLastCm(loginUser);
		System.out.println(lastDm.getMessage());
		return lastDm;
	}
	@RequestMapping("/oneByOneChat.do")
	public String oneByOneChat(Model model, int reqPage) {
		ChatUserPageData cupd = service.chatUserList(reqPage);
		//System.out.println(cupd.getList().get(0).getCmSender());
		ArrayList<ChatMessage> cm = service.adminReadChat();
		model.addAttribute("list", cupd.getList());
		model.addAttribute("pageNavi", cupd.getPageNavi());
		model.addAttribute("cm", cm);
		//어드민 읽지않음 데이터 불러오기
		
		return "chat/chatRoom";
	}
	@ResponseBody
	@RequestMapping("/chatRoom.do")
	public HashMap<String, Object> chatRoom(String chatUser,Model model,HttpSession session) {
		System.out.println("이거지"+chatUser);
		ArrayList<ChatMessage> list=null;
		User loginUser =  (User)session.getAttribute("loginUser");
		if(chatUser.equals("admin")) {
			System.out.println("뉴 챗");
			System.out.println("이걸 거친다"+chatUser);
			if(loginUser!=null) {
				list = service.selectOneCmList(loginUser.getUserId());
				System.out.println("읽음에 들어가는 값"+loginUser.getUserId());
				service.readChat(loginUser.getUserId());	
			}
		}else {
			System.out.println("이걸 거친다"+chatUser);
			list = service.selectOneCmList(chatUser);
			System.out.println("읽음에 들어가는 값 : admin");
			service.readChat("admin");
					
			
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		if(loginUser!=null) {
			User u=(User)session.getAttribute("loginUser");
			map.put("login", u.getUserId());			
		}else {
			map.put("login", "admin");
		}
		return map;
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
	@RequestMapping("/readCm.do")
	@ResponseBody
	public String readCm(ChatMessage cm) {
		System.out.println("보내는사람:"+cm.getCmSender());
		System.out.println("받는사람:"+cm.getCmReceiver());
		service.readCm(cm);
		return "성공";
	}
}
