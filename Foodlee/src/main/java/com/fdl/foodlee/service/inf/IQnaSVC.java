package com.fdl.foodlee.service.inf;

import java.sql.Timestamp;
import java.util.List;

import com.fdl.foodlee.model.vo.QnaVO;

public interface IQnaSVC {
		// QnA를 작성 할 수 있다.
		boolean insertNewQna(QnaVO qna);
		int insertNewQnaReturnKey(QnaVO qnaGet);
		int insertNewQnaReturnKey(String login, int sellerId, int QnaDepth, String QnaPnum, String QnaContent,
				boolean QnaSecret, Timestamp QnaCreatedAt);
		// QnA를 수정 할 수 있다.
		boolean updateQna(int id, String qnaContent);
		// QnA를 삭제 할 수 있다.
		boolean deleteQna(int id, int depth);
		// QnA 전체를 가져와 조회 할 수 있다.
		List<QnaVO> showAllQna(int sellerId);
		List<QnaVO> showAllQnaLogin(String login);
		
		// 판매자가 QnA에 답변 할 수 있다.
		boolean QnaReply(QnaVO qna);
}
