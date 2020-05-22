package com.fdl.foodlee.model.vo;

public class MenuLikeVO {
	
	private int likeId; // 좋아요 번호
	private int likeMemberId; // 좋아요 한 회원 번호
	private int likeMenuId; // 좋아요 한 메뉴 번호
	private int likeFoodtruckId; // 좋아요 한 푸드트럭(판매자) 번호
	
//	private String likeMenuPic; // 좋아요 한 메뉴 사진
//	private String likeFoodtruckName; // 좋아요 한 푸드트럭 이름
//	private String likeMenuName; // 좋아요 한 메뉴 이름
//	private int likeMenuPrice; // 좋아요 한 메뉴 가격
//	private String likeMenuPage; // 좋아요 한 메뉴 페이지 주소

	private int likeTotalCount; // 좋아요 총 횟수
	
	public MenuLikeVO() {}
	
	public MenuLikeVO(int likeId, int likeMemberId) {
		this.likeId = likeId;
		this.likeMemberId = likeMemberId;
	}
	
	public MenuLikeVO(int likeId, int likeMemberId, int likeFoodtruckId) {
		this.likeId = likeId;
		this.likeMemberId = likeMemberId;
		this.likeFoodtruckId = likeFoodtruckId;
	}

	public MenuLikeVO(int likeId, int likeMemberId, int likeMenuId, int likeFoodtruckId) {
		super();
		this.likeId = likeId;
		this.likeMemberId = likeMemberId;
		this.likeMenuId = likeMenuId;
		this.likeFoodtruckId = likeFoodtruckId;
	}
	
//	public LikeVO(String likeMenuPic, String likeFoodtruckName, String likeMenuName, int likeMenuPrice,
//			String likeMenuPage, int likeTotalCount) {
//		super();
//		this.likeMenuPic = likeMenuPic;
//		this.likeFoodtruckName = likeFoodtruckName;
//		this.likeMenuName = likeMenuName;
//		this.likeMenuPrice = likeMenuPrice;
//		this.likeMenuPage = likeMenuPage;
//		this.likeTotalCount = likeTotalCount;
//	}
//
//	public LikeVO(int likeId, int likeMemberId, int likeMenuId, int likeFoodtruckId, String likeMenuPic,
//			String likeFoodtruckName, String likeMenuName, int likeMenuPrice, String likeMenuPage, int likeTotalCount) {
//		super();
//		this.likeId = likeId;
//		this.likeMemberId = likeMemberId;
//		this.likeMenuId = likeMenuId;
//		this.likeFoodtruckId = likeFoodtruckId;
//		this.likeMenuPic = likeMenuPic;
//		this.likeFoodtruckName = likeFoodtruckName;
//		this.likeMenuName = likeMenuName;
//		this.likeMenuPrice = likeMenuPrice;
//		this.likeMenuPage = likeMenuPage;
//		this.likeTotalCount = likeTotalCount;
//	}

	public int getLikeId() {
		return likeId;
	}

	public void setLikeId(int likeId) {
		this.likeId = likeId;
	}

	public int getLikeMemberId() {
		return likeMemberId;
	}

	public void setLikeMemberId(int likeMemberId) {
		this.likeMemberId = likeMemberId;
	}

	public int getLikeMenuId() {
		return likeMenuId;
	}

	public void setLikeMenuId(int likeMenuId) {
		this.likeMenuId = likeMenuId;
	}

	public int getLikeFoodtruckId() {
		return likeFoodtruckId;
	}

	public void setLikeFoodtruckId(int likeFoodtruckId) {
		this.likeFoodtruckId = likeFoodtruckId;
	}

//	public String getLikeMenuPic() {
//		return likeMenuPic;
//	}
//
//	public void setLikeMenuPic(String likeMenuPic) {
//		this.likeMenuPic = likeMenuPic;
//	}
//
//	public String getLikeFoodtruckName() {
//		return likeFoodtruckName;
//	}
//
//	public void setLikeFoodtruckName(String likeFoodtruckName) {
//		this.likeFoodtruckName = likeFoodtruckName;
//	}
//
//	public String getLikeMenuName() {
//		return likeMenuName;
//	}
//
//	public void setLikeMenuName(String likeMenuName) {
//		this.likeMenuName = likeMenuName;
//	}
//
//	public int getLikeMenuPrice() {
//		return likeMenuPrice;
//	}
//
//	public void setLikeMenuPrice(int likeMenuPrice) {
//		this.likeMenuPrice = likeMenuPrice;
//	}
//
//	public String getLikeMenuPage() {
//		return likeMenuPage;
//	}
//
//	public void setLikeMenuPage(String likeMenuPage) {
//		this.likeMenuPage = likeMenuPage;
//	}

	public int getLikeTotalCount() {
		return likeTotalCount;
	}

	public void setLikeTotalCount(int likeTotalCount) {
		this.likeTotalCount = likeTotalCount;
	}

	@Override
	public String toString() {
		return "LikeVO [likeId=" + likeId + ", likeMemberId=" + likeMemberId + ", likeMenuId=" + likeMenuId
				+ ", likeFoodtruckId=" + likeFoodtruckId + ", likeTotalCount=" + likeTotalCount + "]";
	}

	
}