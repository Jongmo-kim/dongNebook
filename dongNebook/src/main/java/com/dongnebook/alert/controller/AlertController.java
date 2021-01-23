package com.dongnebook.alert.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongnebook.alert.model.service.AlertService;
import com.dongnebook.alert.model.vo.Alert;
/**
 * @author 진수경
 *
 */
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
	
	@ResponseBody
	@RequestMapping("/countChk.do")
	public int countChk(int bookRentalNo) {
		System.out.println("컨트롤러"+bookRentalNo);
		int result = service.countChk(bookRentalNo);
		if(result>0) {
			return 1;
		}else {
			return -1;
		}
	}
}
