package com.dongnebook.notice.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
		System.out.println(n.toString());
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
					f.setTableName("notice");
					fileList.add(f);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}	//for문 끝
		n.setFileList(fileList);
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
	
	@RequestMapping("/noticeView.do")
	public String noticeView(Model model, int noticeNo) {
		Notice n = service.selectNotice(noticeNo);
		model.addAttribute("n", n);
		return "notice/noticeView";
	}
	
	@RequestMapping("/noticeDownload.do")
    public void NoticeDownload(String filename, String filepath, int noticeNo, HttpServletRequest request, HttpServletResponse response) {
       String path = request.getSession().getServletContext().getRealPath("/") + "resources/upload/notice/";
        
        FileInputStream fis;
        try {
           fis = new FileInputStream(path+filepath);
           BufferedInputStream bis = new BufferedInputStream(fis);
           
           ServletOutputStream sos;
           try {
              sos = response.getOutputStream();
              BufferedOutputStream bos = new BufferedOutputStream(sos);
              
              String resFilename = "";
              
              boolean bool = request.getHeader("user-agent").indexOf("MSIE") != -1 || request.getHeader("user-agent").indexOf("Trident") != -1;
              System.out.println(bool);
              if(bool) {//사용자의 브라우저가 IE인 경우
                 resFilename = URLEncoder.encode(filename,"UTF-8");
                 resFilename = resFilename.replace("\\\\", "%20");
              }else {// 그 외 브라우저인 경우
                 resFilename = new String(filename.getBytes("UTF-8"),"ISO-8859-1");
              }
              
              response.setContentType("application/octet-stream");//파일받으면된다는 응답이 온것
              response.setHeader("Content-Disposition", "attachment;filename="+resFilename);//resFilename : 파일 다운로드받을때의 파일명
              //파일 전송
              int read = -1;
              while((read=bis.read())!=-1) {
                 bos.write(read);
              }
              bos.close();
              bis.close();
           } catch (IOException e) {
              // TODO Auto-generated catch block
              e.printStackTrace();
           }
           
        } catch (FileNotFoundException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
        }
        
        //return "redirect:/noticeView.do?noticeNo="+noticeNo;
    }
}
