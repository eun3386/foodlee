package com.fdl.foodlee.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.fdl.foodlee.model.dao.inf.IFoodtruckDAO;
import com.fdl.foodlee.model.vo.FoodtruckVO;
import com.fdl.foodlee.service.inf.IFoodtruckSVC;
@Service
public class FoodtruckSVCImpl implements IFoodtruckSVC {
	@Autowired
	@Qualifier("ftJdbc")
	IFoodtruckDAO ftDao;
	// 의존관계 자동주입...
	@Autowired
	private JdbcTemplate jtem;
	
	// SQL부
	private static final String
		SQL_SEARCH_ALL_FOODTRUCK_FROM_CATEGORY = "select * from foodtrucks where menu_category = ?";

	@Override
	public boolean insertNewFoodtruck(FoodtruckVO ft) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public FoodtruckVO selectOneFoodtruck(int sellerId) {
		FoodtruckVO foodtruckVO = ftDao.selectOneFoodtruck(sellerId);
		return foodtruckVO;
	}

	@Override
	public FoodtruckVO selectOneFoodtruck(String foodtruckName) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public FoodtruckVO selectOneFoodtruckWithGuCode(int guCode) {
		return null;
	}
	
	@Override
	public boolean updateOneFoodtruck(FoodtruckVO ft) {
		// TODO Auto-generated method stub
		return false;
	}
	
	@Override
	public boolean deleteOneFoodtruck(FoodtruckVO ft) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean likeFoodtruck(int ftId, int mbId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<FoodtruckVO> searchAllFoodtruck(String foodtruckMainMenu) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 메뉴 카테고리를 받아 푸드 트럭 리스트를 조회 하는 함수
	@Override
	public List<FoodtruckVO> searchAllFoodtruckFromCategory(int menuCategory) {
		return jtem.query(SQL_SEARCH_ALL_FOODTRUCK_FROM_CATEGORY,
				BeanPropertyRowMapper
				.newInstance(FoodtruckVO.class), menuCategory);
	}
	
	@Override
	public List<FoodtruckVO> searchAllFoodtruckWithGuCode(int guCode) {
		List<FoodtruckVO> ftList = ftDao.searchAllFoodtruckWithGuCode(guCode);
//		FoodtruckVO fdTrucks = ftDao.selectOneFoodtruckWithGuCode(guCode);
//				List<FoodtruckVO> ftList = new ArrayList<FoodtruckVO>();
//				String guCodes = fdTrucks.getFoodtruckGuCode();
//		if(guCodes.indexOf(GU_SEP)==-1){
//			FoodtruckVO one = ftDao.selectOneFoodtruckWithGuCode(guCode);
//			ftList.add(one);
//		} else {
//			String guCodeList[] = guCodes.split(GU_SEP);
//			for(String gu:guCodeList) {
//				FoodtruckVO ft = ftDao.selectOneFoodtruckWithGuCode(Integer.parseInt(gu));
//				ftList.add(ft);
//			}
//		}
		return ftList;
	}

	@Override
	public List<FoodtruckVO> searchAddAllFoodtruckList() {
		// TODO Auto-generated method stub
		return ftDao.searchAddAllFoodtruckList();
	}

}
