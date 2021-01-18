package com.dongnebook.tag.model.dao;


import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.review.model.vo.Review;
import com.dongnebook.tag.model.vo.Tag;

@Repository
public class TagDao {
	
	@Autowired
	private SqlSessionTemplate session;


	public int insertTag(Tag t) {
		int result = session.insert("tag.insertTag",t);
		if(result == 0) {
			return 0;
		}
		return t.getTagNo();
	}


	public ArrayList<Tag> selectTags(Review review) {
		List<Tag> list = session.selectList("tag.selectTags", review);
		return (ArrayList<Tag>)list;
	}


	public int deleteTagByReview(Review review) {
		return session.delete("tag.deleteTagByReview", review);
	}
	
}
