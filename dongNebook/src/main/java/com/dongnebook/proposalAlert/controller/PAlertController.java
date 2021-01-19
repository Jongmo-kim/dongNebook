package com.dongnebook.proposalAlert.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongnebook.proposalAlert.model.vo.ProposalAlert;
import com.dongnebook.proposalAlert.service.PAlertService;
import com.google.gson.Gson;

@Controller
@RequestMapping("/proposalAlert")
public class PAlertController {

	@Autowired
	private PAlertService service;
	
	@ResponseBody
	@RequestMapping(value="/proposalAlert.do",produces = "application/json;charset=utf-8")
	public String PAlert(int userNo) {
		ArrayList<ProposalAlert> list = service.selectPAlert(userNo);
		
		
		return new Gson().toJson(list);
	}
	@ResponseBody
	@RequestMapping("/deleteP.do")
	public int deleteP(int alertNo) {
		int result = service.deleteP(alertNo);
		System.out.println("result : "+result);
		if(result>0) {
			return 1;
		}else {
			return 0;
		}
	}
}
