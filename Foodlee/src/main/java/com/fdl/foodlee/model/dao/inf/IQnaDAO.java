package com.fdl.foodlee.model.dao.inf;

import java.util.List;

import com.fdl.foodlee.model.vo.QnaVO;

public interface IQnaDAO {
	
	// 리뷰를 작성 할 수 있다.
	boolean insertNewQna(QnaVO qna);
	// 리뷰를 수정 할 수 있다.
	boolean updateQna(int id, String qnaContent);
	// 리뷰를 삭제 할 수 있다.
	boolean deleteQna(int id);
	// 리뷰 전체를 가져와 조회 할 수 있다.
	List<QnaVO> showAllQna();
}
