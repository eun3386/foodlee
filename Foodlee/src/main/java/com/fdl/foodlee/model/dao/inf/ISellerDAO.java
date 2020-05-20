package com.fdl.foodlee.model.dao.inf;

import com.fdl.foodlee.model.vo.SellerVO;

public interface ISellerDAO {
//	가입 할 수 있다. (암호화 저장 처리)
	boolean insertNewSellerWithCrypto(SellerVO sel);
	
//	아이디를 찾을 수 있다.
	
	
//	비밀번호를 찾을 수 있다.
	
	
//	로그인 중복체크 할 수 있다.
	boolean isDuplicatedSeller(String login);
	
//	로그인 할 수 있다. (세션 + 암호화 인증)
	String loginAuthenticate(String login, int id);
	
//	자신의 정보를 확인 할 수 있다.
	SellerVO selectOneSeller(int id); // pk 
	SellerVO selectOneSeller(String login); // uq
	int selectSellerIdbyLogin(String login);
	
//	자신의 정보를 갱신 할 수 있다.
	boolean updateOneSeller(SellerVO sel);
	
//	탈퇴 할 수 있다.
	boolean deleteOneSeller(int id);
}
