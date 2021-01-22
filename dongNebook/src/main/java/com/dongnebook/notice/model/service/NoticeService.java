package com.dongnebook.notice.model.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dongnebook.common.FileVO;
import com.dongnebook.notice.model.dao.NoticeDao;
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
		return dao.noticeList();
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
			//pageNavi += "<a class='previous' href='/notice/noticeList.do?reqPage="+(reqPage-1)+"'>[이전]</a>";
			pageNavi += "<li class='page-item'><a class='btn page-link' href='/notice/noticeList.do?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo!=reqPage) {
				//pageNavi += "<a class='page' href='/notice/noticeList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
				pageNavi += "<li class='page-item'><a class='btn page-link' href='/notice/noticeList.do?reqPage="+(pageNo)+"'>"+pageNo+"</a>";
			}else {
				//pageNavi+="<span class='selectedPage'>"+pageNo+"</span>";
				//pageNavi+="<span class='page selectedPage'>"+pageNo+"</span>";
				pageNavi += "<li class='page-item'><span class='selectPage page-link'>"+pageNo+"</span>";
			}
			pageNo++;

			//페이지 수가 총 페이지수보다 커지면 break
			if(pageNo>totalPage) {
				break;
			}
		}
		//페이시 수가 총 페이지 수보다 같거나 작다면 -> 다음페이지가 있다는 뜻
		if(pageNo<=totalPage) {
			//pageNavi +="<a class='next' href='/notice/noticeList.do?reqPage="+pageNo+"'>[다음]</a>";
			pageNavi += "<li class='page-item'><a class='btn page-link' href='/notice/noticeList.do?reqPage="+(pageNo)+"'>다음</a>";
		}
		NoticePageData npd = new NoticePageData(list, pageNavi);
		return npd;
	}

	@Transactional
	public int deleteNotice(int noticeNo) {
		return dao.deleteNotice(noticeNo);
	}

	@Transactional
	public int insertNotice(Notice n) {
		int result = dao.insertNotice(n);
		if(result>0) {
			int noticeNo = dao.selectNoticeNo();
			for(FileVO fv : n.getFileList()) {	
				fv.setTableNo(noticeNo);
				result = dao.insertFile(fv);
				if(result<0) {
					return -1;
				}
			}
		}
		return result;
	}

	public int insertFile(FileVO fv) {
		return dao.insertFile(fv);
	}
	
	public Notice selectNotice(int noticeNo) {
		Notice n = dao.selectNotice(noticeNo);
		ArrayList<FileVO> list = dao.selectFile(noticeNo);
		n.setFileList(list);
		return n;
	}
	
	public int updateNotice(Notice n) {
		return dao.updateNotice(n);
	}

	public int deleteFile(int noticeNo) {
		return dao.deleteFile(noticeNo);
	}

	@Transactional
	public int deleteFilepath(Notice n, String[] delFileList) {
		if(delFileList.length!=0) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("tableNo", n.getNoticeNo());
			map.put("delFileList", delFileList);
			int result = dao.deleteFilepath(map);
			if(delFileList.length==result) {
				return result;
			} else {
				return 0;
			}
		}
		return 0;
	}

	public int selectFileNum(int noticeNo) {
		return dao.selectFileNum(noticeNo);
	}
}
