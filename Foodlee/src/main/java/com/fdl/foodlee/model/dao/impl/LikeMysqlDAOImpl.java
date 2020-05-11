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
		return null;
	}

	@Override
	public int getLikeMenuNum(int likeMenuNum) {
		return 0;
	}

	@Override
	public boolean showLikePic(String likeMenuPic) {
		return false;
	}

	@Override
	public boolean showLikeFtN(String likeFoodtruckName) {
		return false;
	}

	@Override
	public boolean showLikeMenuN(String likeMenuName) {
		return false;
	}

	@Override
	public boolean showLikeMenuPrice(int likeMenuPrice) {
		return false;
	}

	@Override
	public boolean showLikeMenu(String likeMenuPic, String likeFoodtruckName, String likeMenuName, int likeMenuPrice) {
		return false;
	}

	@Override
	public boolean deleteLike(int likeId) {
		return false;
	}
	

	
	
}