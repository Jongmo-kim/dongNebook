package com.dongnebook.alert.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.dongnebook.alert.model.dao.AlertDao;
import com.dongnebook.alert.model.vo.Alert;

@Service
public class AlertService {
	@Autowired
	private AlertDao dao;
	
	public ArrayList<Alert> selectUserAlert(int userNo) {
		ArrayList<Alert> list = dao.selectUserAlert(userNo);
		
		for(Alert ba : list) {
			String bookName = ba.getBookName();
			//책 이름을 15글자로 제한
			String shortName = bookName.substring(0, 15);
			ba.setBookName(shortName);
			System.out.println(ba.toString());
		}
		return list;
	}
	
	//매일 정각에 book_rental 테이블을 조회해서 반납 1일 전 대여 목록을 alert 테이블에 넣어줌 
	@Scheduled(cron = "0/5 0 0 * * *")
	//@Scheduled(cron ="0/10 * * * * *")
	public void insertAlert() {
		System.out.println("insertAlert 실행완료");
		dao.deleteAlert();
		dao.insertAlert();
	}
}
