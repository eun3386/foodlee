package com.fdl.foodlee.model.dao.impl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.dao.inf.IMemberLikeTruckDAO;

@Repository("mbLikeTrMybatis")
public class MemberLikeTruckMybatisDAOImpl implements IMemberLikeTruckDAO {

	/*
	 * public static final String SQL_CURRENT_LIKE_MEMBERS =
	 * "select member_like_ids from foodtrucks" + " where seller_id = ?"; public
	 * static final String SQL_COUNT_LIKE_FOODTRUCK =
	 * "select member_like_count from foodtrucks where seller_id = ?"; public static
	 * final String SQL_MEMBER_LIKE_ADD =
	 * "update foodtrucks set member_like_ids = ?" +
	 * ", member_like_count = member_like_count+1 where seller_id = ?"; public
	 * static final String SQL_MEMBER_LIKE_REMOVE =
	 * "update members set member_like_ids = ?" +
	 * ", member_like_count = member_like_count-1 where id = ?";
	 */
	
	@Autowired
	private SqlSessionTemplate sstem;

	@Override
	public String currentLikeMembers(int seller_id) {
		// return jtem.queryForObject(SQL_CURRENT_LIKE_MEMBERS, String.class, id);
		return sstem.selectOne("IMemberLikeTruckDAO.SQL_CurrentLikeMembers", seller_id);
	}

	@Override
	public int countLikeFoodtruck(int seller_id) {
		return sstem.selectOne("IMemberLikeTruckDAO.SQL_countLikeFoodtruck", seller_id);
		// return jtem.queryForObject(SQL_COUNT_LIKE_FOODTRUCK, Integer.class, id);
	}

	@Override
	public boolean memberLikeADD(Map<String, Object> pMap) {
		// int r = jtem.update(SQL_MEMBER_LIKE_ADD, pMap);
		int r = sstem.update("IMemberLikeTruckDAO.SQL_MemberLikeADD", pMap);
		return r == 1;
	}

	@Override
	public boolean memberLikeRemove(Map<String, Object> pMap) {
		int r = sstem.update("IMemberLikeTruckDAO.SQL_MemberLikeRemove", pMap);
		return r == 1;
		// int r = jtem.update(SQL_MEMBER_LIKE_REMOVE, pMap);
	}
}
