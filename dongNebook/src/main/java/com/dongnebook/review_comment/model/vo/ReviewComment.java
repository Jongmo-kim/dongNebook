package com.dongnebook.review_comment.model.vo;

import java.util.ArrayList;

import com.dongnebook.review.model.vo.Review;
import com.dongnebook.review_co_comment.model.vo.ReviewCoComment;
import com.dongnebook.user.model.vo.User;

/**
 * @author 김종모
 *
 */
public class ReviewComment {
	private int reviewCommentNo;
	private User user;
	private Review review;
	private ArrayList<ReviewCoComment> reviewCoCommentList;
	private String content;
	public ReviewComment(int reviewCommentNo, User user, Review review, ArrayList<ReviewCoComment> reviewCoCommentList,
			String content) {
		super();
		this.reviewCommentNo = reviewCommentNo;
		this.user = user;
		this.review = review;
		this.reviewCoCommentList = reviewCoCommentList;
		this.content = content;
	}
	public ReviewComment() {
		super();
	}
	public int getReviewCommentNo() {
		return reviewCommentNo;
	}
	public void setReviewCommentNo(int reviewCommentNo) {
		this.reviewCommentNo = reviewCommentNo;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Review getReview() {
		return review;
	}
	public void setReview(Review review) {
		this.review = review;
	}
	public ArrayList<ReviewCoComment> getReviewCoCommentList() {
		return reviewCoCommentList;
	}
	public void setReviewCoCommentList(ArrayList<ReviewCoComment> reviewCoCommentList) {
		this.reviewCoCommentList = reviewCoCommentList;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "ReviewComment [reviewCommentNo=" + reviewCommentNo + ", user=" + user + ", review=" + review
				+ ", reviewCoCommentList=" + reviewCoCommentList + ", content=" + content + "]";
	}
	
	
}
