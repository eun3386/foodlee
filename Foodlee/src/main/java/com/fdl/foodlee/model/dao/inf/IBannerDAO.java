package com.fdl.foodlee.model.dao.inf;

import java.util.Date;

import com.fdl.foodlee.model.vo.BannerVO;

public interface IBannerDAO {
	
//	배너의 트럭 상세보기 할수 있다
	BannerVO selectOneBanner(int id);
//	판매자가 일정 금액을 기준으로 선착순으로 배너를 등록 할 수 있다(시간 기준) 
	boolean insertNewBanner(int price, Date stBanner );
}
