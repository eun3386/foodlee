package com.fdl.foodlee.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.vo.MemberVO;

@Repository
public class MypageDao {
	@Autowired
	private JdbcTemplate jtem;
	
	public int updateMypageInfo (MemberVO mem) {
		return jtem.update("update members set name = ?, gender = ?, phone_number = ? where login = ?", mem.getName(), mem.getGender(), mem.getPhoneNumber(), mem.getLogin());
	}
}
