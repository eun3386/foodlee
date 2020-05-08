package com.fdl.foodlee.model.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.dao.inf.IQnaDAO;
import com.fdl.foodlee.model.vo.QnaVO;

@Repository
public class QnaMysqlDAOImpl implements IQnaDAO {

	@Autowired
	private JdbcTemplate jtem;
	private SimpleJdbcInsert simIn;

	@Override
	public boolean insertNewQna(QnaVO qna) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateQna(int id, String qnaContent) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteQna(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<QnaVO> showAllQna() {
		// TODO Auto-generated method stub
		return null;
	}

}
