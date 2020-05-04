package com.fdl.foodlee.model.dao.inf;

import java.util.Date;

import com.fdl.foodlee.model.vo.BannerVO;

public interface IBannerDAO {
	
//	배너의 트럭 상세보기 할수 있다
	BannerVO selectOneBanner(int id);
//	판매자가 일정 금액 기준 등록시간 선착순으로 배너를 등록 할 수 있다 
	boolean insertNewBanner(BannerVO brVO );
	boolean insertNewBanner(int price, Date startDate );
}
