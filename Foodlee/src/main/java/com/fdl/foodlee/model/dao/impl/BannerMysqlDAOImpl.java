package com.fdl.foodlee.model.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.dao.inf.IBannerDAO;
import com.fdl.foodlee.model.vo.BannerVO;

@Repository
public class BannerMysqlDAOImpl implements IBannerDAO {
	
	public static final String SQL_BANNER_SHOWONE = 
			"select * from banner where id = ?";
	public static final String SQL_INSERT_BANNER = 
			"insert into banner values(?,?,?,?,?)";
	public static final String SQL_ADD_BANNER = 
			"select * from banner where fod_id=? and ad_price=? order by ad_start_date asc limit 10";
	
	@Autowired
	private JdbcTemplate jtem;
	
	@Override
	public BannerVO selectShowBanner(int fodId) {
		return jtem.queryForObject(SQL_BANNER_SHOWONE, BeanPropertyRowMapper.newInstance(BannerVO.class), fodId);
	}

	@Override
	public List<BannerVO> insertApplyBanner(int fodId, int price) {
		List<BannerVO> bnList = jtem.query(SQL_ADD_BANNER, BeanPropertyRowMapper.newInstance(BannerVO.class), fodId, price);
		return bnList;
	}

	@Override
	public boolean insertAddBanner(BannerVO bn) {
		int r = jtem.update(SQL_INSERT_BANNER,
				bn.getFodId(),bn.getAdPrice(),
				bn.getAdStarDate(),bn.getAdEndDate(),bn.getAdLocation());
		return r == 1;
	}

}
