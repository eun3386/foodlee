package com.fdl.foodlee.service.inf;

import java.util.List;
import java.util.Map;

import com.fdl.foodlee.model.vo.FoodtruckVO;

public interface IFoodtruckSVC {
	public final String GU_SEP = ",";
	
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
	
	public List<FoodtruckVO> searchAllFoodtruckFromCategory(int menuCategory);

	public List<FoodtruckVO> searchAllFoodtruckWithGuCode(int guCode);
	// 등록된 푸드 트럭 리스트를 조회 할수 있다
	public List<FoodtruckVO> searchAddAllFoodtruckList();
	// 페이지 네이션
	public static final int MENU_CONTENT_PAGE_SIZE = 8;
	public static final int TOP_CONTENT_PAGE_SIZE = 4;
	public static final int LAST_TOP_CONTENT_PAGE_SIZE = 2;
	List<FoodtruckVO> showTop10Foodtrucks(int pn);
	
	List<FoodtruckVO> showCategoryFoodtrucks(int mc, int pn);
	// 현재 최대 페이지 번호
	public int checkMaxTop10PageNumber();
	public int checkMaxPageNumberForMenu(int menuCategory);

}
