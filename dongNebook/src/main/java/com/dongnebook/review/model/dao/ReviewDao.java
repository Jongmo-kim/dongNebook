package com.dongnebook.review.model.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.review.model.vo.Review;
import com.dongnebook.review.model.vo.ReviewException;
import com.dongnebook.user.model.service.UserService;
import com.dongnebook.user.model.vo.User;

/**
 * @author 김종모
 *
 */
@Repository
public class ReviewDao {
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private UserService userService;
	
	public ArrayList<Review> selectAllReview() {
		List<Review> list= session.selectList("review.selectAllReview");
		List<HashMap<String, Object>> FKList = session.selectList("review.selectAllReviewFK");
		ArrayList<Review> returnList = combineList(list,FKList);
		return returnList;
	}

	private ArrayList<Review> combineList(List<Review> list, List<HashMap<String, Object>> FKList) {
		int idx = 0 ;
		for(Review r : list) {
			int userNo = ((BigDecimal)FKList.get(idx++).get("USER_NO")).intValue();
			User u = new User();
			u.setUserNo(userNo);
			r.setUser(userService.selectOneUser(u));
		}
		return (ArrayList<Review>)list;
	}

	public int insertReview(Review review) throws ReviewException{
		int reviewNo = session.insert("review.insertReview",review);
		if(reviewNo == 0 )
			throw new ReviewException("게시물 등록이 제대로 되지 않았습니다.");
		
		return review.getReviewNo();
	}

	public Review selectOneReview(Review review) {
		 Review r = session.selectOne("review.selectOneReview", review);
		 User user = userService.selectOneUser(r.getUser());
		 r.setUser(user);
		 return r;
	}

	public int updateReview(Review review) throws ReviewException{
		int result = session.update("review.updateReview", review);
		if(result == 0 )
			throw new ReviewException("게시물 수정이 제대로 되지 않았습니다.");
		
		return result;
	}
}
