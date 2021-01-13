package com.dongnebook.main.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongnebook.main.model.dao.mainDao;

@Service
public class mainService {
	@Autowired
	private mainDao dao;
}
