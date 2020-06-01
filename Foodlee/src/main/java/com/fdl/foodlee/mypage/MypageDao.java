package com.fdl.foodlee.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.vo.FoodtruckVO;
import com.fdl.foodlee.model.vo.MemberVO;

@Repository
public class MypageDao {
	@Autowired
	private JdbcTemplate jtem;
	
	public int updateMypageInfo (MemberVO mem) {
		return jtem.update("update members set name = ?, gender = ?, phone_number = ?, address = ? where login = ?",
				mem.getName(), mem.getGender(), mem.getPhoneNumber(),  mem.getAddress(), mem.getLogin());
	}
	
	public List<FoodtruckVO> getLikeFoodtruck(String name) {
		return jtem.query("select foodtruck_name as foodtruckName, foodtruck_main_menu as foodtruckMainMenu, foodtruck_location as foodtruckLocation, foodtruck_img_path as foodtruckImgPath from foodtrucks where member_like_ids like concat('%',(select id from members where login = ?),'%')", 
				BeanPropertyRowMapper.newInstance(FoodtruckVO.class), name);
	}
}
