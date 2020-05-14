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

import com.fdl.foodlee.model.dao.inf.IMemberDAO;
import com.fdl.foodlee.model.vo.MemberVO;

// 빈 자동 등록 : MVC 저장단 처리
@Repository
public class MemberMysqlDAOImpl implements IMemberDAO {
	// SQL 정의부
	private static final String SQL_INSERT_MEMBER_CRYPTO 
	= "insert into members values(null, ?, hex(aes_encrypt(?,?)), "
		+"?, ?, ?, ?, ?, ?, ?, now(), now(), null, null)";
	private static final String SQL_MEMBER_DUPCHECK
	= "select count(id) from members where login = ?";
	private static final String SQL_LOGIN_AUTH
	= "select login, cast(aes_decrypt(unhex(password), ?) as char(32) "
		+ "character set utf8) as pw from members where id = ?";
	private static final String SQL__MEMBER_LOGIN_TIME_UPDATE
	= "update members set login_time=now() where id = ?";
	private static final String SQL_SELECT_MEMBER_ID 
	= "select * from members where id = ?";
	private static final String SQL_SELECT_MEMBER_LOGIN 
	= "select * from members where login = ?";
	private static final String SQL_SELECT_MEMBER_PK
	= "select id from members where login = ?";
	private static final String SQL_UPDATE_MEMBER //TODO 비밀번호 변경 따로 ?
	= "update members set password=hex(aes_encrypt(?,?)), name=?, gender=?, "
		+"age=?, email=?, phone_number=?, address=?, updated_at=now() where id = ?";
	private static final String SQL_DELETE_MEMBER
	= "delete from members where id = ?";
	
	@Autowired
	private JdbcTemplate jtem;
	
	@Override
	public boolean insertNewMemberWithCrypto(MemberVO mb) {
		int r = jtem.update(SQL_INSERT_MEMBER_CRYPTO,
				mb.getLogin(), mb.getPassword(), mb.getLogin(),
				mb.getName(), mb.getGender(), mb.getAge(), mb.getResidentRN(),
				mb.getEmail(), mb.getPhoneNumber(), mb.getAddress()
				);
		return r == 1;
	}

	@Override
	public boolean isDuplicatedMember(String login) {
		int r = jtem.queryForObject(SQL_MEMBER_DUPCHECK, Integer.class, login);
		System.out.println("dup cnt = " + r);
		return r >= 1;
	}

	@Override
	public String loginAuthenticate(String login, int id) {
		Map<String, Object> rMap = jtem.queryForMap(SQL_LOGIN_AUTH,
				new Object[]{login,id},
				new int[]{Types.VARCHAR, Types.INTEGER} );
		String dbLogin = (String) rMap.get("login");
		String dbPW = (String) rMap.get("pw");
		System.out.println("DB pw: " + dbPW);
		return dbPW;
		//return jtem.update(SQL__MEMBER_LOGIN_TIME_UPDATE, id);
	}

	@Override
	public MemberVO selectOneMember(int id) {
		try {			
			return jtem.queryForObject(SQL_SELECT_MEMBER_ID,
				new RowMapper<MemberVO>() {
					@Override
					public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
						return new MemberVO(
								rs.getInt("id"),
								rs.getString("type"),
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
								rs.getTimestamp("login_time"),
								rs.getTimestamp("logout_time") );
					}
				} , id);
		} catch (DataAccessException e) {
			System.out.println("dao / 일반 회원 편집폼 실패." + id );
			return null;
		} // 익명객체 방식의 rowmapper 인자로 전달
	}

	@Override
	public MemberVO selectOneMember(String login) {
		try {
			 MemberVO mb = jtem.queryForObject(SQL_SELECT_MEMBER_LOGIN,
						BeanPropertyRowMapper
							.newInstance(MemberVO.class), login);
			 return mb;
		} catch (EmptyResultDataAccessException e) {
			System.out.println(login+ " 회원(일반) 없음 /dao");
			return null;
		} catch (DataAccessException e) {
			// spring data의 최상위 예외 객체...
			e.printStackTrace();
			return null;
		} // 빈프라퍼티 로우맵퍼
		// Camel낙타VO <==> Snake뱀sql테이블 자동맵핑
	}

	@Override
	public int selectMemberIdbyLogin(String login) {
		return this.jtem.queryForObject
				(SQL_SELECT_MEMBER_PK, Integer.class, login);
	}
	
	@Override
	public boolean updateOneMember(MemberVO mb) {
		try { 
			int r = jtem.update(SQL_UPDATE_MEMBER, 
				mb.getPassword(), mb.getLogin(), mb.getName(),
				mb.getGender(), mb.getAge(), mb.getEmail(), mb.getPhoneNumber(),
				mb.getAddress(), mb.getId() );
			return r == 1;
		} catch (DataAccessException e) {
			System.out.println("dao/ 일반 회원 정보 갱신 실패 - " + mb.getId());
			return false;
		}
	}

	@Override
	public boolean deleteOneMember(int id) {
		int r = jtem.update(SQL_DELETE_MEMBER, id);
		return r == 1;
	}

}
