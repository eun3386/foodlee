package com.fdl.foodlee.model.vo;

public class LikeVO {
//	private MenuVO menuPic; // 메뉴 사진
//	private FoodtruckVO foodtruckName; // 푸드트럭 이름
//	private MenuVO menuName; // 메뉴 이름
//	private MenuVO menuPrice; // 메뉴 가격
	
	
	private int likeMenuNum; //메뉴 좋아요 개수
	private int likefoodtruckNum; //푸드트럭 좋아요 개수
	
	public LikeVO() {}
	
	public LikeVO(int likeMenuNum) {
		this.likeMenuNum = likeMenuNum;
	}
	
	public LikeVO(int likeMenuNum, int likefoodtruckNum) {
		super();
		this.likeMenuNum = likeMenuNum;
		this.likefoodtruckNum = likefoodtruckNum;
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
		return "LikeVO [likeMenuNum=" + likeMenuNum + ", likefoodtruckNum=" + likefoodtruckNum + "]";
	}
	
	
}