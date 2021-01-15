package com.dongnebook.proposal.model.service;

import java.util.ArrayList;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongnebook.book.model.vo.Book;
import com.dongnebook.proposal.model.dao.ProposalDao;
import com.dongnebook.proposal.model.vo.ProposalPageData;
import com.dongnebook.proposal.model.vo.ProposalVO;
import com.dongnebook.user.model.vo.User;

@Service
public class ProposalService {

	@Autowired
	private ProposalDao dao;
	
	public ProposalPageData selectList(int reqPage) {
		int totalCount = dao.totalCount();
		int numPerPage = 10;
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		
		ArrayList<ProposalVO> list = dao.selectProposalList(start,end);
		
		int pageNaviSize = 5;
		String pageNavi = "";
		
		int pageNo = reqPage-2;
		if(reqPage <=3) {
			pageNo = 1;
		}else if(pageNo > totalPage-4) {
			pageNo = totalPage-4;
		}
		
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'><a class='btn page-link' href='/proposal/proposalList.do?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<li class='page-item'><span class='selectPage page-link'>"+pageNo+"</span>";
			}else {
				pageNavi += "<li class='page-item'><a class='btn page-link' href='/proposal/proposalList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'><a class='btn page-link' href='/proposal/proposalList.do?reqPage="+(pageNo)+"'>다음</a>";
		}
		ProposalPageData ppd = new ProposalPageData(list, pageNavi);
		return ppd;
	}

	public int insertBook(Book b) {
		return dao.insertBook(b);
	}

	public int deleteBook(Book b) {
		return dao.deleteBook(b);
	}

	public int insertProposal(ProposalVO p) {
		return dao.insertProposal(p);
	}

}
