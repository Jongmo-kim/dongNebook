package com.dongnebook.notice.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongnebook.notice.model.dao.NoticeDao;
import com.dongnebook.notice.model.vo.FileVO;
import com.dongnebook.notice.model.vo.Notice;
import com.dongnebook.notice.model.vo.NoticePageData;

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

	public NoticePageData selectNoticeList(int reqPage) {
		//한 페이지당 게시글 수 10개
		int numPerPage = 10;
		
		//1~10, 11~20, 21~30
		int end = numPerPage * reqPage;
		int start = (reqPage-1)*numPerPage + 1;
		
		ArrayList<Notice> list = dao.selectNoticeList(start, end);
		
		//총 게시물 수
		int totalCount = dao.totalCount();
		//총 페이지 수
		int totalPage = 0;
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		} else {
			totalPage = totalCount/numPerPage+1;
		}
		
		//페이지네비 길이
		int pageNaviSize = 5;
		//페이지네비 시작번호
		//1~5, 6~10, 11~15, 16~20
		//reqPage = 1 / 0*5+1 = 1
		//reqPage = 2 / 1*5+1 = 6
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		//페이지네비 html 태그 작성
		String pageNavi = "";
		if(pageNo!=1) {
			pageNavi += "<a href='/notice/noticeList.do?reqPage="+(reqPage-1)+"'>[이전]</a>";
		}
		
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo!=reqPage) {
				pageNavi += "<a href='/notice/noticeList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}else {
				pageNavi+="<span class='selectedPage'>"+pageNo+"</span>";
			}
			pageNo++;
			
			//페이지 수가 총 페이지수보다 커지면 break
			if(pageNo>totalPage) {
				break;
			}
		}
		//페이시 수가 총 페이지 수보다 같거나 작다면 -> 다음페이지가 있다는 뜻
		if(pageNo<=totalPage) {
			pageNavi +="<a href='/book/bookList.do?reqPage="+pageNo+"'>[다음]</a>";
		}
		NoticePageData npd = new NoticePageData(list, pageNavi);
		return npd;
	}

	public int deleteNotice(int[] noticeNo) {
		int result = dao.deleteNotice(noticeNo);
		return result;
	}

	public int insertNotice(Notice n) {
//		int result = dao.insertBoard(n);
//		if(result>0) {
//			int noticeNo = dao.selectNoticeNo();
//			//첨부파일이 없으면 list 길이는 0이라서 for문 동작 안함
//			for(FileVO fv : n.getFileList()) {	
//				result = dao.insertFile(noticeNo, fv.getFilename(), fv.getFilepath());
//			}
//		}
		return 0;
	}
}
