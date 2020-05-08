package com.fdl.foodlee.model.vo;

public class LikeVO {
//	private MenuVO menuPic; // 메뉴 사진
//	private FoodtruckVO foodtruckName; // 푸드트럭 이름
//	private MenuVO menuName; // 메뉴 이름
//	private MenuVO menuPrice; // 메뉴 가격
	
	private int likeNum; // 좋아요 번호
	private int likeCount; // 좋아요 수
	private String likeMenuPic; // 좋아요 한 메뉴 사진
	private String likeFoodtruckName; // 좋아요 한 푸드트럭 이름
	private String likeMenuName; // 좋아요 한 메뉴 이름
	private int likeMenuPrice; // 좋아요 한 메뉴 가격
	private String likeMenuPage; // 좋아요 한 메뉴 페이지 주소
	
	private int likeMenuNum; //메뉴 좋아요 개수
	private int likefoodtruckNum; //푸드트럭 좋아요 개수
	
	public LikeVO() {}
	
	public LikeVO(String likeMenuPic, String likeFoodtruckName, String likeMenuName, int likeMenuPrice) {
		this(0, 0, likeMenuPic, likeFoodtruckName, likeMenuName, likeMenuPrice, 0, 0);
	}

	public LikeVO(int likeNum, int likeCount, String likeMenuPic, String likeFoodtruckName, String likeMenuName,
			int likeMenuPrice, int likeMenuNum, int likefoodtruckNum) {
		super();
		this.likeNum = likeNum;
		this.likeCount = likeCount;
		this.likeMenuPic = likeMenuPic;
		this.likeFoodtruckName = likeFoodtruckName;
		this.likeMenuName = likeMenuName;
		this.likeMenuPrice = likeMenuPrice;
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

	public String getLikeMenuPic() {
		return likeMenuPic;
	}

	public void setLikeMenuPic(String likeMenuPic) {
		this.likeMenuPic = likeMenuPic;
	}

	public String getLikeFoodtruckName() {
		return likeFoodtruckName;
	}

	public void setLikeFoodtruckName(String likeFoodtruckName) {
		this.likeFoodtruckName = likeFoodtruckName;
	}

	public String getLikeMenuName() {
		return likeMenuName;
	}

	public void setLikeMenuName(String likeMenuName) {
		this.likeMenuName = likeMenuName;
	}

	public int getLikeMenuPrice() {
		return likeMenuPrice;
	}

	public void setLikeMenuPrice(int likeMenuPrice) {
		this.likeMenuPrice = likeMenuPrice;
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
		return "LikeVO [likeNum=" + likeNum + ", likeCount=" + likeCount + ", likeMenuPic=" + likeMenuPic
				+ ", likeFoodtruckName=" + likeFoodtruckName + ", likeMenuName=" + likeMenuName + ", likeMenuPrice="
				+ likeMenuPrice + ", likeMenuNum=" + likeMenuNum + ", likefoodtruckNum=" + likefoodtruckNum + "]";
	}
	
	
	
	
}