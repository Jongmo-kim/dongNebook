package com.dongnebook.rental.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongnebook.book.model.vo.Book;
import com.dongnebook.rental.model.service.RentalService;
import com.dongnebook.rental.model.vo.BookRental;
import com.dongnebook.rental.model.vo.BookRentalReserve;
import com.dongnebook.rental.model.vo.RentalDate;
import com.dongnebook.rental.model.vo.RentalLoc;
import com.dongnebook.rental.model.vo.RentalPageData;
import com.dongnebook.user.model.vo.User;


@Controller
public class RentalController {

	@Autowired
	private RentalService service;
	
	//Start
	
	@RequestMapping("/insertLoc.do")	
	public String insertLoc(Model model,RentalLoc loc) {
		System.out.println(loc.getPlaceName());
		System.out.println(loc.getAddr());
		System.out.println(loc.getPhone());
		int result = service.insertLoc(loc);
		
		if(result>0) {
			model.addAttribute("msg","등록 성공");
		}else {
			model.addAttribute("msg","등록 실패");
		}
//		model.addAttribute("loc","/");
//		여기서 대출 마지막 값을 뽑아서 대출정보에 넘긴다
		RentalLoc lastLoc=service.lastLoc();
		
		System.out.println(lastLoc.getRentalLocationNo());
		System.out.println(lastLoc.getPlaceName());
		System.out.println(lastLoc.getPhone());
		
		return "common/msg";
	}
	@RequestMapping("/bookRental.do")
	public String bookRental( Model model, int[] bookNo,HttpSession session, HttpServletRequest request) {
	   System.out.println("book : "+bookNo.length);
	   ArrayList<Book> list = new ArrayList<Book>();
	   String referer = request.getHeader("Referer");
	   if(bookNo.length>0) {
	      for(int i : bookNo) {
	         System.out.println("넘어온 책 ["+i+"]번: "+bookNo);
	      }         
	      list = service.selectBooks(bookNo);
	      for(int i=0; i<bookNo.length; i++) {
	    	  if(list.get(i).getBookCount()<0) {
	    		  model.addAttribute("msg", list.get(i).getBookName()+"은 현재 대출불가 상태입니다.");
	    		  System.out.println(list.get(i).getBookName()+"은 현재 대출불가 상태입니다.");
	    		  return "redirect:"+referer;
	    	  }
		  }
	      System.out.println("테스트카운트:"+list.get(0).getBookCount());
	      session.setAttribute("rentalList", list);
	   }      
	   return "book/bookRentalFrm";
	//	      return "rental/rental_loc";
	}
	
//	@RequestMapping("/bookRental.do")
//	public String bookRental( Model model, int[] bookNo,HttpSession session) {
//		ArrayList<Book> list = new ArrayList<Book>();
//		if(bookNo.length>0) {
//			for(int i : bookNo) {
//				System.out.println(i);
//			}			
//			list = service.selectBooks(bookNo);
//			session.setAttribute("rentalList", list);
//		}		
//		return "book/bookRentalFrm";
////		return "rental/rental_loc";
//	}
	
	@RequestMapping("/insertReserve.do")
	public String insertReserve(Model model, int bookNo, HttpSession session) {
		BookRentalReserve reserve = new BookRentalReserve();
		User loginUser = (User)session.getAttribute("loginUser");
		reserve.setBookNo(bookNo);
		reserve.setUserNo(loginUser.getUserNo());
		int result = service.insertReserve(reserve);
		if(result>0) {
			model.addAttribute("msg","예약 성공");
			model.addAttribute("result", "true");
		}else {
			model.addAttribute("msg","예약 실패");
		}
		model.addAttribute("loc","/");
		return "common/msg";
	}
	@RequestMapping("/rentalLoc.do")
	public String rentalLoc() {
		return "rental/rental_loc";
	}
	@RequestMapping("/mergeLoc.do")
	public String mergeLoc(Model model,RentalLoc loc) {
		model.addAttribute("rentalLoc", loc);
		return "book/bookRentalFrm";
	}
	@ResponseBody
	@RequestMapping("/rentalInfo.do")
	public ArrayList<RentalDate> rentalInfo(Model model,int userNo) {
		System.out.println(userNo);
		ArrayList<BookRental> rental= service.rentalInfo(userNo);
		ArrayList<RentalDate> rDate= new ArrayList<RentalDate>();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
		for(int i=0;i<rental.size();i++) {
			rDate.add(new RentalDate());
			rDate.get(i).setEnrollDate(simpleDateFormat.format(rental.get(i).getEnrollDate()));
			rDate.get(i).setReturnDate(simpleDateFormat.format(rental.get(i).getReturnDate()));
		}
		return rDate;
	}
	@ResponseBody
	@RequestMapping("/rentalBookName.do")
	public ArrayList<Book> rentalBookName(int userNo){
		ArrayList<BookRental> rental= service.rentalInfo(userNo);
		ArrayList<Book> book=new ArrayList<Book>();
		System.out.println("사이즈"+rental.size());
		for(int i=0;i<rental.size();i++) {
			Book b = service.rBookList(rental.get(i).getBookNo());
			book.add(b);
		}
		System.out.println("북 사이즈:"+book.size());
		return book;
	}
	@RequestMapping("/insertBookRental.do")
	public String insertBookRental(Model model, String placeName, String addr, String phone, HttpSession session, int[] bookNo) {
		
		RentalLoc rLoc = new RentalLoc();
        BookRental bRental = null;
        ArrayList<BookRental> bRList = new ArrayList<BookRental>();
        rLoc.setPlaceName(placeName);
        rLoc.setAddr(addr);
        rLoc.setPhone(phone);
        User loginUser = (User)session.getAttribute("loginUser");
        int userNo = loginUser.getUserNo();
        int resultLoc = service.insertLoc(rLoc); 
        if(resultLoc>0) {
            model.addAttribute("msg","대출장소 등록 성공");
        }else {
            model.addAttribute("msg","대출장소 등록 실패");
        }
        RentalLoc lastLoc = service.lastLoc();
        System.out.println(bookNo);
        for(int i : bookNo) {
            //이 부분은 대출했을때 책 수를 차감하기 위함!
            bRental = new BookRental();
            bRental.setUserNo(userNo);
            bRental.setBookNo(i);
            bRental.setRentalLocationNo(lastLoc.getRentalLocationNo());
            bRList.add(bRental);
        }
        boolean isBookRentalLimitOver = service.isBookRentalLimitOver(loginUser);

        if(!isBookRentalLimitOver) {
            int BookRental = service.insertBookRental(bRList);
            if(BookRental>0) {
                //book테이블에 bookCount와 rCount 가감작업
                int bookUpdateCount = service.updateCount(bookNo);
                if(bookUpdateCount>0) {
                    model.addAttribute("msg","대출 성공");
                    model.addAttribute("result", "true");
                }
            }else {
                model.addAttribute("msg","대출 실패");
            }
        } else {
            model.addAttribute("msg","대출 실패");
            model.addAttribute("subMsg","대출한도 3권을 초과하셔서 실패하였습니다.");
        }
        model.addAttribute("loc","/");
        return "common/msg";
	}
	
	/**
	 * @author 진수경
	 *
	 */
	@RequestMapping("/rentalList.do")
	public String rentalList(int userNo, int reqPage, Model model) {
		RentalPageData rpd = service.selectRentalList(userNo, reqPage);
		model.addAttribute("list", rpd.getList());
		model.addAttribute("pageNavi", rpd.getPageNavi());
		return "user/rentalList";
	}
}
