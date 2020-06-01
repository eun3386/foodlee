package com.fdl.foodlee.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fdl.foodlee.model.dao.inf.IBannerDAO;
import com.fdl.foodlee.model.vo.BannerAddVO;
import com.fdl.foodlee.model.vo.BannerVO;
import com.fdl.foodlee.service.inf.IBannerSVC;

@Service
public class BannerSVCImpl implements IBannerSVC {
	
	@Autowired
	private IBannerDAO bannerDAO;
	
	@Override
	public List<BannerAddVO> showAddBannerList(int min, int max, int limit) {
		// TODO Auto-generated method stub
		return bannerDAO.showAddBannerList(min, max, limit);
	}

	@Override
	public List<BannerVO> showAllBannerId(int id) {
		// TODO Auto-generated method stub
		return bannerDAO.showAllBannerId(id);
	}
	
	@Override
	public BannerVO selectShowBanner(int id) {
		// TODO Auto-generated method stub
		return bannerDAO.selectShowBanner(id);
	}

	@Override
	public List<BannerVO> insertApplyBanner(int fodId, int price) {
		// TODO Auto-generated method stub
		return bannerDAO.insertApplyBanner(fodId, price);
	}

	@Override
	public boolean insertAddBanner(BannerVO bn) {
		// TODO Auto-generated method stub
		return bannerDAO.insertAddBanner(bn);
	}

	@Override
	public int insertNewBannerReturnKey(BannerVO bn) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertNewBannerReturnKey2(BannerVO bn) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertNewBannerReturnKey(String adImg, int adPrice, Timestamp adStartDate, Timestamp adEndDate,
			int adWaiting, int sellerId) {
		// TODO Auto-generated method stub
		BannerVO bn = new BannerVO(adPrice, adImg, adStartDate, adEndDate, adWaiting, sellerId);
		
		//return atDao.insertNewArticleReturnKey(at);
		return bannerDAO.insertNewBannerReturnKey2(bn);
	}

//	@Override
//	public int insertNewBannerReturnKey(String adImg, int sellerId) {
//		// TODO Auto-generated method stub
//		return 0;
//	}

}
