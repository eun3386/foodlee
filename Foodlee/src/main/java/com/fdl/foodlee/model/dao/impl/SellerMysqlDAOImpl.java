package com.fdl.foodlee.model.dao.impl;

import com.fdl.foodlee.model.dao.inf.ISellerDAO;
import com.fdl.foodlee.model.vo.SellerVO;

public class SellerMysqlDAOImpl implements ISellerDAO {

	@Override
	public boolean insertNewSellerWithCrypto(SellerVO mb) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isDuplicatedSeller(String login) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String loginAuthenticate(String login, int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SellerVO selectOneSeller(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SellerVO selectOneSeller(String login) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectSellerIdbyLogin(String login) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean updateOneSeller(SellerVO mb) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteOneSeller(int id) {
		// TODO Auto-generated method stub
		return false;
	}

}
