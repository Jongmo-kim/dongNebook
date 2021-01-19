package com.dongnebook.review.model.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dongnebook.review.model.dao.ReviewDao;
import com.dongnebook.review.model.vo.Review;
import com.dongnebook.review.model.vo.ReviewException;
import com.dongnebook.tag.model.service.TagService;
import com.dongnebook.tag.model.vo.TagException;


/**
 * @author 김종모
 *
 */
@Service
public class ReviewService {
	@Autowired
	private ReviewDao dao;
	
	@Autowired
	private TagService tagService;
	
	public ArrayList<Review> selectAllReview(){
		return dao.selectAllReview();
	}

	@Transactional
	public int insertReview(Review review,String[] tags) {
		int result = 1;
		
		try {
			int reviewNo = dao.insertReview(review);
			review.setReviewNo(reviewNo);
			tagService.insertTagByStr(review,tags);
		} catch(ReviewException e) {
			System.out.println(e.getMessage());
			result = 0;
		} catch(TagException e) {
			System.out.println(e.getMessage());
			result = 0;
		}
		
		return result;
	}

	public Review selectOneReview(Review review) {
		return dao.selectOneReview(review);
	}
	@Transactional
	public int updateReview(Review review, String[] tags) {
		int result = 1;
		try {
			dao.updateReview(review);
			tagService.deleteTagByReview(review);
			tagService.insertTagByStr(review,tags);
		} catch(ReviewException e) {
			System.out.println(e.getMessage());
			result = 0;
		} catch(TagException e) {
			System.out.println(e.getMessage());
			result = 0;
		}
		return result;
	}
	
	@Transactional
	public int deleteReview(Review review) {
		int result = 1;
		try {
			dao.deleteReview(review);
			tagService.deleteTagByReview(review);
		} catch(ReviewException e) {
			System.out.println(e.getMessage());
			result = 0;
		} catch(TagException e) {
			System.out.println(e.getMessage());
			result = 0;
		}
		return result;
	}

	public Object selectReviewByReqpage(int reqPage) {
		return dao.selectReviewByReqpage(reqPage);
	}

	public Review selectReviewForModal(int currReview) {
		return dao.selectReviewForModal(currReview);
	}

	public int selectReviewCount() {
		return dao.selectReviewCount();
	}
}
