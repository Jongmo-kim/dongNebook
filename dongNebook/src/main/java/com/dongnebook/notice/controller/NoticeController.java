package com.dongnebook.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dongnebook.notice.model.service.NoticeService;
import com.dongnebook.notice.model.vo.Notice;

/**
 * @author 진수경
 *
 */

@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@RequestMapping("/noticeList.do")
	public String noticeList(Model model) {
		ArrayList<Notice> list = service.noticeList();
		for(Notice n : list) {
			System.out.println(n.toString());
		}
		return "";
	}
}
