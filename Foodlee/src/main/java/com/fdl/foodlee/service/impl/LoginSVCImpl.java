package com.fdl.foodlee.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fdl.foodlee.model.dao.MyCode;
import com.fdl.foodlee.model.dao.inf.IMemberDAO;
import com.fdl.foodlee.model.dao.inf.ISellerDAO;
import com.fdl.foodlee.model.vo.MemberVO;
import com.fdl.foodlee.model.vo.SellerVO;
import com.fdl.foodlee.service.inf.ILoginSVC;

@Service
public class LoginSVCImpl implements ILoginSVC {

	@Autowired
	private IMemberDAO mbDao;
	
	@Autowired
	private ISellerDAO selDao;
	
	@Override
	public int loginProcess(String login, String pw) {
		
		if( login == null || login.isEmpty() ) 
				return MyCode.LOGIN_PARAM_ERROR;
		if( pw == null || pw.isEmpty() ) 
				return MyCode.PW_PARAM_ERROR;
		
		if( login.equals("admin") )
			return MyCode.ADMIN_LOGIN_AUTH_OK;
		// 가입된 회원인지?
		MemberVO mb = mbDao.selectOneMember(login);
		SellerVO sel = selDao.selectOneSeller(login);
		
		System.out.println(">>>> mb " + mb + ", sel " + sel);
		
		int id = 0;
		String dbPW = "";
		boolean rMb = false;
		if( mb == null && sel == null ) {
			return MyCode.LOGIN_NONE; // not found
		} else if( mb != null && sel == null ) {
			id = mb.getId();
			dbPW = this.mbDao.loginAuthenticate(login, id);
			rMb = true;
		} else if( mb == null && sel != null ) {
			id = sel.getSellerId();
			dbPW = this.selDao.loginAuthenticate(login, id);
		}
		
		// 패스워드도 일치?
		if( dbPW.equals(pw) ) { // 인증
			if( rMb ) {
				return MyCode.MEMBER_LOGIN_AUTH_OK;
			} else {
				return MyCode.SELLER_LOGIN_AUTH_OK;
			}
		} else {
			return MyCode.LOGIN_PW_MISMATCH;
		}
	}

}
