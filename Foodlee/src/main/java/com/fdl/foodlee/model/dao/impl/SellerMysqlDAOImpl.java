package com.fdl.foodlee.model.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.dao.inf.ISellerDAO;
import com.fdl.foodlee.model.vo.MemberVO;
import com.fdl.foodlee.model.vo.SellerVO;

// 빈 자동 등록 : MVC 저장단 처리
@Repository
public class SellerMysqlDAOImpl implements ISellerDAO {
	// SQL 정의부
	private static final String SQL_INSERT_SELLER_CRYPTO 
	= "insert into sellers values(null, ?, hex(aes_encrypt(?,?)), "
		+"?, ?, ?, ?, ?, ?, ?, now(), now(), ?, null, null)";
	private static final String SQL_SELLER_DUPCHECK
	= "select count(seller_id) from sellers where login = ?";
	private static final String SQL_LOGIN_AUTH
	= "select login, cast(aes_decrypt(unhex(password),?) as char(32) "
		+ "character set utf8) as pw from sellers where seller_id = ?";
	private static final String SQL__SELLER_LOGIN_TIME_UPDATE
	= "update sellers set login_time=now() where seller_id = ?";
	private static final String SQL_SELECT_SELLER_ID 
	= "select * from sellers where seller_id = ?";
	private static final String SQL_SELECT_SELLER_LOGIN 
	= "select * from sellers where login = ?";
	private static final String SQL_SELECT_SELLER_PK
	= "select seller_id from sellers where login = ?";
	private static final String SQL_UPDATE_SELLER //TODO 비밀번호 변경 따로 ? 사업자등록번호 변경유무
	= "update sellers set password=hex(aes_encrypt(?,?)), name=?, gender=?, "
		+"age=?, email=?, phone_number=?, address=?, updated_at=now(), company_rn=? where seller_id = ?";
	private static final String SQL_DELETE_SELLER
	= "delete from sellers where seller_id = ?";
	
	@Autowired
	private JdbcTemplate jtem;
	
	@Override
	public boolean insertNewSellerWithCrypto(SellerVO sel) {
		int r = jtem.update(SQL_INSERT_SELLER_CRYPTO,
				sel.getLogin(), sel.getPassword(), sel.getLogin(),
				sel.getName(), sel.getGender(), sel.getAge(), sel.getResidentRN(),
				sel.getEmail(), sel.getPhoneNumber(), sel.getAddress(),
				sel.getCompanyRN() );
		return r == 1;
	}

	@Override
	public boolean isDuplicatedSeller(String login) {
		int r = jtem.queryForObject(SQL_SELLER_DUPCHECK, Integer.class, login);
		System.out.println("dup cnt = " + r);
		return r >= 1;
	}

	@Override
	public String loginAuthenticate(String login, int selId) {
		Map<String, Object> rMap = jtem.queryForMap(SQL_LOGIN_AUTH,
				new Object[]{login,selId},
				new int[]{Types.VARCHAR, Types.INTEGER} );
		String dbLogin = (String) rMap.get("login");
		String dbPW = (String) rMap.get("pw");
		System.out.println("DB pw: " + dbPW);
		return dbPW;
		//return jtem.update(SQL__SELLER_LOGIN_TIME_UPDATE, selId);
	}

	@Override
	public SellerVO selectOneSeller(int selId) {
		try {			
			return jtem.queryForObject(SQL_SELECT_SELLER_ID,
				new RowMapper<SellerVO>() {
					@Override
					public SellerVO mapRow(ResultSet rs, int rowNum) throws SQLException {
						return new SellerVO(
								rs.getInt("seller_id"),
								rs.getString("login"),
								rs.getString("password"),
								rs.getString("name"),
								rs.getString("gender"),
								rs.getInt("age"),
								rs.getString("resident_rn"),
								rs.getString("email"),
								rs.getString("phone_number"),
								rs.getString("address"), 
								rs.getTimestamp("joined_at"),
								rs.getTimestamp("updated_at"),
								rs.getString("company_rn"),
								rs.getTimestamp("login_time"),
								rs.getTimestamp("logout_time") );
					}
				} , selId);
		} catch (DataAccessException e) {
			System.out.println("dao / 판매자 회원 편집폼 실패." + selId );
			return null;
		} // 익명객체 방식의 rowmapper 인자로 전달
	}

	@Override
	public SellerVO selectOneSeller(String login) {
		try {
			 SellerVO sel = jtem.queryForObject(SQL_SELECT_SELLER_LOGIN,
						BeanPropertyRowMapper
							.newInstance(SellerVO.class), login);
			 return sel;
		} catch (EmptyResultDataAccessException e) {
			System.out.println(login+ " 회원(판매자) 없음 /dao");
			return null;
		} catch (DataAccessException e) {
			// spring data의 최상위 예외 객체...
			e.printStackTrace();
			return null;
		} // 빈프라퍼티 로우맵퍼
		// Camel낙타VO <==> Snake뱀sql테이블 자동맵핑
	}

	@Override
	public int selectSellerIdbyLogin(String login) {
		return this.jtem.queryForObject
				(SQL_SELECT_SELLER_PK, Integer.class, login);
	}

	@Override
	public boolean updateOneSeller(SellerVO sel) {
		try { 
			int r = jtem.update(SQL_UPDATE_SELLER, 
				sel.getPassword(), sel.getLogin(), sel.getName(),
				sel.getGender(), sel.getAge(), sel.getEmail(), sel.getPhoneNumber(),
				sel.getAddress(), sel.getSellerId(), sel.getCompanyRN() );
			return r == 1;
		} catch (DataAccessException e) {
			System.out.println("dao/ 판매자 회원 정보 갱신 실패 - " + sel.getSellerId());
			return false;
		}
	}

	@Override
	public boolean deleteOneSeller(int selId) {
		int r = jtem.update(SQL_DELETE_SELLER, selId);
		return r == 1;
	}

}
