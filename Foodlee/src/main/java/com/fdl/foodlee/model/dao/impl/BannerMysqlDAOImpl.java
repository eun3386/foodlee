package com.fdl.foodlee.model.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.dao.inf.IBannerDAO;
import com.fdl.foodlee.model.vo.BannerAddVO;
import com.fdl.foodlee.model.vo.BannerVO;

@Repository
public class BannerMysqlDAOImpl implements IBannerDAO {
	
//	public static final String SQL_BANNER_SHOWALL =
//			"select * from banner order by ad_start_date asc";
	public static final String SQL_BANNER_ADD_LIST =
			"select B.seller_id as sel_num,"
			+ "(select A.login from sellers A where B.seller_id = A.seller_id) as sel_login, "
			+ "B.ad_img as img_path, B.ad_price as price, B.ad_start_date as st_day, "
			+ "B.ad_end_date as ed_day from banner B where "
			+ "B.ad_price between ? and ? order by ad_start_date asc limit ?";
	
	public static final String SQL_BANNER_SHOWALL_ID =
			"select * from banner where banner_id = ? order by ad_start_date asc";
	public static final String SQL_BANNER_SHOWONE = 
			"select * from banner where seller_id = ?";
	public static final String SQL_INSERT_BANNER = 
			"insert into banner values(null,?,?,?,DATE_ADD(?, INTERVAL 1 MONTH), ?, ?)";
	public static final String SQL_BANNER_TIME =
			"select DATE_ADD(?, INTERVAL 1 MONTH) from banner where seller_id = ? ";
	public static final String SQL_ADD_BANNER = 
			"select * from banner where ad_price=? order by ad_start_date asc limit 10";
	
	public static final String SQL_BANNER_LIST = 
			"select * from banner";
	
	@Autowired
	private JdbcTemplate jtem;
	
	@Override
	public List<BannerVO> bannerAllList() {
		List<BannerVO> bnList = jtem.query(SQL_BANNER_LIST, BeanPropertyRowMapper.newInstance(BannerVO.class));
		return bnList;
	}
	
	@Override
	public List<BannerAddVO> showAddBannerList(int min, int max, int limit) {
		List<BannerAddVO> bnList = jtem.query(SQL_BANNER_ADD_LIST, BeanPropertyRowMapper.newInstance(BannerAddVO.class), min, max, limit);
		return bnList;
	}
	
	@Override
	public List<BannerVO> showAllBannerId(int id) {
		List<BannerVO> bnList = jtem.query(SQL_BANNER_SHOWALL_ID, BeanPropertyRowMapper.newInstance(BannerVO.class), id);
		return bnList;
	}

	@Override
	public BannerVO selectShowBanner(int fodId) {
		return jtem.queryForObject(SQL_BANNER_SHOWONE, BeanPropertyRowMapper.newInstance(BannerVO.class), fodId);
	}
	
	@Override
	public List<BannerVO> insertApplyBanner(int fodId, int price) {
			List<BannerVO> bnList = jtem.query(SQL_ADD_BANNER, BeanPropertyRowMapper.newInstance(BannerVO.class), price);
			return bnList;
	}

	@Override
	public boolean insertAddBanner(BannerVO bn) {
//		int r = jtem.update(SQL_INSERT_BANNER,
//				bn.getSellerId(),bn.getAdPrice(),
//				bn.getAdStartDate(),bn.getAdEndDate());
//		return r == 1;
		return false;
	}

	@Override
	public int insertNewBannerReturnKey(BannerVO bn) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertNewBannerReturnKey2(BannerVO bn) {
		// System.out.println("psc/keyholder...");
		KeyHolder kh = new GeneratedKeyHolder();
		PreparedStatementCreator psc
		 = new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt 
					= con.prepareStatement(
							SQL_INSERT_BANNER,
							new String[] {"bannerId"});
				pstmt.setInt(1, bn.getAdPrice());
				pstmt.setString(2, bn.getAdImg());
				pstmt.setTimestamp(3, bn.getAdStartDate());
				pstmt.setTimestamp(4, bn.getAdStartDate());
				pstmt.setInt(5, bn.getadType());
				pstmt.setInt(6, bn.getSellerId());
				
				return pstmt;
			}
		};
		
		jtem.update(psc, kh);
		Number r = kh.getKey(); // PK
		return r.intValue();
	}
//	@Override
//	public int insertNewBannerReturnKey(String adImg, int sellerId) {
//		
//	}

}
