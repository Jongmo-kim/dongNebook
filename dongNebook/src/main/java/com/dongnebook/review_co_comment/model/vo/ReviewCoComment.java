package com.dongnebook.review_co_comment.model.vo;

import com.dongnebook.review_comment.model.vo.ReviewComment;
import com.dongnebook.user.model.vo.User;

public class ReviewCoComment {
	private int reviewCoCommentNo;
	private User user;
	private ReviewCoComment reviewCoComent;
	private ReviewComment reviewComment;
	private String content;
	public ReviewCoComment() {
		super();
	}
	
	public ReviewCoComment(int reviewCoCommentNo, User user, ReviewCoComment reviewCoComent,
			ReviewComment reviewComment, String content) {
		super();
		this.reviewCoCommentNo = reviewCoCommentNo;
		this.user = user;
		this.reviewCoComent = reviewCoComent;
		this.reviewComment = reviewComment;
		this.content = content;
	}

	public int getReviewCoCommentNo() {
		return reviewCoCommentNo;
	}
	public void setReviewCoCommentNo(int reviewCoCommentNo) {
		this.reviewCoCommentNo = reviewCoCommentNo;
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
	public ReviewComment getReviewComment() {
		return reviewComment;
	}
	public void setReviewComment(ReviewComment reviewComment) {
		this.reviewComment = reviewComment;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public ReviewCoComment getReviewCoComent() {
		return reviewCoComent;
	}

	public void setReviewCoComent(ReviewCoComment reviewCoComent) {
		this.reviewCoComent = reviewCoComent;
	}
	@Override
	public String toString() {
		return "ReviewCoComment [reviewCoCommentNo=" + reviewCoCommentNo + ", user=" + user + ", reviewCoComent="
				+ reviewCoComent + ", reviewComment=" + reviewComment + ", content=" + content + "]";
	}


	
}
