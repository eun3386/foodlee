package com.fdl.foodlee.model.vo;

import java.sql.Timestamp;

public class FoodtruckVO {
	
	private int sellerId; // 판매자 번호 ⇔ integer seller_id NN <<FK>>
	private String foodtruckImgPath; // 푸드트럭 이미지 경로 ⇔ varchar (256) foodtruck_img_path  NN
	private String foodtruckName; // 푸드트럭 이름 ⇔ varchar (64) foodtruck_name NN
	private String foodtruckMainMenu; // 푸드트럭 대표메뉴 ⇔ varchar (512) foodtruck_main_menu NN
	private int menuCategory; // 대표메뉴의 카테고리 ⇔ integer menu_category NN
	private String foodtruckLocation; // 푸드트럭 위치 ⇔ varchar(256) foodtruck_location NN
	private String foodtruckMuni; // 푸드트럭 구 이름 ⇔ varchar(256) foodtruck_muni NN
	private int foodtruckGuCode; // 구 코드 ⇔ int foodtruck_gu_code NN
	private String foodtruckOperationHour; // 푸드트럭 영업시간 ⇔ varchar (64)  foodtruck_operation_hour NN	
	private int favoriteCount; // 좋아요 트럭 ⇔ integer favorite_count <<FK>>
	private int memberLikeCount; // 좋아요 횟수⇔ member_like_count 
	private String memberLikeIds; // 좋아요 한 회원의 ID목록들⇔ varchar(512) member_like_ids
	private String sellerFoodtruckCoordinate; // 판매자 푸드트럭 좌표 ⇔ varchar(1024) seller_foodtruck_coordinate NN
	private Timestamp locationUpdatedAt; // 위치이동날짜 ⇔ timestamp location_updated_at CURRENT_TIMESTAMP
	
	public static final String[] menuTypes = {"인식 오류", "간식", "식사", "디저트", "밥차"}; 
	
	public static final int error = 0;
	public static final int snack = 1;
	public static final int meal = 2;
	public static final int dessert = 3;
	public static final int riceCar = 4;
	
	public FoodtruckVO() {}
	public FoodtruckVO(int favoriteCount, int memberLikeCount) {
//		this.favoriteCount = favoriteCount;
//		this.memberLikeCount = memberLikeCount;
		this(0, null, null, null, 0, null, null,0,	null, favoriteCount, memberLikeCount, null, null, null);
	}
	public FoodtruckVO(int sellerId,String foodtruckImgPath, String foodtruckName, String foodtruckMainMenu, int menuCategory,
			String foodtruckLocation, String foodtruckMuni, int foodtruckGuCode, String foodtruckOperationHour,
			String sellerFoodtruckCoordinate) {
		this(sellerId, foodtruckImgPath, foodtruckName, foodtruckMainMenu, menuCategory, foodtruckLocation, foodtruckMuni,
				foodtruckGuCode, foodtruckOperationHour, 0, 0, null, sellerFoodtruckCoordinate, null);
	}
	
	public FoodtruckVO(String foodtruckImgPath, String foodtruckName, String foodtruckMainMenu, int menuCategory,
			String foodtruckLocation, String foodtruckMuni, int foodtruckGuCode, String foodtruckOperationHour,
			String memberLikeIds, String sellerFoodtruckCoordinate) {
		this(0, foodtruckImgPath, foodtruckName, foodtruckMainMenu, menuCategory, foodtruckLocation, foodtruckMuni,
				foodtruckGuCode, foodtruckOperationHour, 0, 0, memberLikeIds, sellerFoodtruckCoordinate, null);
	}

	public FoodtruckVO(int sellerId, String foodtruckImgPath, String foodtruckName, String foodtruckMainMenu,
			int menuCategory, String foodtruckLocation, String foodtruckMuni, int foodtruckGuCode,
			String foodtruckOperationHour, int favoriteCount, int memberLikeCount, String memberLikeIds,
			String sellerFoodtruckCoordinate, Timestamp locationUpdatedAt) {
		super();
		this.sellerId = sellerId;
		this.foodtruckImgPath = foodtruckImgPath;
		this.foodtruckName = foodtruckName;
		this.foodtruckMainMenu = foodtruckMainMenu;
		this.menuCategory = menuCategory;
		this.foodtruckLocation = foodtruckLocation;
		this.foodtruckMuni = foodtruckMuni;
		this.foodtruckGuCode = foodtruckGuCode;
		this.foodtruckOperationHour = foodtruckOperationHour;
		this.favoriteCount = favoriteCount;
		this.memberLikeCount = memberLikeCount;
		this.memberLikeIds = memberLikeIds;
		this.sellerFoodtruckCoordinate = sellerFoodtruckCoordinate;
		this.locationUpdatedAt = locationUpdatedAt;
	}



	public int getSellerId() {
		return sellerId;
	}

	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}

	public String getFoodtruckImgPath() {
		return foodtruckImgPath;
	}

	public void setFoodtruckImgPath(String foodtruckImgPath) {
		this.foodtruckImgPath = foodtruckImgPath;
	}

	public String getFoodtruckName() {
		return foodtruckName;
	}

	public void setFoodtruckName(String foodtruckName) {
		this.foodtruckName = foodtruckName;
	}

	public String getFoodtruckMainMenu() {
		return foodtruckMainMenu;
	}

	public void setFoodtruckMainMenu(String foodtruckMainMenu) {
		this.foodtruckMainMenu = foodtruckMainMenu;
	}

	public int getMenuCategory() {
		return menuCategory;
	}

	public void setMenuCategory(int menuCategory) {
		this.menuCategory = menuCategory;
	}

	public String getFoodtruckLocation() {
		return foodtruckLocation;
	}

	public void setFoodtruckLocation(String foodtruckLocation) {
		this.foodtruckLocation = foodtruckLocation;
	}

	public String getFoodtruckMuni() {
		return foodtruckMuni;
	}

	public void setFoodtruckMuni(String foodtruckMuni) {
		this.foodtruckMuni = foodtruckMuni;
	}

	public int getFoodtruckGuCode() {
		return foodtruckGuCode;
	}

	public void setFoodtruckGuCode(int foodtruckGuCode) {
		this.foodtruckGuCode = foodtruckGuCode;
	}

	public String getFoodtruckOperationHour() {
		return foodtruckOperationHour;
	}

	public void setFoodtruckOperationHour(String foodtruckOperationHour) {
		this.foodtruckOperationHour = foodtruckOperationHour;
	}

	public int getFavoriteCount() {
		return favoriteCount;
	}

	public void setFavoriteCount(int favoriteCount) {
		this.favoriteCount = favoriteCount;
	}

	public int getMemberLikeCount() {
		return memberLikeCount;
	}

	public void setMemberLikeCount(int memberLikeCount) {
		this.memberLikeCount = memberLikeCount;
	}

	public String getMemberLikeIds() {
		return memberLikeIds;
	}

	public void setMemberLikeIds(String memberLikeIds) {
		this.memberLikeIds = memberLikeIds;
	}

	public String getSellerFoodtruckCoordinate() {
		return sellerFoodtruckCoordinate;
	}

	public void setSellerFoodtruckCoordinate(String sellerFoodtruckCoordinate) {
		this.sellerFoodtruckCoordinate = sellerFoodtruckCoordinate;
	}

	public Timestamp getLocationUpdatedAt() {
		return locationUpdatedAt;
	}

	public void setLocationUpdatedAt(Timestamp locationUpdatedAt) {
		this.locationUpdatedAt = locationUpdatedAt;
	}

	@Override
	public String toString() {
		return "FoodtruckVO [sellerId=" + sellerId + ", foodtruckImgPath=" + foodtruckImgPath + ", foodtruckName="
				+ foodtruckName + ", foodtruckMainMenu=" + foodtruckMainMenu + ", menuCategory=" + menuCategory
				+ ", foodtruckLocation=" + foodtruckLocation + ", foodtruckMuni=" + foodtruckMuni + ", foodtruckGuCode="
				+ foodtruckGuCode + ", foodtruckOperationHour=" + foodtruckOperationHour + ", favoriteCount="
				+ favoriteCount + ", memberLikeCount=" + memberLikeCount + ", memberLikeIds=" + memberLikeIds
				+ ", sellerFoodtruckCoordinate=" + sellerFoodtruckCoordinate + ", locationUpdatedAt="
				+ locationUpdatedAt + "]";
	}
	
	
	
//	public FoodtruckVO(String foodtruckImgPath, String foodtruckName, String foodtruckMainMenu,
//			String foodtruckLocation, String foodtruckMuni, String foodtruckGuCode, String foodtruckOperationHour,
//			String sellerFoodtruckCoordinate) {
//		this(0, foodtruckImgPath, foodtruckName, foodtruckMainMenu, foodtruckLocation, foodtruckMuni, foodtruckGuCode, foodtruckOperationHour, 0, 0, foodtruckOperationHour, sellerFoodtruckCoordinate, null);
//	}
//	
//	public FoodtruckVO(int sellerId, String foodtruckImgPath, String foodtruckName, String foodtruckMainMenu,
//			String foodtruckLocation, String foodtruckMuni, String foodtruckGuCode, String foodtruckOperationHour,
//			int favoriteCount, int memberLikeCount, String memberLikeIds, String sellerFoodtruckCoordinate,
//			Timestamp locationUpdatedAt) {
//		super();
//		this.sellerId = sellerId;
//		this.foodtruckImgPath = foodtruckImgPath;
//		this.foodtruckName = foodtruckName;
//		this.foodtruckMainMenu = foodtruckMainMenu;
//		this.foodtruckLocation = foodtruckLocation;
//		this.foodtruckMuni = foodtruckMuni;
//		this.foodtruckGuCode = foodtruckGuCode;
//		this.foodtruckOperationHour = foodtruckOperationHour;
//		this.favoriteCount = favoriteCount;
//		this.memberLikeCount = memberLikeCount;
//		this.memberLikeIds = memberLikeIds;
//		this.sellerFoodtruckCoordinate = sellerFoodtruckCoordinate;
//		this.locationUpdatedAt = locationUpdatedAt;
//	}
//	
//	
//	public int getSellerId() {
//		return sellerId;
//	}
//	public void setSellerId(int sellerId) {
//		this.sellerId = sellerId;
//	}
//	public String getFoodtruckImgPath() {
//		return foodtruckImgPath;
//	}
//	public void setFoodtruckImgPath(String foodtruckImgPath) {
//		this.foodtruckImgPath = foodtruckImgPath;
//	}
//	public String getFoodtruckName() {
//		return foodtruckName;
//	}
//	public void setFoodtruckName(String foodtruckName) {
//		this.foodtruckName = foodtruckName;
//	}
//	public String getFoodtruckMainMenu() {
//		return foodtruckMainMenu;
//	}
//	public void setFoodtruckMainMenu(String foodtruckMainMenu) {
//		this.foodtruckMainMenu = foodtruckMainMenu;
//	}
//	public String getFoodtruckLocation() {
//		return foodtruckLocation;
//	}
//	public void setFoodtruckLocation(String foodtruckLocation) {
//		this.foodtruckLocation = foodtruckLocation;
//	}
//	public String getFoodtruckMuni() {
//		return foodtruckMuni;
//	}
//	public void setFoodtruckMuni(String foodtruckMuni) {
//		this.foodtruckMuni = foodtruckMuni;
//	}
//	public String getFoodtruckGuCode() {
//		return foodtruckGuCode;
//	}
//	public void setFoodtruckGuCode(String foodtruckGuCode) {
//		this.foodtruckGuCode = foodtruckGuCode;
//	}
//	public String getFoodtruckOperationHour() {
//		return foodtruckOperationHour;
//	}
//	public void setFoodtruckOperationHour(String foodtruckOperationHour) {
//		this.foodtruckOperationHour = foodtruckOperationHour;
//	}
//	public int getFavoriteCount() {
//		return favoriteCount;
//	}
//	public void setFavoriteCount(int favoriteCount) {
//		this.favoriteCount = favoriteCount;
//	}
//	public int getMemberLikeCount() {
//		return memberLikeCount;
//	}
//	public void setMemberLikeCount(int memberLikeCount) {
//		this.memberLikeCount = memberLikeCount;
//	}
//	public String getMemberLikeIds() {
//		return memberLikeIds;
//	}
//	public void setMemberLikeIds(String memberLikeIds) {
//		this.memberLikeIds = memberLikeIds;
//	}
//	public String getSellerFoodtruckCoordinate() {
//		return sellerFoodtruckCoordinate;
//	}
//	public void setSellerFoodtruckCoordinate(String sellerFoodtruckCoordinate) {
//		this.sellerFoodtruckCoordinate = sellerFoodtruckCoordinate;
//	}
//	public Timestamp getLocationUpdatedAt() {
//		return locationUpdatedAt;
//	}
//	public void setLocationUpdatedAt(Timestamp locationUpdatedAt) {
//		this.locationUpdatedAt = locationUpdatedAt;
//	}
//	
//	
//	@Override
//	public String toString() {
//		return "FoodtruckVO [sellerId=" + sellerId + ", foodtruckImgPath=" + foodtruckImgPath + ", foodtruckName="
//				+ foodtruckName + ", foodtruckMainMenu=" + foodtruckMainMenu + ", foodtruckLocation="
//				+ foodtruckLocation + ", foodtruckMuni=" + foodtruckMuni + ", foodtruckGuCode=" + foodtruckGuCode
//				+ ", foodtruckOperationHour=" + foodtruckOperationHour + ", favoriteCount=" + favoriteCount
//				+ ", memberLikeCount=" + memberLikeCount + ", memberLikeIds=" + memberLikeIds
//				+ ", sellerFoodtruckCoordinate=" + sellerFoodtruckCoordinate + ", locationUpdatedAt="
//				+ locationUpdatedAt + "]";
//	}
	
	
	//
	
	
	
	
	


	//
//	public FoodtruckVO() {}
//	public FoodtruckVO(int sellerId, String foodtruckImgPath, String foodtruckName) {
//		this(0, foodtruckImgPath, foodtruckName, "", "", "", 0, "", null);
//	}
//	
//	public FoodtruckVO(String foodtruckImgPath, String foodtruckName, String foodtruckMainMenu,
//			String foodtruckOperationHour) {
//		this(++selId, foodtruckImgPath, foodtruckName, foodtruckMainMenu, "",
//				foodtruckOperationHour, favCount, "", null);
//	}
//	
//	public FoodtruckVO(String foodtruckImgPath, String foodtruckName, String foodtruckMainMenu,
//			String foodtruckLocation, String foodtruckOperationHour, String sellerFoodtruckCoordinate) {
//		this(++selId, foodtruckImgPath, foodtruckName, foodtruckMainMenu, foodtruckLocation,
//				foodtruckOperationHour, favCount, sellerFoodtruckCoordinate, null);
//	}
//	
//	public FoodtruckVO(int sellerId, String foodtruckImgPath, String foodtruckName, String foodtruckMainMenu,
//			String foodtruckLocation, String foodtruckOperationHour, int favoriteCount,
//			String sellerFoodtruckCoordinate, Timestamp locationUpdatedAt) {
//		super();
//		this.sellerId = sellerId;
//		this.foodtruckImgPath = foodtruckImgPath;
//		this.foodtruckName = foodtruckName;
//		this.foodtruckMainMenu = foodtruckMainMenu;
//		this.foodtruckLocation = foodtruckLocation;
//		this.foodtruckOperationHour = foodtruckOperationHour;
//		this.favoriteCount = favoriteCount;
//		this.sellerFoodtruckCoordinate = sellerFoodtruckCoordinate;
//		this.locationUpdatedAt = locationUpdatedAt;
//	}
//
//	public int getSellerId() {
//		return sellerId;
//	}
//
//	public void setSellerId(int sellerId) {
//		this.sellerId = sellerId;
//	}
//
//	public String getFoodtruckImgPath() {
//		return foodtruckImgPath;
//	}
//
//	public void setFoodtruckImgPath(String foodtruckImgPath) {
//		this.foodtruckImgPath = foodtruckImgPath;
//	}
//
//	public String getFoodtruckName() {
//		return foodtruckName;
//	}
//
//	public void setFoodtruckName(String foodtruckName) {
//		this.foodtruckName = foodtruckName;
//	}
//
//	public String getFoodtruckMainMenu() {
//		return foodtruckMainMenu;
//	}
//
//	public void setFoodtruckMainMenu(String foodtruckMainMenu) {
//		this.foodtruckMainMenu = foodtruckMainMenu;
//	}
//
//	public String getFoodtruckLocation() {
//		return foodtruckLocation;
//	}
//
//	public void setFoodtruckLocation(String foodtruckLocation) {
//		this.foodtruckLocation = foodtruckLocation;
//	}
//
//	public String getFoodtruckOperationHour() {
//		return foodtruckOperationHour;
//	}
//
//	public void setFoodtruckOperationHour(String foodtruckOperationHour) {
//		this.foodtruckOperationHour = foodtruckOperationHour;
//	}
//
//	public int getFavoriteCount() {
//		return favoriteCount;
//	}
//
//	public void setFavoriteCount(int favoriteCount) {
//		this.favoriteCount = favoriteCount;
//	}
//
//	public String getSellerFoodtruckCoordinate() {
//		return sellerFoodtruckCoordinate;
//	}
//
//	public void setSellerFoodtruckCoordinate(String sellerFoodtruckCoordinate) {
//		this.sellerFoodtruckCoordinate = sellerFoodtruckCoordinate;
//	}
//
//	public Timestamp getLocationUpdatedAt() {
//		return locationUpdatedAt;
//	}
//
//	public void setLocationUpdatedAt(Timestamp locationUpdatedAt) {
//		this.locationUpdatedAt = locationUpdatedAt;
//	}
//
//	@Override
//	public String toString() {
//		return "FoodtruckVO [sellerId=" + sellerId + ", foodtruckImgPath=" + foodtruckImgPath + ", foodtruckName="
//				+ foodtruckName + ", foodtruckMainMenu=" + foodtruckMainMenu + ", foodtruckLocation="
//				+ foodtruckLocation + ", foodtruckOperationHour=" + foodtruckOperationHour + ", favoriteCount="
//				+ favoriteCount + ", sellerFoodtruckCoordinate=" + sellerFoodtruckCoordinate + ", locationUpdatedAt="
//				+ locationUpdatedAt + "]";
//	}
}
