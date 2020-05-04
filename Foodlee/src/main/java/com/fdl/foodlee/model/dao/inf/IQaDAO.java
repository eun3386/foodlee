package com.fdl.foodlee.model.dao.inf;

import java.util.List;

import com.fdl.foodlee.model.vo.QaVO;

public interface IQaDAO {
	
	// 리뷰를 작성 할 수 있다.
	boolean insertNewQa(QaVO qa);
	// 리뷰를 수정 할 수 있다.
	boolean updateQa(int id, String qaContent);
	// 리뷰를 삭제 할 수 있다.
	boolean deleteQa(int id);
	// 리뷰 전체를 가져와 조회 할 수 있다.
	List<QaVO> showAllQa();
}
