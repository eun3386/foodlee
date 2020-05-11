package com.fdl.foodlee.model.vo;

public class LikeVO {
//	private MenuVO menuPic; // 메뉴 사진
//	private FoodtruckVO foodtruckName; // 푸드트럭 이름
//	private MenuVO menuName; // 메뉴 이름
//	private MenuVO menuPrice; // 메뉴 가격
	
	private int likeId; // 좋아요 번호
	private int likeCount; // 좋아요 수
	private int likeMenuNum; // 좋아요 한 메뉴 번호
	private String likeMenuPic; // 좋아요 한 메뉴 사진
	private String likeFoodtruckName; // 좋아요 한 푸드트럭 이름
	private String likeMenuName; // 좋아요 한 메뉴 이름
	private int likeMenuPrice; // 좋아요 한 메뉴 가격
	private String likeMenuPage; // 좋아요 한 메뉴 페이지 주소
	
	private int likeMenutotalNum; //메뉴 좋아요 총개수
	private int likefoodtruckNum; //푸드트럭 좋아요 개수
	
	public LikeVO() {}
	
//	public LikeVO(String likeMenuPic, String likeFoodtruckName, String likeMenuName, int likeMenuPrice) {
//		this(0, 0, likeMenuPic, likeFoodtruckName, likeMenuName, likeMenuPrice, 0, 0);
//	}

	public LikeVO(int likeNum, int likeCount, int likeMenuNo, String likeMenuPic, String likeFoodtruckName,
			String likeMenuName, int likeMenuPrice, String likeMenuPage, int likeMenutotalNum, int likefoodtruckNum) {
		super();
		this.likeId = likeNum;
		this.likeCount = likeCount;
		this.likeMenuNum = likeMenuNo;
		this.likeMenuPic = likeMenuPic;
		this.likeFoodtruckName = likeFoodtruckName;
		this.likeMenuName = likeMenuName;
		this.likeMenuPrice = likeMenuPrice;
		this.likeMenuPage = likeMenuPage;
		this.likeMenutotalNum = likeMenutotalNum;
		this.likefoodtruckNum = likefoodtruckNum;
	}

	public int getLikeNum() {
		return likeId;
	}

	public void setLikeNum(int likeNum) {
		this.likeId = likeNum;
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

	public String getLikeMenuPage() {
		return likeMenuPage;
	}

	public void setLikeMenuPage(String likeMenuPage) {
		this.likeMenuPage = likeMenuPage;
	}

	public int getLikeMenutotalNum() {
		return likeMenutotalNum;
	}

	public void setLikeMenutotalNum(int likeMenutotalNum) {
		this.likeMenutotalNum = likeMenutotalNum;
	}

	public int getLikefoodtruckNum() {
		return likefoodtruckNum;
	}

	public void setLikefoodtruckNum(int likefoodtruckNum) {
		this.likefoodtruckNum = likefoodtruckNum;
	}

	@Override
	public String toString() {
		return "LikeVO [likeNum=" + likeId + ", likeCount=" + likeCount + ", likeMenuNum=" + likeMenuNum
				+ ", likeMenuPic=" + likeMenuPic + ", likeFoodtruckName=" + likeFoodtruckName + ", likeMenuName="
				+ likeMenuName + ", likeMenuPrice=" + likeMenuPrice + ", likeMenuPage=" + likeMenuPage
				+ ", likeMenutotalNum=" + likeMenutotalNum + ", likefoodtruckNum=" + likefoodtruckNum + "]";
	}
	
	
	
	
	
	
	
}