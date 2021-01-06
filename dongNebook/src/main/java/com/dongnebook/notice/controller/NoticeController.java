package com.dongnebook.notice.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.FileVisitOption;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.dongnebook.common.FileOverlap;
import com.dongnebook.common.FileVO;
import com.dongnebook.notice.model.service.NoticeService;
import com.dongnebook.notice.model.vo.Notice;
import com.dongnebook.notice.model.vo.NoticePageData;
import com.dongnebook.user.model.vo.User;

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
	public String noticeList(Model model, int reqPage) {
		NoticePageData npd = service.selectNoticeList(reqPage);

		model.addAttribute("list",npd.getList());
		model.addAttribute("pageNavi",npd.getPageNavi());

		return "notice/noticeList";
	}

	@RequestMapping("/noticeFrm.do")
	//로그인 했다는 가정하에 진행
	public String noticeFrm(User u,Model model,HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		model.addAttribute("u",loginUser);
		return "notice/noticeFrm";
	}

	@RequestMapping("/insertNotice.do")
	//MultipartFile이 form에 있는 file을 받아옴. 이래야 파일에 대한 값을 처리할 수 있음
	public String insertNotice(Notice n, MultipartFile[] files, HttpServletRequest request, Model model) {
		/* 매개변수 설명
		 * Notice n : 제목, 작성자, 본문 내용을 가져오는 매개변수
		 * MultipartFile : 업로드하는 파일을 가져오기 위한 매개변수
		 * HttpServletRequest : 업로드 경로를 가져오기 위한 매개변수
		 * Model : 결과처리를 위한 매개변수
		 */

		//1. 업로드 경로 지정
		// 경로를 c드라이브부터 현재 프로젝트의 webapp까지 찾아와 줌
		String root = request.getSession().getServletContext().getRealPath("/");
		String path = root + "resources/upload/notice/";

		ArrayList<FileVO> fileList = new ArrayList<FileVO>();
		for(MultipartFile file : files) {
			if(!file.isEmpty()) {
				//사용자가 올린 파일명
				String filename = file.getOriginalFilename();
				//파일 rename
				String filepath = new FileOverlap().rename(path, filename);
				System.out.println("filename : "+filename);
				System.out.println("filepath : "+filepath);
				try {
					byte[] bytes = file.getBytes();
					File upFile = new File(path+filepath);
					FileOutputStream fos = new FileOutputStream(upFile);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					bos.write(bytes);
					bos.close();
					FileVO f = new FileVO();
					f.setFilename(filename);
					f.setFilepath(filepath);
					fileList.add(f);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}	//for문 끝
		
		int result = service.insertNotice(n);

		if(result>0) {
			model.addAttribute("msg", "공지사항 등록 성공");
			model.addAttribute("loc", "/");
			model.addAttribute("result", true);
		} else {
			model.addAttribute("msg", "공지사항 등록 실패");
			model.addAttribute("loc", "/");
			model.addAttribute("result", false);
		}
		
		return "common/msg";
	}


	@RequestMapping("/deleteNotice.do")
	public String deleteNotice(Model model, int[] noticeNo) {
		int result = service.deleteNotice(noticeNo);
		if(result>0) {
			model.addAttribute("msg", "삭제 성공");
			model.addAttribute("result",true);
		}
		else {
			model.addAttribute("msg", "삭제 실패");
			model.addAttribute("result",false);
		}
		model.addAttribute("loc", "/notice/noticeList.do?reqPage=1");
		return "common/msg";
	}
}
