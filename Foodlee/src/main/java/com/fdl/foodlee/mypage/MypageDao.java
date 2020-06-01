package com.fdl.foodlee.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.vo.FoodtruckVO;
import com.fdl.foodlee.model.vo.MemberVO;
import com.fdl.foodlee.model.vo.OrderVO;
import com.fdl.foodlee.model.vo.QnaVO;
import com.fdl.foodlee.model.vo.ReviewVO;

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
	
	public List<OrderVO> getOrderList(String name) {
		return jtem.query("select order_id as orderId, seller_id as sellerId, order_name as orderName, order_price_sum as orderPriceSum, order_date as orderDate from orders where login = ?",
				BeanPropertyRowMapper.newInstance(OrderVO.class), name);
	}
	
	public List<QnaVO> getQnaList(String name) {
		return jtem.query("select seller_id as sellerId, qna_content as qnaContent, qna_created_at as qnaCreatedAt from qna where login = ?",
				BeanPropertyRowMapper.newInstance(QnaVO.class), name);
	}
	
	public List<ReviewVO> getReviewList(String name) {
		return jtem.query("select seller_id as sellerId, review_pic as reviewPic, review_content as reviewContent, review_created_at as reviewCreatedAt from review where login = ?",
				BeanPropertyRowMapper.newInstance(ReviewVO.class), name);
	}
}
