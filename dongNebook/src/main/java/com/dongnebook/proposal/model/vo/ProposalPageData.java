package com.dongnebook.proposal.model.vo;

import java.util.ArrayList;

public class ProposalPageData {
	private ArrayList<ProposalVO> list;
	private String pageNavi;
	public ProposalPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProposalPageData(ArrayList<ProposalVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<ProposalVO> getList() {
		return list;
	}
	public void setList(ArrayList<ProposalVO> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
