package com.fdl.foodlee.model.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.dao.inf.IFoodtruckDAO;
import com.fdl.foodlee.model.vo.FoodtruckVO;

@Repository("ftJdbc")

public class FoodtruckMysqlDAOImpl implements IFoodtruckDAO {
	
/*
private int sellerId; // 판매자 번호 ⇔ integer seller_id NN <<FK>>
private String foodtruckImgPath; // 푸드트럭 이미지 경로 ⇔ varchar (256) foodtruck_img_path  NN
private String foodtruckName; // 푸드트럭 이름 ⇔ varchar (64) foodtruck_name NN
private String foodtruckMainMenu; // 푸드트럭 대표메뉴 ⇔ varchar (512) foodtruck_main_menu NN
private int menuCategory; // 대표메뉴의 카테고리 ⇔ integer menu_category NN
private String foodtruckLocation; // 푸드트럭 위치 ⇔ varchar(256) foodtruck_location NN
private String foodtruckMuni; // 푸드트럭 구 이름 ⇔ varchar(256) foodtruck_muni NN
private String foodtruckGuCode; // 구 코드 ⇔ int foodtruck_gu_code NN
private String foodtruckOperationHour; // 푸드트럭 영업시간 ⇔ varchar (64)  foodtruck_operation_hour NN	
private int memberLikeCount; // 좋아요 횟수⇔ member_like_count 
private String memberLikeIds; // 좋아요 한 회원의 ID목록들⇔ varchar(512) member_like_ids
private String sellerFoodtruckCoordinate; // 판매자 푸드트럭 좌표 ⇔ varchar(1024) seller_foodtruck_coordinate NN
private Timestamp locationUpdatedAt; // 위치이동날짜 ⇔ timestamp location_updated_at CURRENT_TIMESTAMP
*/
	
	// SQL부
	private static final String SQL_SELECT_ALL_FOODTRUCK =
			"select * from foodtrucks"; 
	private static final String
		SQL_INSERT_FOODTRUCK = "insert into foodtrucks values(?,?,?,?,?,?,?,?,0,null,?,null,?)";
	private static final String
		SQL_SELECT_FOODTRUCK_SELLER_ID = "select * from foodtrucks where seller_id = ?";
	private static final String
		SQL_SELECT_FOODTRUCK_NAME = "select * from foodtrucks where foodtruck_name = ?";
	private static final String
		SQL_SELECT_FOODTRUCK_GU_CODE = "select * from foodtrucks where foodtruck_gu_code = ?";
	private static final String
		SQL_UPDATE_FOODTRUCK = "update foodtrucks set foodtruck_img_path=?, foodtruck_name=?, "
				+ "foodtruck_main_menu=?, menu_category=?, foodtruck_location=?, foodtruck_muni=?,"
				+ "foodtruck_gu_code=?,foodtruck_operation_hour=?, "
				+ "seller_foodtruck_coordinate=?";
	private static final String
		SQL_DELETE_FOODTRUCK = "delete from foodtrucks where foodtruck_name = ?";
//	private static final String
//		SQL_FOODTRUCK_SHOWALL_PAGE = "select * from foodtrucks order by favorite_count desc limit ?, ?";
	private static final String
		SQL_CHECK_FOODTRUCK_NUMBERS = "select count(member_like_count) as cnt from foodtrucks where member_like_count";
	private static final String
		SQL_CHECK_FOODTRUCK_NUMBERS_FOR_MENU = "select count(seller_id) as cnt from foodtrucks where menu_category = ?";
	private static final String
	SQL_SHOW_ALL_FOODTRUCK_ORDER_BY_MEMBER_LIKE_COUNT = "select * from foodtrucks A order by A.member_like_count desc limit ?, ?";
	private static final String
	SQL_SHOW_CATEGORY_FOODTRUCK_ORDER_BY_MEMBER_LIKE_COUNT = "select * from foodtrucks where menu_category = ? order by member_like_count desc limit ?, ?";

//	public static final int TOP_TRUCK_OFFSET = 10;
	// SQL 정의부

	// 의존관계 자동주입...
	@Autowired
	private JdbcTemplate jtem;

	// 판매자의 새 푸드트럭을 등록 할 수 있다.
	@Override
	public boolean insertNewFoodtruck(FoodtruckVO ft) {
		int r = jtem.update(SQL_INSERT_FOODTRUCK,
					ft.getSellerId(), ft.getFoodtruckImgPath(), ft.getFoodtruckName(),
					ft.getFoodtruckMainMenu(),  ft.getFoodtruckLocation(),
					ft.getFoodtruckMuni(), ft.getFoodtruckGuCode(), ft.getFoodtruckOperationHour(),
					 ft.getSellerFoodtruckCoordinate(),
					 ft.getMenuCategory());
		return r == 1; 
	}

	// 판매자가 자신의 푸드 트럭 정보를 업데이트 할 수 있다.
	@Override
	public boolean updateOneFoodtruck(FoodtruckVO ft) {
		int r = jtem.update(SQL_UPDATE_FOODTRUCK, ft.getFoodtruckImgPath(), ft.getFoodtruckName(),
				ft.getFoodtruckMainMenu(), ft.getMenuCategory(), ft.getFoodtruckLocation(), ft.getFoodtruckMuni(),
				ft.getFoodtruckGuCode(), ft.getFoodtruckOperationHour(), ft.getSellerFoodtruckCoordinate(),
				ft.getLocationUpdatedAt());
		return r == 1;
	}

	// 판매자가 등록된 자신의 푸드 트럭을 삭제 할 수 있다.
	@Override
	public boolean deleteOneFoodtruck(FoodtruckVO ft) {
		int r = jtem.update(SQL_DELETE_FOODTRUCK, ft.getFoodtruckName());
		return r == 1;
	}

	// 판매자의 ID를 받아 푸드트럭 정보를 조회 할 수 있다.
	@Override
	public FoodtruckVO selectOneFoodtruck(int sellerId) {
		try {
			return (FoodtruckVO) jtem.queryForObject(SQL_SELECT_FOODTRUCK_SELLER_ID,
					BeanPropertyRowMapper.newInstance(FoodtruckVO.class), sellerId);
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	// 푸드트럭 이름을 받아 푸드트럭 정보를 조회 할 수 있다.
	@Override
	public FoodtruckVO selectOneFoodtruck(String foodtruckName) {
		try {
			return (FoodtruckVO) jtem.queryForObject(SQL_SELECT_FOODTRUCK_NAME,
					BeanPropertyRowMapper.newInstance(FoodtruckVO.class), foodtruckName);
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	// 구 코드를 받아 푸드트럭 정보를 조회 할 수 있다.
	@Override
	public FoodtruckVO selectOneFoodtruckWithGuCode(int guCode) {
		try {
			return jtem.queryForObject(SQL_SELECT_FOODTRUCK_GU_CODE,
					BeanPropertyRowMapper.newInstance(FoodtruckVO.class), guCode);
		} catch (EmptyResultDataAccessException e) {
			System.out.println("등록된 구가 아닙니다.");
			return null;
		}
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

	@Override
	public List<FoodtruckVO> searchAllFoodtruckWithGuCode(int guCode) {
		return jtem.query(SQL_SELECT_FOODTRUCK_GU_CODE, BeanPropertyRowMapper.newInstance(FoodtruckVO.class), guCode);
	}

	// 등록된 푸드 트럭 리스트를 조회 할수 있다
	@Override
	public List<FoodtruckVO> searchAddAllFoodtruckList() {
		return jtem.query(SQL_SELECT_ALL_FOODTRUCK, BeanPropertyRowMapper.newInstance(FoodtruckVO.class));
	}
	
	// 푸드 트럭 리스트 조회 (페이지네이션)
	@Override
	public List<FoodtruckVO> 
	showAllFoodtrucks(
		int offset, int limit) {
//		offset = TOP_TRUCK_OFFSET;
	return jtem.query(SQL_SHOW_ALL_FOODTRUCK_ORDER_BY_MEMBER_LIKE_COUNT, BeanPropertyRowMapper.newInstance(FoodtruckVO.class)
			, offset, limit);
	}
	
	@Override
	public List<FoodtruckVO> showCategoryFoodtrcuks(int category, int offset, int limit) {
		return jtem.query(SQL_SHOW_CATEGORY_FOODTRUCK_ORDER_BY_MEMBER_LIKE_COUNT, BeanPropertyRowMapper.newInstance(FoodtruckVO.class),
				category, offset, limit);
	}
	
	@Override
	public int checkNumberOfFoodtrucks() {
		return jtem.queryForObject(SQL_CHECK_FOODTRUCK_NUMBERS, Integer.class);
	}

	@Override
	public int checkNumberOfFoodtrucksForMenu(int menuCategory) {
		// TODO Auto-generated method stub
		return jtem.queryForObject(SQL_CHECK_FOODTRUCK_NUMBERS_FOR_MENU, Integer.class, menuCategory);
	}

}
