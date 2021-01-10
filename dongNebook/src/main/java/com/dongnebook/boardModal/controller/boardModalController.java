package com.dongnebook.boardModal.controller;

import java.util.Random;

import org.apache.tomcat.jni.Thread;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongnebook.book.model.service.BookService;
import com.dongnebook.book.model.vo.Book;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class boardModalController {
	@Autowired
	private BookService service;
	
	Random rand = new Random();
	
	@ResponseBody
	@RequestMapping("/boardModal.do")
	public JsonObject boardModal() {
		JsonObject obj = new JsonObject();
		Book b = service.selectBookByKeyword("1", "전체",1).get(rand.nextInt(10));
		String addBody = " <div class=\"boardBody\">\r\n"
				+ "            <div class=\"boardHeader\">\r\n"
				+ "                <p>김종모님</p>\r\n"
				+ "                <img src=\"../image/test/male-face-12.svg\" />\r\n"
				+ "                \r\n"
				+ "                \r\n"
				+ "            </div>\r\n"
				+ "            <div class=\"boardContent\">\r\n"
				+ "                <div class=\"imageContent\">\r\n"
				+ "                    <img src=\""+b.getImageurl().replaceAll("coversum","cover500")+"\" alt=\"book\">\r\n"
				+ "                </div>\r\n"
				+ "                <div class=\"textContent\">\r\n"
				+ "                    <p>"+b.getBookIntroduce()+"</p>\r\n"
				+ "                </div>\r\n"
				+ "            </div>\r\n"
				+ "            <div class=\"boardFooter\">\r\n"
				+ "                <div class=\"tagContent\">\r\n"
				+ "                    <a href=\"#\">#"+b.getBookName()+"</a>\r\n"
				+ "                </div>\r\n"
				+ "            </div>\r\n"
				+ "        </div>";
		obj.addProperty("addBody", addBody);
		return obj;
	}
}
