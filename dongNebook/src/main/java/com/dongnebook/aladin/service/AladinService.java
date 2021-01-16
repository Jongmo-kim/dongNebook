package com.dongnebook.aladin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongnebook.aladin.dao.AladinDao;

@Service
public class AladinService {

	@Autowired
	private AladinDao dao;
	
	public String aladinPage(int totalCount, int reqPage) {
		int numPerPage = 10; 		//한페이지 당 게시물 수
		//게시물 10개 가져오기 -> start값, end값 계산
		//reqpage = 1 ->1~10
		//reqpage = 2 ->11~20
		
		int end = reqPage * numPerPage;
		int start= end-numPerPage+1;
		
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
			pageNavi += "<li class='page-item'><a class='btn page-link' onclick=bookSearch("+(pageNo-1)+")>이전</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo==reqPage) {
				pageNavi += "<li class='page-item'><span class='selectPage page-link'>"+pageNo+"</span>";
			}else {
				pageNavi+="<li class='page-item'><a class='btn page-link' onclick=bookSearch("+(pageNo)+")>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		//총게시물 전까진  위의 포문 이후엔 페이지 넘버가 각 네비 끝에 와있기에  그것이 총게시물전이라면
		if(pageNo<=totalPage) {
			pageNavi +="<li class='page-item'><a class='btn page-link' onclick=bookSearch("+(pageNo)+")>다음</a>";
			
		}
		
		return pageNavi;
	}
}
