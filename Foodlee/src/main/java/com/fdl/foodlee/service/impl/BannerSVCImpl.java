package com.fdl.foodlee.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fdl.foodlee.model.dao.inf.IBannerDAO;
import com.fdl.foodlee.model.vo.BannerVO;
import com.fdl.foodlee.service.inf.IBannerSVC;

@Service
public class BannerSVCImpl implements IBannerSVC {
	
	@Autowired
	private IBannerDAO bannerDAO;
	
	@Override
	public List<BannerVO> showAllBanner() {
		// TODO Auto-generated method stub
		return bannerDAO.showAllBanner();
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

}
