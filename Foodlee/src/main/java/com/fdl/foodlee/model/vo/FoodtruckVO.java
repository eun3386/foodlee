package com.fdl.foodlee.model.vo;

import java.sql.Timestamp;

public class FoodtruckVO {
	
	private int sellerId; // 판매자 번호 ⇔ integer seller_id NN <<FK>>
	private String foodtruckImgPath; // 푸드트럭 이미지 경로 ⇔ varchar (256) foodtruck_img_path  NN
	private String foodtruckName; // 푸드트럭 이름 ⇔ varchar (64) foodtruck_name NN
	private String foodtruckMainMenu; // 푸드트럭 대표메뉴 ⇔ varchar (512) foodtruck_main_menu NN
	private String foodtruckLocation; // 푸드트럭 위치 ⇔ varchar(256) foodtruck_location NN
	private String foodtruckOperationHour; // 푸드트럭 영업시간 ⇔ varchar (64)  foodtruck_operation_hour NN	
	private int favoriteCount; // 좋아요 트럭 ⇔ integer favorite_count <<FK>>
	private String sellerFoodtruckCoordinate; // 판매자 푸드트럭 좌표 ⇔ varchar(1024) seller_foodtruck_coordinate NN
	private Timestamp locationUpdatedAt; // 위치이동날짜 ⇔ timestamp location_updated_at CURRENT_TIMESTAMP
	
	
	//
	static int selId = 0;
	static int favCount = 0;
	
	public FoodtruckVO() {}
	
	public FoodtruckVO(int sellerId, String foodtruckImgPath, String foodtruckName) {
		this(0, foodtruckImgPath, foodtruckName, "", "", "", 0, "", null);
	}
	
	public FoodtruckVO(String foodtruckImgPath, String foodtruckName, String foodtruckMainMenu,
			String foodtruckOperationHour) {
		this(++selId, foodtruckImgPath, foodtruckName, foodtruckMainMenu, "",
				foodtruckOperationHour, favCount, "", null);
	}
	
	public FoodtruckVO(String foodtruckImgPath, String foodtruckName, String foodtruckMainMenu,
			String foodtruckLocation, String foodtruckOperationHour, String sellerFoodtruckCoordinate) {
		this(++selId, foodtruckImgPath, foodtruckName, foodtruckMainMenu, foodtruckLocation,
				foodtruckOperationHour, favCount, sellerFoodtruckCoordinate, null);
	}
	
	public FoodtruckVO(int sellerId, String foodtruckImgPath, String foodtruckName, String foodtruckMainMenu,
			String foodtruckLocation, String foodtruckOperationHour, int favoriteCount,
			String sellerFoodtruckCoordinate, Timestamp locationUpdatedAt) {
		super();
		this.sellerId = sellerId;
		this.foodtruckImgPath = foodtruckImgPath;
		this.foodtruckName = foodtruckName;
		this.foodtruckMainMenu = foodtruckMainMenu;
		this.foodtruckLocation = foodtruckLocation;
		this.foodtruckOperationHour = foodtruckOperationHour;
		this.favoriteCount = favoriteCount;
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

	public String getFoodtruckLocation() {
		return foodtruckLocation;
	}

	public void setFoodtruckLocation(String foodtruckLocation) {
		this.foodtruckLocation = foodtruckLocation;
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
				+ foodtruckName + ", foodtruckMainMenu=" + foodtruckMainMenu + ", foodtruckLocation="
				+ foodtruckLocation + ", foodtruckOperationHour=" + foodtruckOperationHour + ", favoriteCount="
				+ favoriteCount + ", sellerFoodtruckCoordinate=" + sellerFoodtruckCoordinate + ", locationUpdatedAt="
				+ locationUpdatedAt + "]";
	}
}
