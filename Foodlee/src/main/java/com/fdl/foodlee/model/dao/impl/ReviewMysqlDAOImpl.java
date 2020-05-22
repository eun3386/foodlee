package com.fdl.foodlee.model.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.dao.inf.IReviewDAO;
import com.fdl.foodlee.model.vo.ReviewVO;

@Repository
public class ReviewMysqlDAOImpl implements IReviewDAO {
	
	public static final String SQL_REVIEW_NEW = "insert into review"
			+ " values(null, ?, ?, ?, ?, ?, ?, now())";
	public static final String SQL_REVIEW_UPDATE = "update review set review_content=?"
			+ " where review_id=?";
	public static final String SQL_REVIEW_DELETE = "delete from review where review_id = ?";
	public static final String SQL_REVIEW_LIST = "SELECT * FROM review where seller_id = ? " + 
			"ORDER BY IF(ISNULL(review_pnum), review_id, review_pnum*1), review_depth asc";
	public static final String SQL_REVIEW_LIST_LOGIN = "SELECT * FROM review where login = ? " + 
			"ORDER BY review_created_at desc";
	public static final String SQL_REVIEW_REPLY = "insert into review"
			+ " values(null, ?, ?, 1, ?, ?, ?, now())";
	public static final String SQL_REVIEW_DELETE_BEFORE = "select count(*) from review where review_pnum = ?";
	public static final String SQL_REVIEW_DELETE_COUNT = "select count(*) from review where "
			+ "review_id=? and review_content='삭제된 리뷰입니다.'";
	public static final String SQL_REVIEW_DELETE_UPDATE = "update review set review_content='삭제된 리뷰입니다.' where review_id=?";
	public static final String SQL_REVIEW_DELETE_BEFORE_CHECK = "select review_pnum from review where review_id=?";
	
	private JdbcTemplate jtem;	
	private SimpleJdbcInsert simIn;
	
	public ReviewMysqlDAOImpl() {}
	
	@Autowired
	public ReviewMysqlDAOImpl(JdbcTemplate jtem) {
		this.jtem = jtem;		
		this.simIn = new SimpleJdbcInsert(jtem.getDataSource());
		simIn.withTableName("review");
		simIn.usingGeneratedKeyColumns("id");
	}
	
	@Override
	public int insertNewReviewReturnKey(ReviewVO rv) {
		KeyHolder kh = new GeneratedKeyHolder();
		PreparedStatementCreator psc = new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement(SQL_REVIEW_NEW, new String[] { "id" });
				pstmt.setString(1, rv.getLogin());
				pstmt.setInt(2, rv.getSellerId());
				pstmt.setInt(3, rv.getReviewDepth());
				pstmt.setString(4, rv.getReviewPnum());
				pstmt.setString(5, rv.getReviewContent());
				pstmt.setString(6, rv.getReviewPic() == "" ? null : rv.getReviewPic());
				return pstmt;
			}
		};

		jtem.update(psc, kh);
		Number r = kh.getKey(); // PK
		return r.intValue();
	}

	@Override
	public boolean insertNewReview(ReviewVO rv) {
		int r = jtem.update(SQL_REVIEW_NEW,
				rv.getLogin(), rv.getSellerId(),
				rv.getReviewDepth(), rv.getReviewPnum(),
				rv.getReviewContent(), rv.getReviewPic());
		return r == 1; //? true: false;
	}

	@Override
	public boolean updateReview(int id, String rvContent) {
		int r = jtem.update(SQL_REVIEW_UPDATE, rvContent, id); 
		return r == 1;
	}

	@Override
	public boolean deleteReview(int id, int depth) {
		int get = jtem.queryForObject(SQL_REVIEW_DELETE_BEFORE, Integer.class, id);
		
		if (depth == 0) {
			if (get >= 1) {
				int r = jtem.update(SQL_REVIEW_DELETE_UPDATE, id);
				return r == 1;
			} else {
				int r = jtem.update(SQL_REVIEW_DELETE, id);
				return r == 1;
			}
		} else if (depth == 1) {
			int pnum = jtem.queryForObject(SQL_REVIEW_DELETE_BEFORE_CHECK, Integer.class, id);
			int getDepth = jtem.queryForObject(SQL_REVIEW_DELETE_COUNT, Integer.class, pnum);
			
			if (getDepth >= 1) {
				int r1 = jtem.update(SQL_REVIEW_DELETE, id);
				int r2 = jtem.update(SQL_REVIEW_DELETE, pnum);
				return r1 == r2;
			} else {
				int r = jtem.update(SQL_REVIEW_DELETE, id);
				return r == 1;
			}
		} else {
			System.out.println("=======================================================");
			System.err.println("!!!!!!!!!!!!!!!!!!!리뷰 삭제 중 알 수 없는 오류!!!!!!!!!!!!!!!!!!");
			System.out.println("=======================================================");
			return false;
		}
	}

	@Override
	public List<ReviewVO> showAllReview(int sellerId) {
		return jtem.query(SQL_REVIEW_LIST, 
		 		 BeanPropertyRowMapper.newInstance(ReviewVO.class), sellerId);
	}
	
	@Override
	public List<ReviewVO> showAllReviewLogin(String login) {
		return jtem.query(SQL_REVIEW_LIST_LOGIN, 
		 		 BeanPropertyRowMapper.newInstance(ReviewVO.class), login);
	}

	@Override
	public boolean reviewReply(ReviewVO rv) {
		int r = jtem.update(SQL_REVIEW_REPLY,
				rv.getLogin(), rv.getSellerId(),
				rv.getReviewPnum(), rv.getReviewContent(), rv.getReviewPic());
		return r == 1; //? true: false;
	}

}
