package com.dongnebook.chat.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.chat.vo.ChatUser;

@Repository
public class ChatDao {
	@Autowired
	SqlSessionTemplate session;

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
	
}
