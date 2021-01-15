package com.dongnebook.alert.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dongnebook.alert.model.dao.AlertDao;
import com.dongnebook.alert.model.vo.Alert;
import com.dongnebook.user.model.vo.User;

@Service
public class AlertService {
	@Autowired
	private AlertDao dao;
	
	public ArrayList<Alert> returnAlert(int userNo) {
		ArrayList<Alert> list = dao.returnAlert(userNo);
		
		for(Alert ba : list) {
			ba.setRead(0);
			String bookName = ba.getBookName();
			//책 이름을 15글자로 제한
			String shortName = bookName.substring(0, 15);
			ba.setBookName(shortName);
			System.out.println(ba.toString());
		}
		return list;
	}

	@Transactional
	public int insertAlert(ArrayList<Alert> list) {
		int chk = 0;
		int result = 0;
		for(Alert a : list) {
			result = dao.insertAlert(a);
			if(result>0) {
				chk++;
			}
		}
		if(chk==list.size()) {
			return 1;
		} else {
			return 0;
		}
	}
}
