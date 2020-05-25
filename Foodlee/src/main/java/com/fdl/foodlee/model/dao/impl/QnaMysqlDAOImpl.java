package com.fdl.foodlee.model.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
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
	public static final String SQL_QNA_LIST = "SELECT * FROM qna where seller_id = ? " + 
			"ORDER BY IF(ISNULL(qna_pnum), qna_id, qna_pnum*1), qna_depth asc";
	public static final String SQL_QNA_LIST_LOGIN = "SELECT * FROM qna where login = ? " + 
			"ORDER BY qna_created_at desc";
	public static final String SQL_QNA_REPLY = "insert into qna"
			+ " values(null, ?, ?, 1, ?, ?, now())";
	public static final String SQL_QNA_DELETE_BEFORE = "select count(*) from qna where qna_pnum = ?";
	public static final String SQL_QNA_DELETE_COUNT = "select count(*) from qna where "
			+ "qna_id=? and qna_content='삭제된 QnA입니다.'";
	public static final String SQL_QNA_DELETE_UPDATE = "update qna set qna_content='삭제된 QnA입니다.' where qna_id=?";
	public static final String SQL_QNA_DELETE_BEFORE_CHECK = "select qna_pnum from qna where qna_id=?";
	
	private JdbcTemplate jtem;	
	private SimpleJdbcInsert simIn;
	
	public QnaMysqlDAOImpl() {}
	
	@Autowired
	public QnaMysqlDAOImpl(JdbcTemplate jtem) {
		this.jtem = jtem;		
		this.simIn = new SimpleJdbcInsert(jtem.getDataSource());
		simIn.withTableName("Qna");
		simIn.usingGeneratedKeyColumns("id");
	}
	
	@Override
	public int insertNewQnaReturnKey(QnaVO qna) {
		KeyHolder kh = new GeneratedKeyHolder();
		PreparedStatementCreator psc = new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement(SQL_QNA_NEW, new String[] { "id" });
				pstmt.setString(1, qna.getLogin());
				pstmt.setInt(2, qna.getSellerId());
				pstmt.setInt(3, qna.getQnaDepth());
				pstmt.setString(4, qna.getQnaPnum());
				pstmt.setString(5, qna.getQnaContent());
				return pstmt;
			}
		};

		jtem.update(psc, kh);
		Number r = kh.getKey(); // PK
		return r.intValue();
	}

	@Override
	public boolean insertNewQna(QnaVO qna) {
		int r = jtem.update(SQL_QNA_NEW,
				qna.getLogin(), qna.getSellerId(),
				qna.getQnaDepth(), qna.getQnaPnum(),
				qna.getQnaContent());
		return r == 1; //? true: false;
	}

	@Override
	public boolean updateQna(int id, String qnaContent) {
		int r = jtem.update(SQL_QNA_UPDATE, qnaContent, id); 
		return r == 1;
	}

	@Override
	public boolean deleteQna(int id, int depth) {
		int get = jtem.queryForObject(SQL_QNA_DELETE_BEFORE, Integer.class, id);
		
		if (depth == 0) {
			if (get >= 1) {
				int r = jtem.update(SQL_QNA_DELETE_UPDATE, id);
				return r == 1;
			} else {
				int r = jtem.update(SQL_QNA_DELETE, id);
				return r == 1;
			}
		} else if (depth == 1) {
			int pnum = jtem.queryForObject(SQL_QNA_DELETE_BEFORE_CHECK, Integer.class, id);
			int getDepth = jtem.queryForObject(SQL_QNA_DELETE_COUNT, Integer.class, pnum);
			
			if (getDepth >= 1) {
				int r1 = jtem.update(SQL_QNA_DELETE, id);
				int r2 = jtem.update(SQL_QNA_DELETE, pnum);
				return r1 == r2;
			} else {
				int r = jtem.update(SQL_QNA_DELETE, id);
				return r == 1;
			}
		} else {
			System.out.println("=======================================================");
			System.err.println("!!!!!!!!!!!!!!!!!!!qna 삭제 중 알 수 없는 오류!!!!!!!!!!!!!!!!!!");
			System.out.println("=======================================================");
			return false;
		}
	}

	@Override
	public List<QnaVO> showAllQna(int sellerId) {
		return jtem.query(SQL_QNA_LIST, 
		 		 BeanPropertyRowMapper.newInstance(QnaVO.class), sellerId);
	}
	
	@Override
	public List<QnaVO> showAllQnaLogin(String login) {
		return jtem.query(SQL_QNA_LIST_LOGIN, 
		 		 BeanPropertyRowMapper.newInstance(QnaVO.class), login);
	}

	@Override
	public boolean QnaReply(QnaVO qna) {
		int r = jtem.update(SQL_QNA_REPLY,
				qna.getLogin(), qna.getSellerId(),
				qna.getQnaPnum(), qna.getQnaContent());
		return r == 1; //? true: false;
	}
}
