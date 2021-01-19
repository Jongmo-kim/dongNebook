package com.dongnebook.rank.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.book.model.vo.Book;

@Repository
public class RankDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	public ArrayList<Book> selectRankList(int start, int end) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		List<Book> list = sqlSession.selectList("rank.selectRankList",map);
		
		return (ArrayList<Book>)list;
	}

	public int totalCount() {
		return sqlSession.selectOne("rank.selectTotalCount");
	}

	public ArrayList<Book> mainRank() {
		List<Book> list = sqlSession.selectList("rank.mainRank");
		return (ArrayList<Book>)list;
	}

	public ArrayList<Book> rankFive() {
		List<Book> list = sqlSession.selectList("rank.mainRank");
		return (ArrayList<Book>)list;
	}
}
