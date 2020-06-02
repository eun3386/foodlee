package com.fdl.foodlee.model.dao.inf;

import java.util.Map;

public interface IMemberLikeEventDAO {
	String currentLikeMembers(int id);
	int countLikeEvent(int id);
	boolean memberLikeADD(Map<String,Object> pMap);
	boolean memberLikeRemove(Map<String,Object> pMap);
}
