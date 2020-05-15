package com.fdl.foodlee.model.dao.inf;

import java.util.List;

import com.fdl.foodlee.model.vo.CommentVO;

public interface ICommentDAO {
	// 댓글 리스트
	List<CommentVO> getCommentList(int commentNum);
	// 댓글 저장
	int saveComment(CommentVO commentVO);
	// 댓글 수정
	int updateComment(CommentVO commentVO);
	// 댓글 삭제
	int deleteComment(int commentId);
}
