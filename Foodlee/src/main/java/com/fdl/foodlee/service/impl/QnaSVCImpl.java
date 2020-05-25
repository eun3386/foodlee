package com.fdl.foodlee.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fdl.foodlee.model.dao.inf.IQnaDAO;
import com.fdl.foodlee.model.vo.QnaVO;
import com.fdl.foodlee.service.inf.IQnaSVC;

@Service
public class QnaSVCImpl implements IQnaSVC {
	@Autowired
	private IQnaDAO qnaDao;

	@Override
	public boolean insertNewQna(QnaVO rv) {
		return qnaDao.insertNewQna(rv);
	}

	@Override
	public int insertNewQnaReturnKey(QnaVO rvGet) {

		// QnaVO rv = new QnaVO(0, login, sellerId, QnaDepth, QnaPnum, QnaContent, QnaPic, QnaCreatedAt);

		// return atDao.insertNewArticleReturnKey(at);
		return qnaDao.insertNewQnaReturnKey(rvGet);
	}

	@Override
	public int insertNewQnaReturnKey(String login, int sellerId, int QnaDepth, String QnaPnum,
			String QnaContent, Timestamp QnaCreatedAt) {
		QnaVO rv = new QnaVO(0, login, sellerId, QnaContent, QnaDepth, QnaPnum, QnaCreatedAt);
		return qnaDao.insertNewQnaReturnKey(rv);
	}
	
	@Override
	public boolean updateQna(int id, String rvContent) {
		return qnaDao.updateQna(id, rvContent);
	}

	@Override
	public boolean deleteQna(int id, int depth) {
		return qnaDao.deleteQna(id, depth);
	}

	@Override
	public List<QnaVO> showAllQna(int sellerId) {
		return qnaDao.showAllQna(sellerId);
	}
	
	@Override
	public List<QnaVO> showAllQnaLogin(String login) {
		return qnaDao.showAllQnaLogin(login);
	}

	@Override
	public boolean QnaReply(QnaVO rv) {
		return qnaDao.QnaReply(rv);
	}

}	
