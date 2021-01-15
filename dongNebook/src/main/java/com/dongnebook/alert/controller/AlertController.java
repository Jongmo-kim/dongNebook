package com.dongnebook.alert.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongnebook.alert.model.service.AlertService;
import com.dongnebook.alert.model.vo.Alert;
import com.dongnebook.user.model.vo.User;

@Controller
@RequestMapping("/alert")
public class AlertController {
	@Autowired
	private AlertService service;
	
	@ResponseBody
	@RequestMapping("/alertList.do")
	public ArrayList<Alert> alertList(int userNo) {
		//User loginUser = (User)session.getAttribute("loginUser");
		System.out.println("alertList.do 실행 / userNo >"+userNo);
		//사용자가 빌린 책 중 반납일이 하루 남은 책 조회 / list가 비어있으면 반납 예정 도서 없는 것
		ArrayList<Alert> list = service.returnAlert(userNo);

		
		//조회한 책을 alert 테이블에 insert
		int result = service.insertAlert(list);
		if(result>0) {
			return list;
		} else {
			return null;
		}
	}
}
