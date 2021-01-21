package com.dongnebook.proposal.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.book.model.vo.Book;
import com.dongnebook.proposal.model.service.ProposalService;
import com.dongnebook.proposal.model.vo.ProposalVO;
import com.sun.corba.se.impl.oa.poa.ActiveObjectMap.Key;

@Repository
public class ProposalDao {

	@Autowired
	private SqlSessionTemplate session;

	public ArrayList<ProposalVO> selectProposalList(int start, int end, int selectType) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("selectType", selectType);
		List<ProposalVO> list = session.selectList("pro.proposalList", map);
		return (ArrayList<ProposalVO>)list;
	}

	public int totalCount(int selectType) {
		return session.selectOne("pro.totalCount", selectType);
	}

	public int insertBook(Book b) {
		return session.insert("pro.inserBook", b);
	}

	public int updateProposal(Book b) {
		return session.update("pro.updateProposal",b);
	}

	public int insertProposal(ProposalVO p) {
		return session.insert("pro.insertProposal", p);
	}

	public int nProposalBook(Book b) {
		return session.update("pro.nProposalBook",b);
	}

}
