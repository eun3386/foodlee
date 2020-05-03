package com.fdl.foodlee.model.dao.inf;

import java.util.List;

import com.fdl.foodlee.model.vo.QaVO;

public interface IQaDAO {
	
//	회원이 신규 게시글을 등록 할 수 있다
	boolean insertNewQa(QaVO qa);
//	게시글 상세보기할수 있다
	QaVO selectOneQa(int id);
//	회원이 자신의 게시글을 편집 갱신 할 수 있다
	boolean updateQa(String login, String title);
//	회원이 자신의 게시글을 삭제 할 수 있다
	boolean deleteQa(int id);
//	게시글 리스트를 조회 할 수 있다
	List<QaVO> showAllArticles();
}
