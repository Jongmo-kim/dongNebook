package com.dongnebook.chat.model.vo;

import java.util.ArrayList;



public class ChatUserPageData {
	private ArrayList<ChatUser> list;
	private String pageNavi;
	public ChatUserPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChatUserPageData(ArrayList<ChatUser> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<ChatUser> getList() {
		return list;
	}
	public void setList(ArrayList<ChatUser> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
}
