package com.fdl.foodlee.model.dao.inf;

import java.util.List;

import com.fdl.foodlee.model.vo.BannerVO;

public interface IBannerDAO {
	
//	배너의 리스트 볼 수 있다
	List<BannerVO> showAllBanner();
	List<BannerVO> showAllBannerId(int id);
//	배너의 트럭 상세보기 할수 있다
	BannerVO selectShowBanner(int id);
//	판매자가 배너 등록을 신청할수 있다
	List<BannerVO> insertApplyBanner(int fodId, int price);
//	판매자가 일정 금액 기준 등록시간 선착순으로 배너를 등록 할 수 있다 
	boolean insertAddBanner(BannerVO bn);
}
