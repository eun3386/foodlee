package com.fdl.foodlee.model.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.dao.inf.IQaDAO;
import com.fdl.foodlee.model.vo.QaVO;

@Repository
public class QaMysqlDAOImpl implements IQaDAO {
	
	@Autowired
	private JdbcTemplate jtem;
	private SimpleJdbcInsert simIn;
	
	@Override
	public boolean insertNewQa(QaVO qa) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public QaVO selectOneQa(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateQa(String login, String title) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteQa(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<QaVO> showAllArticles() {
		// TODO Auto-generated method stub
		return null;
	}

}
