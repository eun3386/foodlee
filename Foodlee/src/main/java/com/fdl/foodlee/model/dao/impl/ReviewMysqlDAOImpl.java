package com.fdl.foodlee.model.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.dao.inf.IReviewDAO;
import com.fdl.foodlee.model.vo.ReviewVO;

@Repository
public class ReviewMysqlDAOImpl implements IReviewDAO {
	
	public static final String SQL_REVIEW_NEW = "insert into review"
			+ " values(null, ?, ?, ?, ?, ?, ?, now())";
	public static final String SQL_REVIEW_UPDATE = "update review set review_content=?"
			+ ", review_pic=? where review_id=?";
	public static final String SQL_REVIEW_DELETE = "delete from review where review_id = ?";
	public static final String SQL_REVIEW_LIST = "SELECT * FROM review " + 
			"ORDER BY IF(ISNULL(review_pnum), review_id, review_pnum), review_depth asc";
	
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
	public boolean insertNewReview(ReviewVO rv) {
		int r = jtem.update(SQL_REVIEW_NEW,
				rv.getLogin(), rv.getSellerId(),
				rv.getReviewDepth(), rv.getReviewPnum(),
				rv.getReviewContent(), rv.getReviewPic());
		return r == 1; //? true: false;
	}

	@Override
	public boolean updateReview(int id, String rvContent, String reviewPic) {
		int r = jtem.update(SQL_REVIEW_UPDATE, rvContent, reviewPic, id); 
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
