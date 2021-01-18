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

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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

	@RequestMapping("/updateNoticeFrm.do")
	public String noticeUpdateFrm(Model model, int noticeNo) {
		Notice n = service.selectNotice(noticeNo);
		model.addAttribute("n", n);
		System.out.println(n.toString());
		return "notice/noticeUpdateFrm";
	}
	
	@RequestMapping("/noticeFrm.do")
	public String noticeFrm() {
		return "notice/noticeFrm";
	}
	
	@ResponseBody
	@RequestMapping("/insertNotice.do")
	public String insertNotice(Notice n, MultipartFile[] files, HttpServletRequest request, Model model,String path1) {
		System.out.println(path1);
		String root = request.getSession().getServletContext().getRealPath("/");
		String path = root + "resources/upload/notice/";
		System.out.println(files);
		System.out.println("첨부파일 개수 > "+files.length);
		
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
			model.addAttribute("loc", "/notice/noticeList.do?reqPage=1");
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("msg", "공지사항 등록 실패\n관리자에게 문의하세요.");
			model.addAttribute("loc", "/notice/noticeList.do?reqPage=1");
		}

		return "common/msg";
	}


	@RequestMapping("/deleteNotice.do")
	public String deleteNotice(Model model, int[] noticeNo, HttpServletRequest request) {
		boolean delResult = false;
		for(int i=0; i<noticeNo.length; i++) {
			Notice n = service.selectNotice(noticeNo[i]);
			int result = service.deleteNotice(noticeNo[i]);
			if(result>0) {	//notice가 삭제되었으므로 파일도 삭제
				//해당 공지사항에 첨부파일이 있는 경우
				delResult = true;
				for(FileVO fv : n.getFileList()) {
					String root = request.getSession().getServletContext().getRealPath("/");
					String saveDirectory = root+"resources/upload/notice/";
					
					//지울 파일을 받아옴. 뒤에 반드시 Filepath를 붙여줘야 함
					File delFile = new File(saveDirectory+fv.getFilepath()); 
					delResult = delFile.delete();
				}
				
				if(delResult) {
					System.out.println("프로젝트 파일 삭제 성공");
					//파일이 있는지 조회
					int fileNum = service.selectFileNum(n.getNoticeNo());
					//첨부파일이 있을 시,
					if(fileNum!=0) {
						int result1 = service.deleteFile(n.getNoticeNo());
						System.out.println("result1값 >> "+result1);
						if(result1>0) {
							delResult = true;
							System.out.println("파일DB 삭제 성공");
						} else {
							delResult = false;
							System.out.println("파일DB 삭제 실패");
						}
					}
				} else {
					System.out.println("파일 삭제 실패");
				}
			}
		}
		
		if(delResult) {
			model.addAttribute("msg", "삭제 성공");
			model.addAttribute("result", "true");
		}
		else {
			model.addAttribute("msg", "삭제 실패");
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

	@RequestMapping("/updateNotice.do")
	public String updateNotice(Notice n, MultipartFile[] files, String[] delFileList, HttpServletRequest request, Model model) {
		//1. jsp에서 지울 파일들의 이름(filepath)과 추가한 파일들의 이름(MultipartFile[] files)을 받아온다.
		//2. 먼저 파일을 DB에서 지운다.
		//3. 2가 성공하면 지울 파일들의 이름과 현재 프로젝트에 있는 파일들의 이름을 비교하여 지운다.
		//4. 추가한 파일을 DB에 넣는다.
		//5. 4가 성공하면 파일을 프로젝트에 추가한다.
		

		String root = request.getSession().getServletContext().getRealPath("/");
		String saveDirectory = root+"resources/upload/notice/";

		
		//1. notice 수정
		int result = service.updateNotice(n);
		//2. 만약 delFileList가 있을 경우 파일을 DB에서 지운다.
		boolean delResult = true;
		int result1 = 1;
		if(delFileList != null) {
			result1 = service.deleteFilepath(n, delFileList);
		}
		
		
		//3. 지울 파일들의 이름과 현재 프로젝트에 있는 파일들의 이름을 비교하여 지운다.
		if(result1>0) {
			for(int i=0; i<delFileList.length; i++) {
				File delFile = new File(saveDirectory+delFileList[i]); 
				delResult = delFile.delete();
				if(delResult) {
					delResult = true;
					System.out.println("파일 삭제 성공");
				} else {
					delResult = false;
					System.out.println("파일 삭제 실패");
				}
			}
		}
		
		//4. 추가한 파일을 DB에 넣는다.
		int result2 = 1;
		if(delResult) {
			System.out.println("delResult속");
			//첨부파일이 없다면 for문 실행되지 않음
			for(MultipartFile file : files) {
				System.out.println("첨부파일 있음!");
				if(!file.isEmpty()) {
					System.out.println("isEmpty if문 속");
					//사용자가 올린 파일명
					String filename = file.getOriginalFilename();
					System.out.println("filename > "+filename);
					//파일 rename
					String filepath = new FileOverlap().rename(saveDirectory, filename);
					System.out.println("filename : "+filename);
					System.out.println("filepath : "+filepath);
					try {
						byte[] bytes = file.getBytes();
						File upFile = new File(saveDirectory+filepath);
						FileOutputStream fos = new FileOutputStream(upFile);
						BufferedOutputStream bos = new BufferedOutputStream(fos);
						bos.write(bytes);
						bos.close();
						FileVO fv = new FileVO();
						fv.setFilename(filename);
						fv.setFilepath(filepath);
						fv.setTableName("notice");
						fv.setTableNo(n.getNoticeNo());
						result2 = service.insertFile(fv);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}	//for문 끝
		}
		
		
		
		
		
		
		
		
		
		
		
		
		if(result2>0) {
			model.addAttribute("msg", "수정 성공");
			model.addAttribute("loc", "/notice/noticeView.do?noticeNo="+n.getNoticeNo());
			model.addAttribute("result", true);
		} else {
			model.addAttribute("msg", "수정 실패");
			model.addAttribute("loc", "/notice/noticeView.do?noticeNo="+n.getNoticeNo());
			model.addAttribute("result", false);
		}
		return "common/msg";
	}
}
