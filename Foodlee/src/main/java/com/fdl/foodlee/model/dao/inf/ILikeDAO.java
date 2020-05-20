package com.fdl.foodlee.model.dao.inf;

import java.util.List;

import com.fdl.foodlee.model.vo.LikeVO;

public interface ILikeDAO {
	// 좋아요 한 것을 리스트로 나열 할 수 있다.
	List<LikeVO> showLikeList();
	
	// 좋아요를 누를수 있다.
	boolean checkLike(int likeMemberId, int likeFoodtruckId);
	
	// 좋아요 한 것을 취소(삭제) 할 수 있다.
	boolean deleteLike(int likeId, int likeMemberId, int likeFoodtruckId);
		
	// 좋아요 한 메뉴 이름을 불러올 수 있다.
	int getLikeMenuName(String likeMenuName);
	
	// 좋아요 한 메뉴 사진을 불러올 수 있다.
	boolean showLikePic(String likeMenuPic);
	
	// 좋아요 한 메뉴의 푸드트럭 이름을 불러올 수 있다.
	boolean showLikeFtN(String likeFoodtruckName);
	
	// 좋아요 한 메뉴 이름을 불러올 수 있다.
	boolean showLikeMenuN(String likeMenuName);
	
	// 좋아요 한 메뉴 가격을 불러올 수 있다.
	boolean showLikeMenuPrice(int likeMenuPrice);
	
	// 좋아요 한 것을 불러올 수 있다.
	boolean showLikeMenu(String likeMenuPic, String likeFoodtruckName, String likeMenuName, int likeMenuPrice);
	
	
}
