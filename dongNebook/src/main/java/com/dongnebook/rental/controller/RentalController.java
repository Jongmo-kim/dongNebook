package com.dongnebook.rental.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongnebook.book.model.vo.Book;
import com.dongnebook.rental.model.service.RentalService;
import com.dongnebook.rental.model.vo.BookRental;
import com.dongnebook.rental.model.vo.BookRentalReserve;
import com.dongnebook.rental.model.vo.RentalList;
import com.dongnebook.rental.model.vo.RentalLoc;

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
	@RequestMapping("/bookRental.do")
	public String bookRental( Model model, int[] bookNo,HttpSession session) {
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
	}
	@RequestMapping("/insertReserve.do")
	public String insertReserve(Model model, int bookNo, int userNo) {
		BookRentalReserve reserve = new BookRentalReserve();
		reserve.setBookNo(bookNo);
		reserve.setUserNo(userNo);
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
	public ArrayList<Book> rentalInfo(Model model,int userNo) {
		System.out.println(userNo);
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
