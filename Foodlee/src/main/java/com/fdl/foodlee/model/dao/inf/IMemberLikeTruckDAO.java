package com.fdl.foodlee.model.dao.inf;

import java.util.Map;

public interface IMemberLikeTruckDAO {
	String currentLikeMembers(int id);
	int countLikeFoodtruck(int id);
	boolean memberLikeADD(Map<String,Object> pMap);
	boolean memberLikeRemove(Map<String,Object> pMap);
}
