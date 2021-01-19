package com.dongnebook.chat.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.chat.model.vo.ChatMessage;
import com.dongnebook.chat.model.vo.ChatUser;
import com.dongnebook.user.model.vo.User;


@Repository
public class ChatDao {
	@Autowired
	private SqlSessionTemplate session;

	public ArrayList<ChatUser> selectChatUserList(int start, int end) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		List<ChatUser> list = session.selectList("chat.selectChatUserList",map);
		return (ArrayList<ChatUser>)list;
	}

	public int totalCount() {
		return session.selectOne("chat.selectChatUserCount",int.class);
	}

	public ArrayList<ChatMessage> selectOneCmList(String chatUser) {
		List<ChatMessage> list = session.selectList("chat.selectOneCmList",chatUser);
		return (ArrayList<ChatMessage>)list;
	}

	public String selectCmSender(ChatMessage cm) {
		return session.selectOne("chat.selectCmSenser", cm);
	}

	public User selectOneMember(String cmReceiver) {
		return session.selectOne("chat.selectOneServerUser", cmReceiver);
	}

	public int insertCM(ChatMessage cm) {
		System.out.println("확인용:"+cm.getCmSender());
		return session.insert("chat.insertCM",cm);
	}
	
}
