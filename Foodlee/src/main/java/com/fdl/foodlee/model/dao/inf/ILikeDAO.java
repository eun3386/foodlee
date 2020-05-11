package com.fdl.foodlee.model.dao.inf;

import java.util.List;

import com.fdl.foodlee.model.vo.LikeVO;

public interface ILikeDAO {
	// 좋아요 한 것을 리스트로 나열 할 수 있다.
	List<LikeVO> showLikeList();
	
	// 좋아요 한 메뉴 번호를 불러올 수 있다.
	int showLikeMenuNum();
	
	// 좋아요 한 메뉴 사진을 불러올 수 있다.
	boolean showLikePic();
	
	// 좋아요 한 메뉴의 푸드트럭 이름을 불러올 수 있다.
	boolean showLikeFtN();
	
	// 좋아요 한 메뉴 이름을 불러올 수 있다.
	boolean showLikeMenuN();
	
	// 좋아요 한 메뉴 가격을 불러올 수 있다.
	boolean showLikeMenuPrice();
	
	// 좋아요 한 것을 취소(삭제) 할 수 있다.
	boolean deleteLike();
}
