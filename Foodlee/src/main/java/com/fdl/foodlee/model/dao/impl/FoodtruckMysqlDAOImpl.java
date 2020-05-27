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
import com.fdl.foodlee.model.dao.inf.ISellerDAO;
import com.fdl.foodlee.model.vo.FoodtruckVO;
import com.fdl.foodlee.model.vo.SellerVO;

@Repository("ftJdbc")
public class FoodtruckMysqlDAOImpl implements IFoodtruckDAO {
	
	// SQL 정의부
	private static final String SQL_SELECT_ALL_FOODTRUCK 
	= "select * from foodtrucks"; 
	private static final String	SQL_INSERT_FOODTRUCK 
	= "insert into foodtrucks values(null,?,?,?,?,?,?,?,?,?,0,0,null,?,null)";
	private static final String	SQL_SELECT_FOODTRUCK_SELLER_ID 
	= "select * from foodtrucks where seller_id = ?";
	private static final String SQL_SELECT_FOODTRUCK_NAME 
	= "select * from foodtrucks where foodtruck_name = ?";
	private static final String	SQL_SELECT_FOODTRUCK_GU_CODE 
	= "select * from foodtrucks where foodtruck_gu_code = ?";
	private static final String	SQL_UPDATE_FOODTRUCK 
	= "update foodtrucks set foodtruck_img_path=?, foodtruck_name=?, "
		+ "foodtruck_main_menu=?, foodtruck_location=?, foodtruck_muni=?, "
		+ "foodtruck_gu_code=?, foodtruck_open_time=?, foodtruck_close_time=?, "
		+ "seller_foodtruck_coordinate=?";
	private static final String	SQL_DELETE_FOODTRUCK 
	= "delete from foodtrucks where foodtruck_name = ?";
	
	// 의존관계 자동주입...
	@Autowired
	private JdbcTemplate jtem;
	
	// 판매자의 새 푸드트럭을 등록 할 수 있다.
	@Override
	public boolean insertNewFoodtruck(FoodtruckVO ft) {
		int r = jtem.update(SQL_INSERT_FOODTRUCK,
					ft.getSellerId(), ft.getFoodtruckImgPath(),
					ft.getFoodtruckName(), ft.getFoodtruckMainMenu(), 
					ft.getMenuCategory(), ft.getFoodtruckLocation(), 
					ft.getFoodtruckMuni(), ft.getFoodtruckGuCode(), 
					ft.getFoodtruckOpenTime(),	ft.getFoodtruckCloseTime(),
					ft.getSellerFoodtruckCoordinate());
		return r == 1;
	}
	
	// 판매자가 자신의 푸드 트럭 정보를 업데이트 할 수 있다.
	@Override
	public boolean updateOneFoodtruck(FoodtruckVO ft) {
		int r = jtem.update(SQL_UPDATE_FOODTRUCK,
				ft.getFoodtruckImgPath(), ft.getFoodtruckName(),
				ft.getFoodtruckMainMenu(), ft.getMenuCategory(),
				ft.getFoodtruckLocation(), ft.getFoodtruckMuni(),
				ft.getFoodtruckGuCode(), ft.getFoodtruckOpenTime(),	
				ft.getFoodtruckCloseTime(), ft.getSellerFoodtruckCoordinate(), 
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

	// 판매자의 ID를 받아 푸드트럭 정보를 조회 할 수 있다.
	@Override
	public FoodtruckVO selectOneFoodtruck(int sellerId) {
		return (FoodtruckVO) jtem.queryForObject(SQL_SELECT_FOODTRUCK_SELLER_ID, 
				BeanPropertyRowMapper
				.newInstance(FoodtruckVO.class), sellerId);
	}

	// 푸드트럭 이름을 받아 푸드트럭 정보를 조회 할 수 있다.
	@Override
	public FoodtruckVO selectOneFoodtruck(String foodtruckName) {
		return (FoodtruckVO) jtem.queryForObject(SQL_SELECT_FOODTRUCK_NAME, 
				BeanPropertyRowMapper
				.newInstance(FoodtruckVO.class), foodtruckName);
	}
	// 구 코드를 받아 푸드트럭 정보를 조회 할 수 있다.
	@Override
	public FoodtruckVO selectOneFoodtruckWithGuCode(int guCode) {
		try {
		return jtem.queryForObject(SQL_SELECT_FOODTRUCK_GU_CODE, 
				BeanPropertyRowMapper
				.newInstance(FoodtruckVO.class), guCode);
		} catch(EmptyResultDataAccessException e){
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
		return jtem.query(SQL_SELECT_FOODTRUCK_GU_CODE, 
				BeanPropertyRowMapper
				.newInstance(FoodtruckVO.class), guCode);
	}
	// 등록된 푸드 트럭 리스트를 조회 할수 있다
	@Override
	public List<FoodtruckVO> searchAddAllFoodtruckList() {
		return jtem.query(SQL_SELECT_ALL_FOODTRUCK, BeanPropertyRowMapper.newInstance(FoodtruckVO.class));
	}

}












