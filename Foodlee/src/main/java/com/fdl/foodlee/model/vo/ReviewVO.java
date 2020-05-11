package com.fdl.foodlee.model.vo;

import java.sql.Timestamp;

public class ReviewVO {
	private int reviewId; // 리뷰 번호 <<PK>>
	private String login; // 리뷰 작성자 <<FK>>
	private int sellerId; // 판매자 번호 <<FK>>
	private int reviewDepth; // 사장님 답글 여부(문의 0 답글 1)
	private int reviewPnum; // 답글일 경우 해당 문의 번호
	private String reviewContent; // 리뷰 내용
	private String reviewPic; // 리뷰 사진
	private Timestamp reviewCreatedAt; // 리뷰 작성일
	
	public ReviewVO() {}
	
	public ReviewVO(int reviewId, String login, int sellerId, int reviewDepth, String reviewContent, Timestamp reviewCreatedAt) {
		this.reviewId = reviewId;
		this.login = login;
		this.sellerId = sellerId;
		this.reviewDepth = reviewDepth;
		this.reviewContent = reviewContent;
		this.reviewCreatedAt = reviewCreatedAt;
	}
	
	public ReviewVO(int reviewId, String login, int sellerId, int reviewDepth, String reviewContent, String reviewPic,
			Timestamp reviewCreatedAt) {
		this.reviewId = reviewId;
		this.login = login;
		this.sellerId = sellerId;
		this.reviewDepth = reviewDepth;
		this.reviewContent = reviewContent;
		this.reviewPic = reviewPic;
		this.reviewCreatedAt = reviewCreatedAt;
	}
	
	public ReviewVO(int reviewId, String login, int sellerId, int reviewDepth, int reviewPnum, String reviewContent, Timestamp reviewCreatedAt) {
		this.reviewId = reviewId;
		this.login = login;
		this.sellerId = sellerId;
		this.reviewDepth = reviewDepth;
		this.reviewPnum = reviewPnum;
		this.reviewContent = reviewContent;
		this.reviewCreatedAt = reviewCreatedAt;
	}

	public ReviewVO(int reviewId, String login, int sellerId, int reviewDepth, int reviewPnum, String reviewContent, String reviewPic,
			Timestamp reviewCreatedAt) {
		this.reviewId = reviewId;
		this.login = login;
		this.sellerId = sellerId;
		this.reviewDepth = reviewDepth;
		this.reviewPnum = reviewPnum;
		this.reviewContent = reviewContent;
		this.reviewPic = reviewPic;
		this.reviewCreatedAt = reviewCreatedAt;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}
	
	public int getSellerId() {
		return sellerId;
	}

	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}

	public int getReviewDepth() {
		return reviewDepth;
	}

	public void setReviewDepth(int reviewDepth) {
		this.reviewDepth = reviewDepth;
	}

	public int getReviewPnum() {
		return reviewPnum;
	}

	public void setReviewPnum(int reviewPnum) {
		this.reviewPnum = reviewPnum;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewPic() {
		return reviewPic;
	}

	public void setReviewPic(String reviewPic) {
		this.reviewPic = reviewPic;
	}

	public Timestamp getReviewCreatedAt() {
		return reviewCreatedAt;
	}

	public void setReviewCreatedAt(Timestamp reviewCreatedAt) {
		this.reviewCreatedAt = reviewCreatedAt;
	}

	@Override
	public String toString() {
		return "ReviewVO [reviewId=" + reviewId + ", login=" + login + ", sellerId=" + sellerId + ", reviewDepth=" + reviewDepth + ", reviewPnum="
				+ reviewPnum + ", reviewContent=" + reviewContent + ", reviewPic=" + reviewPic + ", reviewCreatedAt="
				+ reviewCreatedAt + "]";
	}

}
