package com.dongnebook.tag.model.vo;

import com.dongnebook.book.model.vo.Book;
import com.dongnebook.review.model.vo.Review;

public class Tag {
	private int tagNo;
	private Review review;
	private Book book;
	public Tag(int tagNo, Review review, Book book) {
		super();
		this.tagNo = tagNo;
		this.review = review;
		this.book = book;
	}
	public Tag() {
		super();
	}
	public int getTagNo() {
		return tagNo;
	}
	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}
	public Review getReview() {
		return review;
	}
	public void setReviewNo(int reviewNo) {
		this.review = new Review();
		review.setReviewNo(reviewNo);
	}
	public int getReviewNo() {
		return this.review.getReviewNo();
	}
	public void setReview(Review review) {
		this.review = review;
	}
	public Book getBook() {
		return book;
	}
	public int getBookNo() {
		return this.book.getBookNo();
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public void setBookNo(int bookNo) {
		this.book = new Book();
		this.book.setBookNo(bookNo);
		
	}
	@Override
	public String toString() {
		return "Tag [tagNo=" + tagNo + ", review=" + review + ", book=" + book + "]";
	}
	
}
