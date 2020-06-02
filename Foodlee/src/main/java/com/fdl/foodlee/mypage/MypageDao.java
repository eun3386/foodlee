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
		return jtem.query("select seller_id as sellerId, foodtruck_name as foodtruckName, foodtruck_main_menu as foodtruckMainMenu, foodtruck_location as foodtruckLocation, foodtruck_img_path as foodtruckImgPath from foodtrucks where member_like_ids like concat('%',(select id from members where login = ?),'%')", 
				BeanPropertyRowMapper.newInstance(FoodtruckVO.class), name);
	}
	
	public List<OrderVO> getOrderList(String name) {
		return jtem.query("select O.order_id as orderId, O.seller_id as sellerId, O.order_state as orderState, O.order_name as orderName, O.order_price_sum as orderPriceSum, O.order_date as orderDate,  (select T.foodtruck_name from foodtrucks T where T.seller_id = O.seller_id) as orderFoodtruckName from orders O where O.login = ?",
				BeanPropertyRowMapper.newInstance(OrderVO.class), name);
	}
	
	public List<QnaVO> getQnaList(String name) {
		return jtem.query("select q.seller_id as sellerId, q.qna_content as qnaContent, q.qna_created_at as qnaCreatedAt, (select T.foodtruck_name from foodtrucks T where T.seller_id = q.seller_id) as qnaFoodtruckName from qna q where q.login = ?",
				BeanPropertyRowMapper.newInstance(QnaVO.class), name);
	}
	
	public List<ReviewVO> getReviewList(String name) {
		return jtem.query("select r.seller_id as sellerId, r.review_pic as reviewPic, r.review_content as reviewContent, r.review_created_at as reviewCreatedAt, (select T.foodtruck_name from foodtrucks T where T.seller_id = r.seller_id) as reviewFoodtruckName from review r where r.login = ?",
				BeanPropertyRowMapper.newInstance(ReviewVO.class), name);
	}
	
	public int cancelOrder (String name) {
		return jtem.update("update orders set order_state = 2 where login = ?");
	}
}
