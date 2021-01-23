package com.dongnebook.rental.model.vo;

import java.util.ArrayList;
/**
 * @author 진수경
 *
 */
public class RentalPageData {
	private ArrayList<Rental> list;
	private String pageNavi;
	public RentalPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RentalPageData(ArrayList<Rental> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Rental> getList() {
		return list;
	}
	public void setList(ArrayList<Rental> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
