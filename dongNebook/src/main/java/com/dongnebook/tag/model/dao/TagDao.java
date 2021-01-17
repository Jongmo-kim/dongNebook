package com.dongnebook.tag.model.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
}
