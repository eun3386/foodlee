package com.fdl.foodlee.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fdl.foodlee.model.dao.inf.IMemberDAO;
import com.fdl.foodlee.model.vo.MemberVO;
import com.fdl.foodlee.service.inf.IMemberSVC;

@Service
public class MemberSVCImpl implements IMemberSVC {

	@Autowired
	private IMemberDAO mbDao;

	@Override
	public boolean insertNewMemberWithCrypto(MemberVO mb) {
		return mbDao.insertNewMemberWithCrypto(mb);
	}

	@Override
	public String loginAuthenticate(String login, int id) {
		return mbDao.loginAuthenticate(login, id);
	}

	@Override
	public MemberVO selectOneMember(int id) {
		return mbDao.selectOneMember(id);
	}

	@Override
	public MemberVO selectOneMember(String login) {
		return mbDao.selectOneMember(login);
	}

	@Override
	public int selectMemberIdbyLogin(String login) {
		return mbDao.selectMemberIdbyLogin(login);
	}

	@Override
	public boolean updateOneMember(MemberVO mb) {
		return mbDao.updateOneMember(mb);
	}

	@Override
	public boolean deleteOneMember(int id) {
		return mbDao.deleteOneMember(id);
	}

	@Override
	public boolean isDuplicatedMember(String login) {
		return mbDao.isDuplicatedMember(login);
	}

	@Override
	public boolean updateMemberLoginTime(int id) {
		return mbDao.updateMemberLoginTime(id);
	}

	@Override
	public boolean updateMemberLogoutTime(int id) {
		return mbDao.updateMemberLogoutTime(id);
	}

}
