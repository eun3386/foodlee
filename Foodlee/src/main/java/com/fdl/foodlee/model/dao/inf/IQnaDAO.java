package com.fdl.foodlee.model.dao.inf;

import java.util.List;

import com.fdl.foodlee.model.vo.QnaVO;

public interface IQnaDAO {
	// qna를 작성 할 수 있다.
	boolean insertNewQna(QnaVO qna);
	int insertNewQnaReturnKey(QnaVO qna); 
	// qna를 수정 할 수 있다.
	boolean updateQna(int id, String qnaContent);
	// qna를 삭제 할 수 있다.
	boolean deleteQna(int id, int depth);
	// qna 전체를 가져와 조회 할 수 있다.
	List<QnaVO> showAllQna(int sellerId);
	List<QnaVO> showAllQnaLogin(String login);
	
	// 판매자가 qna에 답변할 수 있다.
	boolean QnaReply(QnaVO qna);
}
