package com.fdl.foodlee.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fdl.foodlee.model.dao.inf.IFoodtruckDAO;
import com.fdl.foodlee.model.vo.FoodtruckVO;
import com.fdl.foodlee.service.inf.IFoodtruckSVC;
@Service
public class FoodtruckSVCImpl implements IFoodtruckSVC {
	@Autowired
	@Qualifier("ftJdbc")
	IFoodtruckDAO ftDao;

	@Override
	public boolean insertNewFoodtruck(FoodtruckVO ft) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public FoodtruckVO selectOneFoodtruck(int sellerId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FoodtruckVO selectOneFoodtruck(String foodtruckName) {
		// TODO Auto-generated method stub
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

	@Override
	public List<FoodtruckVO> searchMuniFoodtruck(String foodtruckLocation) {
		List<FoodtruckVO> ftList = new ArrayList<FoodtruckVO>();
		if(foodtruckLocation == null || foodtruckLocation.isEmpty()) {
			System.out.println("구 정보 입력 안됨");
		} else {
			
	
				FoodtruckVO ft = ftDao.selectOneFoodtruck(foodtruckName);
			}
			
		}
		return null;
	}
	

}
