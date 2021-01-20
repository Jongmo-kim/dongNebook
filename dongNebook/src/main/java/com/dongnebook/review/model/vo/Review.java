package com.dongnebook.review.model.vo;

import java.util.ArrayList;

import com.dongnebook.review_co_comment.model.vo.ReviewCoComment;
import com.dongnebook.review_comment.model.vo.ReviewComment;
import com.dongnebook.user.model.vo.User;

/**
 * @author 김종모
 *
 */
public class Review {
	private int reviewNo;
	private User user;
	private ArrayList<ReviewComment> reviewCommentList;
	private String title;
	private String content;
	private float score;
	private int like;
	private int dislike;
	public Review(int reviewNo, User user, ArrayList<ReviewComment> reviewCommentList, String title, String content,
			float score, int like, int dislike) {
		super();
		this.reviewNo = reviewNo;
		this.user = user;
		this.reviewCommentList = reviewCommentList;
		this.title = title;
		this.content = content;
		this.score = score;
		this.like = like;
		this.dislike = dislike;
	}
	public Review() {
		super();
	}
	public Review(int currReview) {
		this.reviewNo = currReview;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public User getUser() {
		return user;
	}
	public int getUserNo() {
		return this.user.getUserNo();
	}
	public void setUser(User user) {
		this.user = user;
	}
	public void setUserNo(int userNo) {
		this.user = new User();
		this.user.setUserNo(userNo);
	}
	public ArrayList<ReviewComment> getReviewCommentList() {
		return reviewCommentList;
	}
	public void setReviewCommentList(ArrayList<ReviewComment> reviewCommentList) {
		this.reviewCommentList = reviewCommentList;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public int getDislike() {
		return dislike;
	}
	public void setDislike(int dislike) {
		this.dislike = dislike;
	}
	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", user=" + user + ", reviewCommentList=" + reviewCommentList
				+ ", title=" + title + ", content=" + content + ", score=" + score + ", like=" + like + ", dislike="
				+ dislike + "]";
	}
	
}
