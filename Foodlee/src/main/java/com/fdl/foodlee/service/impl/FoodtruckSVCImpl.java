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
		return ftDao.insertNewFoodtruck(ft);
	}

	@Override
	public FoodtruckVO selectOneFoodtruck(int sellerId) {
		FoodtruckVO foodtruckVO = ftDao.selectOneFoodtruck(sellerId);
		return foodtruckVO;
	}

	@Override
	public FoodtruckVO selectOneFoodtruck(String foodtruckName) {
		FoodtruckVO foodtruckVO = ftDao.selectOneFoodtruck(foodtruckName);
		return foodtruckVO;
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
	
	// 푸드 트럭 리스트 조회 페이지네이션
	public List<FoodtruckVO> showTop10Foodtrucks(int toppn) {
		int offset = (toppn-1) * TOP_CONTENT_PAGE_SIZE; // pn이 뭔지 offset은 어떤건지..
		int maxTopPg = checkMaxTop10PageNumber();
		List<FoodtruckVO> topFtList
			= ftDao.showAllFoodtrucks(offset, toppn == maxTopPg ? LAST_TOP_CONTENT_PAGE_SIZE : TOP_CONTENT_PAGE_SIZE);
		System.out.println("ftsvc: toppn "+ toppn + 
					" foodtrucks = "
					+ topFtList.size());
		return topFtList;
	}
	
	@Override 
	public List<FoodtruckVO> showCategoryFoodtrucks(int mc, int pn) {
		int offset = (pn-1) * MENU_CONTENT_PAGE_SIZE;
		List<FoodtruckVO> ftList
			= ftDao.showCategoryFoodtrcuks(mc, offset, MENU_CONTENT_PAGE_SIZE);
		System.out.println("ftsvc: pn " + pn +
					" foodtrucks = "
					+ ftList.size());
		return ftList;
	}
	
	// 현재 최대 페이지 번호
		
	// Top10 리스트에 따른 페이지
	public int checkMaxTop10PageNumber() {
		int totalRecords = ftDao.checkNumberOfFoodtrucks();
		int maxTopPg = (totalRecords / TOP_CONTENT_PAGE_SIZE) + (totalRecords % TOP_CONTENT_PAGE_SIZE == 0 ? 0 : 1);
		return maxTopPg;
	}
	// 메뉴에 따른 페이지
	@Override
	public int checkMaxPageNumberForMenu(int menuCategory) {
		int totalRecords = ftDao.checkNumberOfFoodtrucksForMenu(menuCategory);
		int maxPg = (totalRecords / MENU_CONTENT_PAGE_SIZE) + (totalRecords % MENU_CONTENT_PAGE_SIZE == 0 ? 0 : 1);
		return maxPg;
	}
}














