package com.dongnebook.proposal.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.proposal.model.service.ProposalService;
import com.dongnebook.proposal.model.vo.ProposalVO;
import com.sun.corba.se.impl.oa.poa.ActiveObjectMap.Key;

@Repository
public class ProposalDao {

	@Autowired
	private SqlSessionTemplate session;

	public ArrayList<ProposalVO> selectProposalList(int start, int end) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		List<ProposalVO> list = session.selectList("pro.proposalList", map);
		return (ArrayList<ProposalVO>)list;
	}

	public int totalCount() {
		return session.selectOne("pro.totalCount");
	}

}
