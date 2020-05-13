package com.fdl.foodlee.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fdl.foodlee.model.dao.MyCode;
import com.fdl.foodlee.model.dao.inf.IMemberDAO;
import com.fdl.foodlee.model.dao.inf.ISellerDAO;
import com.fdl.foodlee.model.vo.MemberVO;
import com.fdl.foodlee.model.vo.SellerVO;
import com.fdl.foodlee.service.inf.ISellerSVC;

@Service
public class SellerSVCImpl implements ISellerSVC {

	@Autowired
	private IMemberDAO mbDao;
	@Autowired
	private ISellerDAO selDao;
	
	@Override
	public int loginProcess(String login, String pw) {
System.out.println("SVC: loginProcess() - " + login);
		
		if( login == null || login.isEmpty() ) 
				return MyCode.LOGIN_PARAM_ERROR;
		if( pw == null || pw.isEmpty() ) 
				return MyCode.LOGIN_PW_MISMATCH;
		
		// 가입된 회원인지?
		MemberVO mb = mbDao.selectOneMember(login);
		SellerVO sel = selDao.selectOneSeller(login);
		System.out.println(mb);
		int id = 0;
		String dbPW = "";
		if( mb == null && sel == null ) {
			return MyCode.LOGIN_NONE; // not found
		} else if( mb != null && sel == null ) {
			id = mb.getMbId();
			dbPW = this.mbDao.loginAuthenticate(login, id);
		} else if( mb == null && sel != null ) {
			id = sel.getSellerId();
			dbPW = this.selDao.loginAuthenticate(login, id);
		}
		
		// 패스워드도 일치?
		System.out.println(dbPW);
		if( dbPW.equals(pw) ) { // 인증
			return MyCode.LOGIN_AUTH_OK;
		} else {
			return MyCode.LOGIN_PW_MISMATCH;
		}
	}

	@Override
	public int selectSellerIdByLogin(String login) {
		return selDao.selectSellerIdbyLogin(login);
	}
	
}
