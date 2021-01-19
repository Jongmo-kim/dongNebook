package com.dongnebook.proposalAlert.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.proposalAlert.model.vo.ProposalAlert;

@Repository
public class PAlertDao {

	@Autowired
	private SqlSessionTemplate session;

	public ArrayList<ProposalAlert> selectPAlert(int userNo) {
		List<ProposalAlert> list = session.selectList("pa.selectPAlert", userNo);
		return (ArrayList<ProposalAlert>)list;
	}

	public int deleteP(int alertNo) {
		return session.update("pa.deleteP", alertNo);
	}
}
