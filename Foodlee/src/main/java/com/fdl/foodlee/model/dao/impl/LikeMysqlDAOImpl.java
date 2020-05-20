package com.fdl.foodlee.model.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.dao.inf.ILikeDAO;
import com.fdl.foodlee.model.vo.LikeVO;

@Repository
public class LikeMysqlDAOImpl implements ILikeDAO {
	@Autowired
	private JdbcTemplate jtem;

	@Override
	public List<LikeVO> showLikeList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean checkLike(int likeMemberId, int likeFoodtruckId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteLike(int likeId, int likeMemberId, int likeFoodtruckId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getLikeMenuName(String likeMenuName) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean showLikePic(String likeMenuPic) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean showLikeFtN(String likeFoodtruckName) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean showLikeMenuN(String likeMenuName) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean showLikeMenuPrice(int likeMenuPrice) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean showLikeMenu(String likeMenuPic, String likeFoodtruckName, String likeMenuName, int likeMenuPrice) {
		// TODO Auto-generated method stub
		return false;
	}

	
	

	
	
}