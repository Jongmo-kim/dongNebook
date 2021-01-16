package com.dongnebook.review.model.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongnebook.review.model.dao.ReviewDao;
import com.dongnebook.review.model.vo.Review;


/**
 * @author 김종모
 *
 */
@Service
public class ReviewService {
	@Autowired
	private ReviewDao dao;
	
	public ArrayList<Review> selectAllReview(){
		return dao.selectAllReview();
	}
}
