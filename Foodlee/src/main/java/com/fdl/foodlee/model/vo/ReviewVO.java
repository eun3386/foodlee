package com.fdl.foodlee.model.vo;

import java.sql.Timestamp;

public class ReviewVO {
	private int reviewId;
	private String login;
	private int reviewDepth;
	private int reviewPnum;
	private String reviewContent;
	private String reviewPic;
	private Timestamp reviewCreatedAt;

	public ReviewVO(int reviewId, String login, int reviewDepth, int reviewPnum, String reviewContent, String reviewPic,
			Timestamp reviewCreatedAt) {
		super();
		this.reviewId = reviewId;
		this.login = login;
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
		return "ReviewVO [reviewId=" + reviewId + ", login=" + login + ", reviewDepth=" + reviewDepth + ", reviewPnum="
				+ reviewPnum + ", reviewContent=" + reviewContent + ", reviewPic=" + reviewPic + ", reviewCreatedAt="
				+ reviewCreatedAt + "]";
	}

}
