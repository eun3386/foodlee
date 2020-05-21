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
	public static final String SQL_REVIEW_LIST = "SELECT * FROM review " + 
			"ORDER BY IF(ISNULL(review_pnum), review_id, review_pnum*1), review_depth asc";
	
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
	public int insertNewArticleReturnKey(ReviewVO rv) {
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
	public boolean deleteReview(int id) {
		int r = jtem.update(SQL_REVIEW_DELETE, id);
		return r == 1;
	}

	@Override
	public List<ReviewVO> showAllReview() {
		return jtem.query(SQL_REVIEW_LIST,
		 		 BeanPropertyRowMapper.newInstance(ReviewVO.class));
	}

}
