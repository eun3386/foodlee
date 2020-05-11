package com.fdl.foodlee.model.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.dao.inf.ILikeDAO;
import com.fdl.foodlee.model.vo.LikeVO;

@Repository
public abstract class LikeMysqlDAOImpl implements ILikeDAO {
	@Autowired
	private JdbcTemplate jtem;
	
	@Override
	public int getLikeMenuNum(LikeVO vo)  {
		return 0;
	}
	
	@Override
	public boolean showLikePic() {
		return false;
	}
	
	@Override
	public boolean showLikeFtN() {
		return false;
	}
}