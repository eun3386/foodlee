package com.fdl.foodlee.service.inf;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Service;

import com.fdl.foodlee.model.vo.ReviewVO;

public interface IReviewSVC {
	// 리뷰를 작성 할 수 있다.
	boolean insertNewReview(ReviewVO rv);
	int insertNewReviewReturnKey(ReviewVO rvGet);
	int insertNewReviewReturnKey(String login, int sellerId, int reviewDepth, String reviewPnum, String reviewContent,
			String reviewPic, Timestamp reviewCreatedAt);
	// 리뷰를 수정 할 수 있다.
	boolean updateReview(int id, String rvContent);
	// 리뷰를 삭제 할 수 있다.
	boolean deleteReview(int id, int depth);
	// 리뷰 전체를 가져와 조회 할 수 있다.
	List<ReviewVO> showAllReview(int sellerId);
	List<ReviewVO> showAllReviewLogin(String login);
	
	// 판매자가 리뷰에 답변 할 수 있다.
	boolean reviewReply(ReviewVO rv);
}
