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
	
	
}
