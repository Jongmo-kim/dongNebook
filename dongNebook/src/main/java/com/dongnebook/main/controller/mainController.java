package com.dongnebook.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dongnebook.main.model.service.mainService;

@RequestMapping("/main")
public class mainController {
	@Autowired
	private mainService service;
	
}
