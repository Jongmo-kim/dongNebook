package com.dongnebook.proposalAlert.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongnebook.proposalAlert.dao.PAlertDao;
import com.dongnebook.proposalAlert.model.vo.ProposalAlert;

@Service
public class PAlertService {

	@Autowired
	private PAlertDao dao;

	public ArrayList<ProposalAlert> selectPAlert(int userNo) {
		return dao.selectPAlert(userNo);
	}

	public int deleteP(int alertNo) {
		return dao.deleteP(alertNo);
	}
}
