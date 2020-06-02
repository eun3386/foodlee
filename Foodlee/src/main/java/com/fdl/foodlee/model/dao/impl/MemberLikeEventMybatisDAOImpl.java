package com.fdl.foodlee.model.dao.impl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.dao.inf.IMemberLikeEventDAO;

@Repository("mbLikeEvMybatis")
public class MemberLikeEventMybatisDAOImpl implements IMemberLikeEventDAO {

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
	public String currentLikeMembers(int event_id) {
		// return jtem.queryForObject(SQL_CURRENT_LIKE_MEMBERS, String.class, id);
		return sstem.selectOne("IMemberLikeEventDAO.SQL_CurrentLikeMembers", event_id);
	}

	@Override
	public int countLikeEvent(int event_id) {
		return sstem.selectOne("IMemberLikeEventDAO.SQL_countLikeFoodtruck", event_id);
		// return jtem.queryForObject(SQL_COUNT_LIKE_FOODTRUCK, Integer.class, id);
	}

	@Override
	public boolean memberLikeADD(Map<String, Object> pMap) {
		// int r = jtem.update(SQL_MEMBER_LIKE_ADD, pMap);
		int r = sstem.update("IMemberLikeEventDAO.SQL_MemberLikeADD", pMap);
		return r == 1;
	}

	@Override
	public boolean memberLikeRemove(Map<String, Object> pMap) {
		int r = sstem.update("IMemberLikeEventDAO.SQL_MemberLikeRemove", pMap);
		return r == 1;
		// int r = jtem.update(SQL_MEMBER_LIKE_REMOVE, pMap);
	}
}
