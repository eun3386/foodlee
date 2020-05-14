package com.fdl.foodlee.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fdl.foodlee.model.dao.inf.ISellerDAO;
import com.fdl.foodlee.service.inf.ISellerSVC;

@Service
public class SellerSVCImpl implements ISellerSVC {

	@Autowired
	private ISellerDAO selDao;

	@Override
	public int selectSellerIdByLogin(String login) {
		return selDao.selectSellerIdbyLogin(login);
	}
	
}
