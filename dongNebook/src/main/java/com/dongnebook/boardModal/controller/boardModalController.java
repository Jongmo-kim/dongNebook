package com.dongnebook.boardModal.controller;

import java.util.ArrayList;
import java.util.Map;
import java.util.Random;

import javax.annotation.PostConstruct;

import org.apache.commons.lang3.tuple.Pair;
import org.apache.tomcat.jni.Thread;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongnebook.book.model.service.BookService;
import com.dongnebook.book.model.vo.Book;
import com.dongnebook.review.model.service.ReviewService;
import com.dongnebook.review.model.vo.Review;
import com.dongnebook.tag.model.service.TagService;
import com.dongnebook.tag.model.vo.Tag;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class boardModalController {
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private TagService tagService;
	
	@Autowired
	private BookService bookService;
	
	
	
	@ResponseBody
	@RequestMapping("/boardModal.do")
	public JsonObject boardModal(@RequestParam Map<String, Object> param) {
		JsonObject obj = new JsonObject();
		int currReview = Integer.parseInt((String)param.get("currReview"));
		int maxReview = reviewService.selectReviewCount();
		String addBody = "";
		System.out.println(currReview);
		Review r = reviewService.selectReviewForModal(currReview+1);
		System.out.println(r == null);
		if( r == null) {
			addBody = 
					" <div class=\"boardBody\">\r\n"
					+ "            <div class=\"boardHeader\">\r\n"
					+ "보여드릴 리뷰가 더이상 없습니다. "
					+ "            </div>\r\n"
					+ "        </div>";
					
			
		} else {
			ArrayList<Tag> tags = tagService.selectTags(r);
			ArrayList<Book> books = new ArrayList<Book>();
			for(Tag t : tags) {
				Book b = new Book();
				b.setBookNo(t.getBookNo());
				books.addAll(bookService.selectBook(b));
			}
			
			addBody = " <div class=\"boardBody\">\r\n"
					+ "            <div class=\"boardHeader\">\r\n"
					+ "                <p>김종모님</p>\r\n"
					+ "                <img src=\"../image/test/male-face-12.svg\" />\r\n"
					+ "                \r\n"
					+ "                \r\n"
					+ "            </div>\r\n"
					+ "            <div class=\"boardContent\">\r\n"
					+ addImageTagByText(tags,books)
					+ "                <div class=\"textContent\">\r\n"
					+ "                    <p>"+r.getContent()+"</p>\r\n"
					+ "                </div>\r\n"
					+ "            </div>\r\n"
					+ "            <div class=\"boardFooter\">\r\n"
					+ "                <div class=\"tagContent\">\r\n"
					+ addATagByText(tags,books)
					+ "                </div>\r\n"
					+ "            </div>\r\n"
					+ "        </div>";
			}
		obj.addProperty("addBody", addBody);
		obj.addProperty("maxReview", maxReview);
		return obj;
	}

	private String addATagByText(ArrayList<Tag> tags, ArrayList<Book> books) {
		int count = 0;
		String str = "";
		for(Tag t : tags) {
			Book b = books.get(count++);
			str += "                    <a href=\"#\">#"+b.getBookName()+"</a>\r\n";
		}
		return str;
	}

	private String addImageTagByText(ArrayList<Tag> tags, ArrayList<Book> books) {
		String str ="                <div class=\"imageContent\">\r\n";
		int count = 0;
		for(Tag t : tags) {
			Book b = books.get(count++);
			str +="<img src=\""+b.getImageurl().replaceAll("coversum","cover500")+"\" alt=\"book\">\r\n";
		}
		str += "                </div>\r\n";
		return str;
	}
	
}
