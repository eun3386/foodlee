package com.fdl.foodlee.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fdl.foodlee.model.dao.inf.ISellerDAO;
import com.fdl.foodlee.model.vo.SellerVO;
import com.fdl.foodlee.service.inf.ISellerSVC;

@Service
public class SellerSVCImpl implements ISellerSVC {

	@Autowired
	private ISellerDAO selDao;

	@Override
	public int selectSellerIdByLogin(String login) {
		return selDao.selectSellerIdbyLogin(login);
	}

	@Override
	public boolean insertNewSellerWithCrypto(SellerVO sel) {
		return selDao.insertNewSellerWithCrypto(sel);
	}

	@Override
	public String loginAuthenticate(String login, int id) {
		return selDao.loginAuthenticate(login, id);
	}

	@Override
	public SellerVO selectOneSeller(int id) {
		return selDao.selectOneSeller(id);
	}

	@Override
	public SellerVO selectOneSeller(String login) {
		return selDao.selectOneSeller(login);
	}

	@Override
	public int selectSellerIdbyLogin(String login) {
		return selDao.selectSellerIdbyLogin(login);
	}

	@Override
	public boolean updateOneSeller(SellerVO sel) {
		return selDao.updateOneSeller(sel);
	}

	@Override
	public boolean deleteOneSeller(int id) {
		return selDao.deleteOneSeller(id);
	}
	
}
