package com.fdl.foodlee.model.dao.inf;

import java.util.List;
import java.util.Map;

import com.fdl.foodlee.model.vo.FoodtruckVO;

public interface IFoodtruckDAO {
	// 판매자의 새 푸드트럭을 등록 할 수 있다.
	public boolean insertNewFoodtruck(FoodtruckVO ft);
	// 판매자의 ID를 받아 푸드트럭 정보를 조회 할 수 있다.
	public FoodtruckVO selectOneFoodtruck(int sellerId);
	// 푸드트럭 이름을 받아 푸드트럭 정보를 조회 할 수 있다.
	public FoodtruckVO selectOneFoodtruck(String foodtruckName);
	// 구 코드를 받아 푸드트럭 정보를 조회 할 수 있다.
	public FoodtruckVO selectOneFoodtruckWithGuCode(int guCode);
	// 판매자가 자신의 푸드 트럭 정보를 업데이트 할 수 있다.
	public boolean updateOneFoodtruck(FoodtruckVO ft);
	// 판매자가 등록된 자신의 푸드 트럭을 삭제 할 수 있다.
	public boolean deleteOneFoodtruck(FoodtruckVO ft);
	// 구매자가 푸드 트럭을 좋아요 할 수 있다.
	public boolean likeFoodtruck(int ftId, int mbId);
	// 구매자가 푸드 트럭 리스트를 검색 할 수 있다.
	public List<FoodtruckVO> searchAllFoodtruck(String foodtruckMainMenu);
	
	public List<FoodtruckVO> searchAllFoodtruckWithGuCode(int guCode);
	// 등록된 푸드 트럭 리스트를 조회 할수 있다
	public List<FoodtruckVO> searchAddAllFoodtruckList();
	// 푸드 트럭 리스트 조회 (페이지네이션)
	List<FoodtruckVO> showAllFoodtrucks(
			int offset, int limit);
	
	public List<FoodtruckVO> showCategoryFoodtrcuks(int category, int offset, int limit);
	
	int checkNumberOfFoodtrucks();
	public int checkNumberOfFoodtrucksForMenu(int menuCategory);
}
