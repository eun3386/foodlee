package com.fdl.foodlee.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
	public int insertNewReviewReturnKey(ReviewVO rvGet) {

		// ReviewVO rv = new ReviewVO(0, login, sellerId, reviewDepth, reviewPnum, reviewContent, reviewPic, reviewCreatedAt);

		// return atDao.insertNewArticleReturnKey(at);
		return rvDao.insertNewReviewReturnKey(rvGet);
	}

	@Override
	public int insertNewReviewReturnKey(String login, int sellerId, int reviewDepth, String reviewPnum,
			String reviewContent, String reviewPic, Timestamp reviewCreatedAt) {
		ReviewVO rv = new ReviewVO(0, login, sellerId, reviewDepth, reviewPnum, reviewContent, reviewPic, reviewCreatedAt);
		return rvDao.insertNewReviewReturnKey(rv);
	}
	
	@Override
	public boolean updateReview(int id, String rvContent) {
		return rvDao.updateReview(id, rvContent);
	}

	@Override
	public boolean deleteReview(int id) {
		return rvDao.deleteReview(id);
	}

	@Override
	public List<ReviewVO> showAllReview(int sellerId) {
		return rvDao.showAllReview(sellerId);
	}
	
	@Override
	public List<ReviewVO> showAllReviewLogin(String login) {
		return rvDao.showAllReviewLogin(login);
	}

}
