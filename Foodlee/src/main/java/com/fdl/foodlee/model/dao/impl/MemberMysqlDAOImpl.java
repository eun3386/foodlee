package com.fdl.foodlee.model.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.fdl.foodlee.model.dao.inf.IMemberDAO;
import com.fdl.foodlee.model.vo.MemberVO;

public class MemberMysqlDAOImpl implements IMemberDAO {
	// SQL 정의부
	private static final String SQL_INSERT_MEMBER_CRYPTO 
	= "insert into members values(null, ?, hex(aes_encrypt(?,?)), "
		+"?, ?, ?, ?, ?, ?, now(), now())";
	private static final String SQL_MEMBER_DUPCHECK
	= "select count(id) from members where login = ?";
	@Autowired
	private JdbcTemplate jtem;
	
	@Override
	public boolean insertNewMemberWithCrypto(MemberVO mb) {
		int r = jtem.update(SQL_INSERT_MEMBER_CRYPTO,
				mb.getLogin(), mb.getPassword(), mb.getLogin(),
				mb.getName(), mb.getGender(), mb.getResidentRN(),
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO selectOneMember(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO selectOneMember(String login) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectMemberIdbyLogin(String login) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean updateOneMember(MemberVO mb) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteOneMember(int id) {
		// TODO Auto-generated method stub
		return false;
	}

}
