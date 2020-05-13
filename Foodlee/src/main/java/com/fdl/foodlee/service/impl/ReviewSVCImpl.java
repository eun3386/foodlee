package com.fdl.foodlee.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Service;

import com.fdl.foodlee.model.dao.inf.IReviewDAO;
import com.fdl.foodlee.model.vo.ReviewVO;
import com.fdl.foodlee.service.inf.IReviewSVC;

@Service
public class ReviewSVCImpl implements IReviewSVC {
	
	@Autowired
	private IReviewDAO rvDao;
	
	@Override
	public boolean insertNewReview(ReviewVO rv) {
		return rvDao.insertNewReview(rv);
	}

	@Override
	public boolean updateReview(int id, String rvContent, String reviewPic) {
		return rvDao.updateReview(id, rvContent, reviewPic);
	}

	@Override
	public boolean deleteReview(int id) {
		return rvDao.deleteReview(id);
	}

	@Override
	public List<ReviewVO> showAllReview() {
		return rvDao.showAllReview();
	}

}
