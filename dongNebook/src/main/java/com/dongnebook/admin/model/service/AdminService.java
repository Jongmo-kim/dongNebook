package com.dongnebook.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongnebook.admin.model.dao.AdminDao;
import com.dongnebook.admin.model.vo.Admin;
import com.dongnebook.book.model.vo.Book;
import com.dongnebook.book.model.vo.BookPageData;
import com.dongnebook.user.model.service.UserService;
import com.dongnebook.user.model.vo.User;
import com.dongnebook.user.model.vo.UserPageData;

@Service
public class AdminService {
	@Autowired
	private AdminDao dao;
	
	@Autowired
	private UserService userService;
	public Admin adminLogin(Admin admin) {
		return dao.adminLogin(admin);
	}

	public UserPageData userManageList(int reqPage) {
		int numPerPage = 10; 		//한페이지 당 게시물 수
		//게시물 10개 가져오기 -> start값, end값 계산
		//reqpage = 1 ->1~10
		//reqpage = 2 ->11~20
		
		int end = reqPage * numPerPage;
		int start= end-numPerPage+1;
		
		ArrayList<User> list = dao.selectUserList(start,end);
		
		
		//pageNavi 제작
		//총 게시물 수
		int totalCount = dao.totalCount();
		
		
		//총 페이지수
		int totalPage =0;
		if(totalCount%numPerPage==0) {
			totalPage=totalCount/numPerPage;
		}else {
			totalPage=totalCount/numPerPage+1;
		}
		
		//페이지 네비의 길이
		int pageNaviSize=5;
		//페이지 네비 시작번호
		int pageNo=((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		//페이지 네비 작성
		String pageNavi = "";
		//이전버튼 생성
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'><a class='btn page-link' href='/admin/manageUser.do?reqPage="+(pageNo-1)+"'>이전</a>";
				}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo!=reqPage) {
				
				pageNavi += "<li class='page-item'><a class='btn page-link' href='/admin/manageUser.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}else {
				pageNavi+="<li class='page-item'><span class='selectPage page-link'>"+pageNo+"</span>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		//총게시물 전까진  위의 포문 이후엔 페이지 넘버가 각 네비 끝에 와있기에  그것이 총게시물전이라면
		if(pageNo<=totalPage) {
			pageNavi +="<li class='page-item'><a class='btn page-link' href='/admin/manageUser.do?reqPage="+pageNo+"'>다음</a>";
		}
		UserPageData upd=new UserPageData(list,pageNavi);
		return upd;
	}

	public int deleteBooks(ArrayList<Integer> list) {
		return dao.deleteBooks(list);
	}

	public int selectBook(String string) {
		return dao.selectBook(string);
	}

	/**
	 * 김종모 수정
	 * @param reqPage
	 * @param inputStr
	 * @param searchKeyword
	 * @return
	 */
	public UserPageData userManageList(int reqPage, String inputStr, String searchKeyword) {
		int numPerPage = 10; 		//한페이지 당 게시물 수
		//게시물 10개 가져오기 -> start값, end값 계산
		//reqpage = 1 ->1~10
		//reqpage = 2 ->11~20
		
		ArrayList<User> list = userService.selectUserBySearch(reqPage, inputStr, searchKeyword);
		
		
		//pageNavi 제작
		//총 게시물 수
		int totalCount = userService.totalCount(inputStr,searchKeyword);
		
		
		//총 페이지수
		int totalPage =0;
		if(totalCount%numPerPage==0) {
			totalPage=totalCount/numPerPage;
		}else {
			totalPage=totalCount/numPerPage+1;
		}
		
		//페이지 네비의 길이
		int pageNaviSize=5;
		//페이지 네비 시작번호
		int pageNo=((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		//페이지 네비 작성
		String pageNavi = "";
		//이전버튼 생성
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'><a class='btn page-link' href='/admin/manageUser.do?reqPage="+(pageNo-1)+"&inputStr="+inputStr+"&searchKeyword="+searchKeyword+"'>이전</a>";
				}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo!=reqPage) {
				
				pageNavi += "<li class='page-item'><a class='btn page-link' href='/admin/manageUser.do?reqPage="+pageNo+"&inputStr="+inputStr+"&searchKeyword="+searchKeyword+"'>"+pageNo+"</a>";
			}else {
				pageNavi+="<li class='page-item'><span class='selectPage page-link'>"+pageNo+"</span>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		//총게시물 전까진  위의 포문 이후엔 페이지 넘버가 각 네비 끝에 와있기에  그것이 총게시물전이라면
		if(pageNo<=totalPage) {
			pageNavi +="<li class='page-item'><a class='btn page-link' href='/admin/manageUser.do?reqPage="+pageNo+"&inputStr="+inputStr+"&searchKeyword="+searchKeyword+"'>다음</a>";
		}
		UserPageData upd=new UserPageData(list,pageNavi);
		return upd;
	}
	
	//Start
}
