package com.dongnebook.rental.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.rental.model.vo.RentalLoc;

@Repository
public class RentalDao {

	@Autowired SqlSessionTemplate session;

	public int insertLoc(RentalLoc loc) {
		
		return session.insert("location.insertLoc",loc);
	}

	public RentalLoc lastLoc() {
		List<RentalLoc> list = session.selectList("location.selectLast");
		RentalLoc loc=null;
		if(list.size()>0) {
			loc=list.get(0);
		}
		
		return loc;
	}
	
}
