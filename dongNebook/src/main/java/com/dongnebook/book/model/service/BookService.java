package com.dongnebook.book.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dongnebook.book.model.dao.BookDao;
import com.dongnebook.book.model.vo.Book;
import com.dongnebook.book.model.vo.BookPageData;
import com.dongnebook.proposal.model.vo.ProposalPageData;
import com.dongnebook.proposal.model.vo.ProposalVO;
import com.dongnebook.rental.model.vo.BookRental;


/**
 * @author 김종모
 *
 */
@Service
public class BookService {
	
	@Autowired
	private BookDao dao;
	
	public int insertBook(Book b) {
		return dao.insertBook(b);
	}

	public BookPageData searchBookList(int reqPage) {
		int numPerPage = 10; 		//한페이지 당 게시물 수
		//게시물 10개 가져오기 -> start값, end값 계산
		//reqpage = 1 ->1~10
		//reqpage = 2 ->11~20
		
		int end = reqPage * numPerPage;
		int start= end-numPerPage+1;
		
		ArrayList<Book> list = dao.selectBookList(start,end);
		
		System.out.println(list.get(0).getBookName());
		//pageNavi 제작
		//총 게시물 수
		int totalCount = dao.totalCount();
		
		System.out.println(totalCount);
		
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
			pageNavi += "<li class='page-item'><a class='btn page-link' href='/book/bookList.do?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo!=reqPage) {
				
				pageNavi += "<li class='page-item'><a class='btn page-link' href='/book/bookList.do?reqPage="
						+ pageNo + "'>" + pageNo + "</a>";
			}else {
				pageNavi+="<li class='page-item'><span class='selectPage page-link'>" + pageNo + "</span>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		//총게시물 전까진  위의 포문 이후엔 페이지 넘버가 각 네비 끝에 와있기에  그것이 총게시물전이라면
		if(pageNo<=totalPage) {
			pageNavi +="<li class='page-item'><a class='btn page-link' href='/book/bookList.do?reqPage="
					+ (pageNo) + "'>다음</a>";
		}
		BookPageData npd=new BookPageData(list,pageNavi);
		return npd;
	}

	public int bookDelete(int bookNo) {
		
		return dao.bookDelete(bookNo);
	}
	public ArrayList<Book> selectBookByKeyword(String inputStr, String searchKeyword) {
		return dao.selectBookByKeyword(inputStr, searchKeyword);
	}

	public ArrayList<Book> selectBookByKeyword(String inputStr, String searchKeyword, int reqPage) {
		return dao.selectBookByKeyword(inputStr, searchKeyword,reqPage);
	}

	public int updateBook(Book b) {
		
		return dao.updateBook(b);
	}

	public ArrayList<String> selectBookMarkList(int userNo) {
		return dao.selectBookMarkList(userNo);
	}

	public Book selectOneBook(int bookNo) {
		return dao.selectOneBook(bookNo);
	}

	public String aladinPage(int totalCount, int reqPage) {
		int numPerPage = 10; 		//한페이지 당 게시물 수
		//게시물 10개 가져오기 -> start값, end값 계산
		//reqpage = 1 ->1~10
		//reqpage = 2 ->11~20
		
		int end = reqPage * numPerPage;
		int start= end-numPerPage+1;
		
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
			pageNavi += "<li class='page-item'><a class='btn page-link' onclick=bookSearch("+(pageNo-1)+")>이전</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo==reqPage) {
				pageNavi += "<li class='page-item'><span class='selectPage page-link'>"+pageNo+"</span>";
			}else {
				pageNavi+="<li class='page-item'><a class='btn page-link' onclick=bookSearch("+(pageNo)+")>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		//총게시물 전까진  위의 포문 이후엔 페이지 넘버가 각 네비 끝에 와있기에  그것이 총게시물전이라면
		if(pageNo<=totalPage) {
			pageNavi +="<li class='page-item'><a class='btn page-link' onclick=bookSearch("+(pageNo)+")>다음</a>";
			
		}
		
		return pageNavi;
	}

	public ArrayList<Book> newBook() {
		return dao.newBook();
	}

	public Book selectOneBook(String isbn) {
		
		return dao.selectOneBook(isbn);
	}

	public int updateCntBook(Book book) {
		return dao.updateCntBook(book);
	}

	public ArrayList<Book> selectAllBook() {
		return dao.selectAllBook();
	}
	public ArrayList<Book> selectBook(Book b) {
		return dao.selectBook(b);
	}

	public Object selectSearchBookNavi(String inputStr, String searchKeyword,int reqPage) {
		int totalCount = dao.totalCount(inputStr,searchKeyword);
		int numPerPage = 10;
		int totalPage = 0;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}

		int pageNaviSize = 5;
		String pageNavi = "";

		int pageNo = reqPage - 2;
		if (reqPage <= 3) {
			pageNo = 1;
		}else if(reqPage >= totalPage){
			pageNo = totalPage-3;
		}else if (pageNo > totalPage - 4) {
			pageNo = totalPage - 4;
		}
		
		if (pageNo != 1) {
			pageNavi += "<li class='page-item'><a class='btn page-link' href='/book/searchBook.do?"
					+ (pageNo - 1) + "&searchKeyword=" + searchKeyword +"&inputStr="+inputStr+"'>이전</a>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<li class='page-item'><span class='selectPage page-link'>" + pageNo + "</span>";
			} else {
				pageNavi += "<li class='page-item'><a class='btn page-link' href='/book/searchBook.do?reqPage="
						+ pageNo + "&searchKeyword=" + searchKeyword +"&inputStr="+inputStr+"'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		if (pageNo <= totalPage) {
			pageNavi += "<li class='page-item'><a class='btn page-link' href='/book/searchBook.do?reqPage="
					+ (pageNo) + "&searchKeyword=" + searchKeyword +"&inputStr="+inputStr+ "'>다음</a>";
		}
		return pageNavi;
	}

	public ArrayList<BookRental> selectIsRental(int bookNo) {
		return dao.selectIsRental(bookNo);
	}

	public int deleteBooks(String[] books) {
		return dao.deleteBooks(books);
	}

	/**
	 * @author 진수경
	 *
	 
	public int returnBooks(String[] books) {
		return dao.returnBooks(books);
	}
*/
	public ArrayList<Integer> selectBookNo(String[] books) {
		return dao.selectBookNo(books);
	}

	public int updateIsRental(int userNo, ArrayList<Integer> no) {
		return dao.updateIsRental(userNo, no);
	}

}
