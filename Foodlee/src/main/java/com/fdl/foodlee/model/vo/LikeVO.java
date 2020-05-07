package com.fdl.foodlee.model.vo;

public class LikeVO {
//	private MenuVO menuPic; // 메뉴 사진
//	private FoodtruckVO foodtruckName; // 푸드트럭 이름
//	private MenuVO menuName; // 메뉴 이름
//	private MenuVO menuPrice; // 메뉴 가격
	
	private int likeNum; // 좋아요 번호
	private int likeCount; // 좋아요 수
	private int likeMenuNum; //메뉴 좋아요 개수
	private int likefoodtruckNum; //푸드트럭 좋아요 개수
	
	public LikeVO() {}
	
	public LikeVO(int likeNum, int likeCount) {
		this.likeNum = likeNum;
		this.likeCount = likeCount;
	}
	
	public LikeVO(int likeNum, int likeCount, int likeMenuNum, int likefoodtruckNum) {
		super();
		this.likeNum = likeNum;
		this.likeCount = likeCount;
		this.likeMenuNum = likeMenuNum;
		this.likefoodtruckNum = likefoodtruckNum;
	}

	public int getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getLikeMenuNum() {
		return likeMenuNum;
	}

	public void setLikeMenuNum(int likeMenuNum) {
		this.likeMenuNum = likeMenuNum;
	}

	public int getLikefoodtruckNum() {
		return likefoodtruckNum;
	}

	public void setLikefoodtruckNum(int likefoodtruckNum) {
		this.likefoodtruckNum = likefoodtruckNum;
	}

	@Override
	public String toString() {
		return "LikeVO [likeNum=" + likeNum + ", likeCount=" + likeCount + ", likeMenuNum=" + likeMenuNum
				+ ", likefoodtruckNum=" + likefoodtruckNum + "]";
	}
	

	
	
}