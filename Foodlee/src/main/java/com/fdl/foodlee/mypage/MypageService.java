package com.fdl.foodlee.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fdl.foodlee.model.vo.FoodtruckVO;
import com.fdl.foodlee.model.vo.MemberVO;
import com.fdl.foodlee.model.vo.OrderVO;
import com.fdl.foodlee.model.vo.QnaVO;
import com.fdl.foodlee.model.vo.ReviewVO;

@Service
public class MypageService {
	
	@Autowired
	private MypageDao mypageDao;
	
	public int updateMypageInfo (MemberVO mem) {
		return mypageDao.updateMypageInfo(mem);
	}
	public List<FoodtruckVO> getLikeFoodtruck(String name) {
		return mypageDao.getLikeFoodtruck(name);
	}
	
	public List<OrderVO> orderlist(String name) {
		return mypageDao.getOrderList(name);
	}
	
	public List<QnaVO> qnaList(String name) {
		return mypageDao.getQnaList(name);
	}
	
	public List<ReviewVO> reviewList(String name) {
		return mypageDao.getReviewList(name);
	}
	
	public int cancelOrder (String name) {
		return mypageDao.cancelOrder(name);
	}
}
