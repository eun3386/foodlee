package com.fdl.foodlee.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fdl.foodlee.model.dao.inf.IMemberDAO;
import com.fdl.foodlee.service.inf.IMemberSVC;

@Service
public class MemberSVCImpl implements IMemberSVC {

	@Autowired
	private IMemberDAO mbDao;

	@Override
	public int selectMemberIdByLogin(String login) {
		return mbDao.selectMemberIdbyLogin(login);
	}

}
