package com.dongnebook.rental.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
<<<<<<< HEAD
=======
import org.springframework.web.bind.annotation.RequestParam;
>>>>>>> develop/0.0.0
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongnebook.book.model.vo.Book;
import com.dongnebook.rental.model.service.RentalService;
import com.dongnebook.rental.model.vo.BookRental;
import com.dongnebook.rental.model.vo.BookRentalReserve;
<<<<<<< HEAD
=======
import com.dongnebook.rental.model.vo.RentalDate;
import com.dongnebook.rental.model.vo.RentalList;
>>>>>>> develop/0.0.0
import com.dongnebook.rental.model.vo.RentalLoc;
import com.dongnebook.user.model.vo.User;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;


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
//		
//		if(result>0) {
//			model.addAttribute("msg","등록 성공");
//		}else {
//			model.addAttribute("msg","등록 실패");
//		}
//		model.addAttribute("loc","/");
////	
		//여기서 대출 마지막 값을 뽑아서 대출정보에 넘긴다
		RentalLoc lastLoc=service.lastLoc();
		
		System.out.println(lastLoc.getRentalLocationNo());
		System.out.println(lastLoc.getPlaceName());
		System.out.println(lastLoc.getPhone());
		
		return "common/msg";
	}
<<<<<<< HEAD
	
	@RequestMapping("/bookRental.do")
	public String bookRental( Model model, int[] bookNo,HttpSession session) {
	   System.out.println("book : "+bookNo.length);
	   ArrayList<Book> list = new ArrayList<Book>();
	   if(bookNo.length>0) {
	      for(int i : bookNo) {
	         System.out.println(i);
	      }         
	      list = service.selectBooks(bookNo);
	      session.setAttribute("rentalList", list);
	   }      
	   return "book/bookRentalFrm";
	//	      return "rental/rental_loc";
=======
	//@ResponseBody
	@RequestMapping("/bookRental.do")
	public String bookRental( Model model, int[] bookNo,HttpSession session) {
		 System.out.println("book : "+bookNo.length);
		ArrayList<Book> list = new ArrayList<Book>();
		if(bookNo.length>0) {
			for(int i : bookNo) {
				System.out.println(i);
			}			
			list = service.selectBooks(bookNo);
			session.setAttribute("rentalList", list);
		}		
		return "book/bookRentalFrm";
//		return "rental/rental_loc";
>>>>>>> develop/0.0.0
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
}
