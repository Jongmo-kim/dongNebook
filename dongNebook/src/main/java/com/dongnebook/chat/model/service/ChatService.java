package com.dongnebook.chat.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongnebook.chat.model.dao.ChatDao;
import com.dongnebook.chat.model.vo.ChatMessage;
import com.dongnebook.chat.model.vo.ChatUser;
import com.dongnebook.chat.model.vo.ChatUserPageData;
import com.dongnebook.user.model.vo.User;


@Service
public class ChatService {

	@Autowired
	ChatDao dao;

	public ChatUserPageData chatUserList(int reqPage) {
		int numPerPage = 10; 		//한페이지 당 게시물 수
		//게시물 10개 가져오기 -> start값, end값 계산
		//reqpage = 1 ->1~10
		//reqpage = 2 ->11~20
		
		int end = reqPage * numPerPage;
		int start= end-numPerPage+1;
		
		ArrayList<ChatUser> list = dao.selectChatUserList(start,end);
		
		
		//pageNavi 제작
		//총 게시물 수
		int totalCount = dao.totalCount();
		
		System.out.println(totalCount);
		
		//총 페이지수
		int totalPage =0;
		if(totalCount%numPerPage==0) {
			totalPage=totalCount/numPerPage;
		}else {
			totalPage=totalCount/numPerPage+1;
		}
		
		//페이지 네비의 길이
		int pageNaviSize=5;
		//페이지 네비 시작번호
		int pageNo=((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		//페이지 네비 작성
		String pageNavi = "";
		//이전버튼 생성
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'><a class='btn page-link' href='/chat/oneByOneChat.do?reqPage="+(pageNo-1)+"'>이전</a>";
				}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo!=reqPage) {
				
				pageNavi += "<li class='page-item'><a class='btn page-link' href='/chat/oneByOneChat.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}else {
				pageNavi+="<li class='page-item'><span class='selectPage page-link'>"+pageNo+"</span>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		//총게시물 전까진  위의 포문 이후엔 페이지 넘버가 각 네비 끝에 와있기에  그것이 총게시물전이라면
		if(pageNo<=totalPage) {
			pageNavi +="<li class='page-item'><a class='btn page-link' href='/chat/oneByOneChat.do?reqPage="+pageNo+"'>다음</a>";
		}
		ChatUserPageData cupd=new ChatUserPageData(list,pageNavi);
		return cupd;
	}


	public ArrayList<ChatMessage> selectOneCmList(String chatUser) {
	
		return dao.selectOneCmList(chatUser);
	}


	public String selectCmSender(ChatMessage cm) {
		return dao.selectCmSender(cm);
	}


	public User selectOneMember(String cmReceiver) {
		
		return dao.selectOneMember(cmReceiver);
	}


	public int insertCM(ChatMessage cm) {
		return dao.insertCM(cm);
	}


	public int insertCmSender(ChatMessage cm) {
		return dao.insertCmSender(cm);
	}


	public ChatMessage selectLastCm(String loginUser) {
		return dao.selectLastCm(loginUser);
	}


	public int readChat(String loginUser) {
		return dao.readChat(loginUser);
		
	}


	public int readCm(ChatMessage cm) {
		return dao.readCm(cm);
		
	}


	public ArrayList<ChatMessage> adminReadChat() {
		return dao.adminReadChat();
	}
}
