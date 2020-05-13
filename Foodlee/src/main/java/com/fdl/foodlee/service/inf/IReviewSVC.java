package com.fdl.foodlee.service.inf;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fdl.foodlee.model.vo.ReviewVO;

public interface IReviewSVC {
	// 리뷰를 작성 할 수 있다.
	boolean insertNewReview(ReviewVO rv);
	// 리뷰를 수정 할 수 있다.
	boolean updateReview(int id, String rvContent, String reviewPic);
	// 리뷰를 삭제 할 수 있다.
	boolean deleteReview(int id);
	// 리뷰 전체를 가져와 조회 할 수 있다.
	List<ReviewVO> showAllReview();
}