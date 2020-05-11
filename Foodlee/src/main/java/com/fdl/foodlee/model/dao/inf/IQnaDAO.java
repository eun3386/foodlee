package com.fdl.foodlee.model.dao.inf;

import java.util.List;

import com.fdl.foodlee.model.vo.QnaVO;

public interface IQnaDAO {
	
	// QnA를 작성 할 수 있다.
	boolean insertNewQna(QnaVO qna);
	// QnA를 수정 할 수 있다.
	boolean updateQna(int id, String qnaContent);
	// QnA를 삭제 할 수 있다.
	boolean deleteQna(int id);
	// QnA 전체를 가져와 조회 할 수 있다.
	List<QnaVO> showAllQna();
}
