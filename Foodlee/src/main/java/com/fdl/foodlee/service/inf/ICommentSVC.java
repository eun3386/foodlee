package com.fdl.foodlee.service.inf;

import java.util.List;

import com.fdl.foodlee.model.vo.CommentVO;

public interface ICommentSVC {
	
	List<CommentVO> getCommentList(int commentNum);
	
	int saveComment(CommentVO commentVO);
	
	int updateComment(CommentVO commentVO);
	
	int deleteComment(int commentId);
	
}
