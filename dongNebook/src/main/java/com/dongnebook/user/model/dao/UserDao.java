package com.dongnebook.user.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.user.model.vo.User;

/**
 * @author 김종모
 *
 */
@Repository
public class UserDao {
	@Autowired
	private SqlSessionTemplate session;

	public int insertUser(User u) {
		u.getCategory().setCategoryNo(1);
		return session.insert("user.insertUser",u);
	}
	public User selectOneUser(User u) {
		return session.selectOne("user.selectOneUser", u);
	}
	public int updateUser(User u) {
		return session.update("user.updateUser", u);
	}
	public User loginUser(User u) {
		return session.selectOne("user.selectOneUser", u);
	}
	public int deleteUser(User u) {
		return session.delete("user.deleteUser", u);
	}
	public ArrayList<User> selectUserBySearch(int reqPage, 
			String inputStr, String searchKeyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("reqPage", reqPage);
		map.put("inputStr", inputStr);
		map.put("searchKeyword", searchKeyword);
		List<User> list = session.selectList("user.selectUserBySearch", map);
		return (ArrayList<User>)list;
	}
	public int selectCountBySearch(String inputStr, String searchKeyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("inputStr", inputStr);
		map.put("searchKeyword", searchKeyword);
		return session.selectOne("user.selectCountBySearch",map);
	}
}
