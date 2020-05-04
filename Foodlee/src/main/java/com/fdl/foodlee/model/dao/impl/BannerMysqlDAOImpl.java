package com.fdl.foodlee.model.dao.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.dao.inf.IBannerDAO;
import com.fdl.foodlee.model.vo.BannerVO;

@Repository
public class BannerMysqlDAOImpl implements IBannerDAO {
	
	public static final String SQL_BANNER_SHOWONE = "";
	public static final String SQL_INSERT_BANNER = "";
	
	@Autowired
	private JdbcTemplate jtem;
	private SimpleJdbcInsert simIn;
	
	@Override
	public BannerVO selectOneBanner(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insertNewBanner(int price, Date startDate) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean insertNewBanner(BannerVO brVO) {
		// TODO Auto-generated method stub
		return false;
	}

}
