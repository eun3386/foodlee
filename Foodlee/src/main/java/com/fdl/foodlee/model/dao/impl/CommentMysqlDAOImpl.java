package com.fdl.foodlee.model.dao.impl;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CommentMysqlDAOImpl {
	@Inject
	private SqlSession sqlSession;
}
