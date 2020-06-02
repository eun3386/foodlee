package com.fdl.foodlee.service.impl;

import java.util.List;

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

	@Override
	public boolean isDuplicatedSeller(String login) {
		return selDao.isDuplicatedSeller(login);
	}

	@Override
	public boolean updateSellerLoginTime(int id) {
		return selDao.updateSellerLoginTime(id);
	}

	@Override
	public boolean updateSellerLogoutTime(int id) {
		return selDao.updateSellerLogoutTime(id);
	}

	@Override
	public List<String> selectSellerLogin(String name, String phoneNumber) {
		return selDao.selectSellerLogin(name, phoneNumber);
	}

	@Override
	public String selectSellerPassword(String login, String email) {
		return selDao.selectSellerPassword(login, email);
	}

	@Override
	public boolean updateOneSellerPW(int id, String login, String password) {
		return selDao.updateOneSellerPW(id, login, password);
	}
	
}
