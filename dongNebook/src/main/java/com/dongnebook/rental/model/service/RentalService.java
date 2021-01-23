package com.dongnebook.rental.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongnebook.book.model.vo.Book;
import com.dongnebook.notice.model.vo.NoticePageData;
import com.dongnebook.rental.model.dao.RentalDao;
import com.dongnebook.rental.model.vo.BookRental;
import com.dongnebook.rental.model.vo.BookRentalReserve;
import com.dongnebook.rental.model.vo.Rental;
import com.dongnebook.rental.model.vo.RentalLoc;
import com.dongnebook.user.model.vo.User;
import com.dongnebook.rental.model.vo.RentalPageData;

@Service
public class RentalService {
	
	@Autowired
	private RentalDao dao;

	public int insertLoc(RentalLoc loc) {
		return dao.insertLoc(loc);
	}

	public RentalLoc lastLoc() {
		return dao.lastLoc();
	}

	public int insertReserve(BookRentalReserve reserve) {
		return dao.insertReserve(reserve);
	}

	public ArrayList<Book> selectBooks(int[] bookNo) {
		return dao.selectBooks(bookNo);
	}

	public Book rBookList(int bookNo) {
		return dao.rBookList(bookNo);
	}

	public ArrayList<BookRental> rentalInfo(int userNo) {
		return dao.rentalInfo(userNo);
	}

	public int insertBookRental(ArrayList<BookRental> bRList) {
		return dao.insertBookRental(bRList);
	}

	public int updateCount(int[] bookNo) {
		return dao.updateCount(bookNo);
	}

	public ArrayList<BookRental> userRentalList(int userNo) {
		return dao.userRentalList(userNo);
	}
	public boolean isBookRentalLimitOver(User loginUser) {
		return dao.isBookRentalLimitOver(loginUser);
	}
	
	
	/**
	 * @author 진수경
	 *
	 */
	
	public RentalPageData selectRentalList(int userNo, int reqPage) {
		int numPerPage = 10;
		int end = numPerPage * reqPage;
		int start = (reqPage-1)*numPerPage + 1;
		
		//대출내역 불러오기
		ArrayList<Rental> list = dao.selectRentalList(userNo, start, end);
		
		int totalCount = dao.totalCount(userNo);
		System.out.println("총 게시물 수 "+totalCount);
		
		//총 페이지수
		int totalPage = 0;
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		} else {
			totalPage = totalCount/numPerPage+1;
		}
		
		//페이지네비 길이
		int pageNaviSize = 5;
		
		//페이지네비 시작번호
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		String pageNavi = "";
		if(pageNo!=1) {
			pageNavi += "<li class='page-item'><a class='btn page-link' href='/rentalList.do?reqPage="+(pageNo-1)+"&userNo="+userNo+"'>이전</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo!=reqPage) {
				pageNavi += "<li class='page-item'><a class='btn page-link' href='/rentalList.do?reqPage="+(pageNo)+"&userNo="+userNo+"'>"+pageNo+"</a>";
			}else {
				pageNavi += "<li class='page-item'><span class='selectPage page-link'>"+pageNo+"</span>";
			}
			pageNo++;

			//페이지 수가 총 페이지수보다 커지면 break
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo<=totalPage) {
			pageNavi += "<li class='page-item'><a class='btn page-link' href='/rentalList.do?reqPage="+(pageNo)+"&userNo="+userNo+"'>다음</a>";
		}
		RentalPageData rpd = new RentalPageData(list, pageNavi);
		return rpd;
	}
}
