package com.fdl.foodlee.model.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.dao.inf.ICommentDAO;
import com.fdl.foodlee.model.vo.CommentVO;

@Repository
public class CommentMysqlDAOImpl implements ICommentDAO {
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<CommentVO> getCommentList(int commentNum) {
		return sqlSession.selectList("", commentNum);
	}

	@Override
	public int saveComment(CommentVO commentVO) {
		return sqlSession.insert("", commentVO);
	}

	@Override
	public int updateComment(CommentVO commentVO) {
		return sqlSession.update("", commentVO);
	}

	@Override
	public int deleteComment(int commentId) {
		return sqlSession.delete("", commentId);
	}
}
