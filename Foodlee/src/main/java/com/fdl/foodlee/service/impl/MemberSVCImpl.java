package com.fdl.foodlee.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fdl.foodlee.model.dao.MyCode;
import com.fdl.foodlee.model.dao.inf.IAdminDAO;
import com.fdl.foodlee.model.dao.inf.IMemberDAO;
import com.fdl.foodlee.model.vo.AdminVO;
import com.fdl.foodlee.model.vo.MemberVO;
import com.fdl.foodlee.service.inf.IMemberSVC;

@Service
public class MemberSVCImpl implements IMemberSVC {

	@Autowired
	private IMemberDAO mbDao;
	@Override
	public int loginProcess(String login, String pw) {
System.out.println("SVC: loginProcess() - " + login);
		
		if( login == null || login.isEmpty() ) 
				return MyCode.MB_LOGIN_PARAM_ERROR;
		if( pw == null || pw.isEmpty() ) 
				return MyCode.MB_LOGIN_PW_MISMATCH;
		
		// 가입된 회원인지?
		MemberVO mb = mbDao.selectOneMember(login);
		System.out.println(mb);
		if( mb == null ) {
			return MyCode.MB_LOGIN_NONE; // not found
		} 
		int id = mb.getMbId();
		
		// 패스워드도 일치? 
		String dbPW = this.mbDao.loginAuthenticate(login, id);
		System.out.println(dbPW);
		if( dbPW.equals(pw) ) { // 인증
			return MyCode.MB_LOGIN_AUTH_OK;
		} else {
			return MyCode.MB_LOGIN_PW_MISMATCH;
		}
	}

	@Override
	public int selectMemberIdByLogin(String login) {
		// TODO Auto-generated method stub
		return 0;
	}

}
