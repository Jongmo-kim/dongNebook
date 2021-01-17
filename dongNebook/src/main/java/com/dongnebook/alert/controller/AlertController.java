package com.dongnebook.alert.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongnebook.alert.model.service.AlertService;
import com.dongnebook.alert.model.vo.Alert;

@Controller
@RequestMapping("/alert")
public class AlertController {
	@Autowired
	private AlertService service;
	
	@ResponseBody
	@RequestMapping("/alertList.do")
	public ArrayList<Alert> alertList(int userNo) {
		//User loginUser = (User)session.getAttribute("loginUser");
		ArrayList<Alert> list = service.selectUserAlert(userNo);
		
		return list;
	}
}
