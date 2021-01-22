package com.dongnebook.rank.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongnebook.book.model.vo.Book;
import com.dongnebook.book.model.vo.BookPageData;
import com.dongnebook.rank.model.dao.RankDao;
@Service
public class RankService {
	@Autowired
	private RankDao dao;

	public BookPageData searchRankList(int reqPage) {
		int totalCount = dao.totalCount();
		int numPerPage = 10; 	
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int start = (reqPage-1)*numPerPage+1;
		int end =  reqPage*numPerPage;
		System.out.println("start"+start);
		System.out.println("end"+end);
		
		ArrayList<Book> list = dao.selectRankList(start,end);
		
		System.out.println("list.size"+list.size());
		System.out.println(totalCount);
		System.out.println(list.get(0).getBookName());
		System.out.println("reqPage"+reqPage);
		
		int pageNaviSize=5;
		String pageNavi = "";
		
		int pageNo = reqPage-2;
		if(reqPage <=3 ) {
			pageNo = 1;
		}else if(pageNo > totalPage-4) {
			pageNo = totalPage-3;
		}
		
		
		//이전버튼 생성
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'><a class='btn page-link' href='/rank/rankList.do?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			
			if(reqPage == pageNo) {
				pageNavi += "<li class='page-item'><span class='selectPage page-link'>"+pageNo+"</span>";
			}else {
				if(pageNo!=0) {
					pageNavi += "<li class='page-item'><a class='btn page-link' href='/rank/rankList.do?reqPage="+(pageNo)+"'>"+pageNo+"</a>";
				}
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'><a class='btn page-link' href='/rank/rankList.do?reqPage="+(pageNo)+"'>다음</a>";
		}
		BookPageData npd=new BookPageData(list,pageNavi);
		return npd;
	}

	public ArrayList<Book> mainRank() {
		return dao.mainRank();
	}

	public ArrayList<Book> rankFive() {
		return dao.rankFive();
	}
}
