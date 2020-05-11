package com.fdl.foodlee.model.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.dao.inf.IQnaDAO;
import com.fdl.foodlee.model.vo.QnaVO;

@Repository
public class QnaMysqlDAOImpl implements IQnaDAO {
	
	public static final String SQL_QNA_NEW = "insert into qna"
			+ " values(null, ?, ?, ?, ?, ?, now())";
	public static final String SQL_QNA_UPDATE = "update qna set qna_content=?"
			+ " where qna_id=?";
	public static final String SQL_QNA_DELETE = "delete from qna where qna_id = ?";
	public static final String SQL_QNA_LIST = "SELECT * FROM qna " + 
			"ORDER BY IF(ISNULL(qna_pnum), qna_id, qna_pnum), review_qna asc";
	
	@Autowired
	private JdbcTemplate jtem;
	private SimpleJdbcInsert simIn;
	
	public QnaMysqlDAOImpl() {}
	
	@Autowired
	public QnaMysqlDAOImpl(JdbcTemplate jtem) {
		this.jtem = jtem;		
		this.simIn = new SimpleJdbcInsert(jtem.getDataSource());
		simIn.withTableName("qna");
		simIn.usingGeneratedKeyColumns("id");
	}

	@Override
	public boolean insertNewQna(QnaVO qna) {
		int r = jtem.update(SQL_QNA_NEW,
				qna.getLogin(), qna.getSellerId(),
				qna.getQnaDepth(), qna.getQnaPnum(),
				qna.getQnaCountent());
		return r == 1; //? true: false;
	}

	@Override
	public boolean updateQna(int id, String qnaContent) {
		int r = jtem.update(SQL_QNA_UPDATE, qnaContent, id); 
		return r == 1;
	}

	@Override
	public boolean deleteQna(int id) {
		int r = jtem.update(SQL_QNA_DELETE, id);
		return r == 1;
	}

	@Override
	public List<QnaVO> showAllQna() {
		return jtem.query(SQL_QNA_LIST,
		 		 BeanPropertyRowMapper.newInstance(QnaVO.class));
	}

}
