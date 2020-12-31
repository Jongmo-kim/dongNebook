package com.dongnebook.notice.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongnebook.notice.model.dao.NoticeDao;
import com.dongnebook.notice.model.vo.Notice;

/**
 * @author 진수경
 *
 */

@Service
public class NoticeService {
	@Autowired
	private NoticeDao dao;
	
	public ArrayList<Notice> noticeList(){
		ArrayList<Notice> list = dao.noticeList();
		return list;
	}
}
