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

}
