package com.fdl.foodlee.model.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.dao.inf.IFoodtruckDAO;
import com.fdl.foodlee.model.vo.FoodtruckVO;
@Repository
public class FoodtruckMysqlDAOImpl implements IFoodtruckDAO {

	
	
/*
private int sellerId; // 판매자 번호 ⇔ integer seller_id NN <<FK>>
private String foodtruckImgPath; // 푸드트럭 이미지 경로 ⇔ varchar (256) foodtruck_img_path  NN
private String foodtruckName; // 푸드트럭 이름 ⇔ varchar (64) foodtruck_name NN
private String foodtruckMainMenu; // 푸드트럭 대표메뉴 ⇔ varchar (512) foodtruck_main_menu NN
private String foodtruckLocation; // 푸드트럭 위치 ⇔ varchar(256) foodtruck_location NN
private String foodtruckOperationHour; // 푸드트럭 영업시간 ⇔ varchar (64)  foodtruck_operation_hour NN	
private int favoriteCount; // 좋아요 트럭 ⇔ integer favorite_count <<FK>>
private String sellerFoodtruckCoordinate; // 판매자 푸드트럭 좌표 ⇔ varchar(1024) seller_foodtruck_coordinate NN
private Timestamp locationUpdatedAt; // 위치이동날짜 ⇔ timestamp location_updated_at CURRENT_TIMESTAMP
 */
	
	// SQL부
	private static final String
		SQL_INSERT_FOODTRUCK = "insert into foodtrucks values(null,?,?,?,'',?,0,'',now())";
	private static final String
		SQL_SELECT_FOODTRUCK_SELLER_ID = "select * from foodtrucks where seller_id = ?";
	private static final String
		SQL_SELECT_FOODTRUCK_NAME = "select * from foodtrucks where foodtruck_name = ?";
	private static final String
		SQL_UPDATE_FOODTRUCK = "update foodtrucks set foodtruck_img_path=?, foodtruck_name=?, "
				+ "foodtruck_main_menu, foodtruck_location='', foodtruck_operation_hour=?, "
				+ "seller_foodtruck_coordinate='', location_updated_at=now()";
	private static final String
		SQL_DELETE_FOODTRUCK = "delete from foodtrucks where foodtruck_name = ?";
	
	// 의존관계 자동주입...
	@Autowired
	private JdbcTemplate jtem;
	
	// 판매자의 새 푸드트럭을 등록 할 수 있다.
	@Override
	public boolean insertNewFoodtruck(FoodtruckVO ft) {
		int r = jtem.update(SQL_INSERT_FOODTRUCK,
					ft.getSellerId(), ft.getFoodtruckImgPath(),
					ft.getFoodtruckName(), ft.getFoodtruckMainMenu(),
					ft.getFoodtruckLocation(), ft.getFoodtruckOperationHour(),
					ft.getFavoriteCount(), ft.getSellerFoodtruckCoordinate(),
					ft.getLocationUpdatedAt());
		return r == 1;
	}

	// 판매자의 ID를 받아 푸드트럭 정보를 조회 할 수 있다.
	@Override
	public FoodtruckVO selectOneFoodtruck(int sellerId) {
		return (FoodtruckVO) jtem.query(SQL_SELECT_FOODTRUCK_SELLER_ID, 
				BeanPropertyRowMapper
				.newInstance(FoodtruckVO.class), sellerId);
	}

	// 푸드트럭 이름을 받아 푸드트럭 정보를 조회 할 수 있다.
	@Override
	public FoodtruckVO selectOneFoodtruck(String foodtruckName) {
		return (FoodtruckVO) jtem.query(SQL_SELECT_FOODTRUCK_NAME, 
				BeanPropertyRowMapper
				.newInstance(FoodtruckVO.class), foodtruckName);
	}

	// 판매자가 자신의 푸드 트럭 정보를 업데이트 할 수 있다.
	@Override
	public boolean updateOneFoodtruck(FoodtruckVO ft) {
		int r = jtem.update(SQL_UPDATE_FOODTRUCK,
				ft.getFoodtruckImgPath(), ft.getFoodtruckName(),
				ft.getFoodtruckMainMenu(), ft.getFoodtruckLocation(),
				ft.getFoodtruckOperationHour(), ft.getSellerFoodtruckCoordinate(),
				ft.getLocationUpdatedAt());
		return r == 1;
	}
	
	// 판매자가 등록된 자신의 푸드 트럭을 삭제 할 수 있다.
	@Override
	public boolean deleteOneFoodtruck(FoodtruckVO ft) {
		int r = jtem.update(SQL_DELETE_FOODTRUCK,
				ft.getFoodtruckName());
		return r == 1;
	}
	
	// 구매자가 푸드 트럭을 좋아요 할 수 있다.
	@Override
	public boolean likeFoodtruck(int ftId, int mbId) {
		return false;
	}
	// 구매자가 푸드 트럭 리스트를 검색 할 수 있다.
	@Override
	public List<FoodtruckVO> searchAllFoodtruck(String foodtruckMainMenu) {
		return null;
	}
	
}












