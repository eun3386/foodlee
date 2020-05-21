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

	public static final String SQL_LIKE_CHECK = "insert into like" + " values(null, ?, ?, ?)";
	public static final String SQL_LIKE_DELETE = "delete from like where like_id = ?";
	public static final String SQL_LIKE_LIST = "SELECT * FROM like " + "ORDER BY IF";
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
	public int getLikeMenu(String likeMenuPic, String likeFoodtruckName, String likeMenuName, int likeMenuPrice) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int getLikeMenuName(String likeMenuName) {
		// TODO Auto-generated method stub
		return 0;
	}
	




	
	

	
	
}