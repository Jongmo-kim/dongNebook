package com.dongnebook.chat.socket;

import java.util.HashMap;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.dongnebook.chat.model.dao.ChatDao;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Component("chat")
public class ChatSocket extends TextWebSocketHandler{
	@Autowired
	private ChatDao dao;
	private HashMap<String, WebSocketSession> connectMembers;
	
	
	public ChatSocket() {
		super();
		connectMembers = new HashMap<String, WebSocketSession>();
	}
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		System.out.println("클라이언트 접속(DM)");
	}
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage messag) throws Exception{
		System.out.println("여기까지면 성공");
		String recMsg = messag.getPayload();
		JsonParser parser = new JsonParser();
		JsonObject msg = (JsonObject)parser.parse(recMsg);
		String type = msg.get("type").getAsString();
		String data = msg.get("data").getAsString();
		System.out.println("리시버:"+data);
		System.out.println("타입:"+type);
		if(type.equals("register")) {
			connectMembers.put(data, session);
		}else if(type.equals("count")) {
			//int count = dao.cmCount(data);//data = memberId
			//connectMembers.get(data).sendMessage(new TextMessage(String.valueOf(count)));
			//header의 onMessage메소드로 보냄
		}else {
			//type이 receiver일때 호출
			System.out.println("메세지를 보내는 곳으로 이동");
			String receiver=data;  //보낸사람을ㄹ 저장하고 전송
			connectMembers.get(data).sendMessage(new TextMessage(receiver));
		}
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		//연결끊어졌을때 웹에서 빼내는 작업->하지않으면 connectMembers에 계속 남아있음
		System.out.println("클라이언트 접속 해제");
		Set<String> keys = connectMembers.keySet();
		for(String key : keys) {
			WebSocketSession currentSession = connectMembers.get(key);
			if(currentSession.equals(session)) {
				connectMembers.remove(key);
				break;
			}
		
	}
	}
}