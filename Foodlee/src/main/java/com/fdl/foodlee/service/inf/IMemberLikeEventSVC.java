package com.fdl.foodlee.service.inf;

import java.util.Map;

public interface IMemberLikeEventSVC {
	public final int LIKE_MB_EMPTY = 0; // black
	public final int LIKE_MB_FOUND_ONE = 1; // green
	public final int LIKE_MB_NOT_FOUND_OTHER_ONE = 2; // black
	public final int LIKE_MB_NOT_FOUND_OTHERS = 3; // black
	public final int LIKE_MB_FOUND_OTHERS = 4; // green
	public final String LIKE_SEP = ",";
	
	// 이벤트를 좋아요(follow) 할 수 있다. 	
	Map<String, Object> processMemberLike(int tgSr, int sesMb);// 추가/취소
	int isAlreadyLikedMember(int tgSr, int sesMb); // 유무 체크
	int countLikeMembers(int tgSr); // 누적 좋아요수
}
