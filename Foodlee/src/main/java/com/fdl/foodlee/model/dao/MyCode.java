package com.fdl.foodlee.model.dao;

import java.util.HashMap;

public class MyCode {
	public static final int LOGIN_PARAM_ERROR = 1;
	public static final int PW_PARAM_ERROR = 2;
	public static final int LOGIN_NONE = 3;
	public static final int MEMBER_LOGIN_AUTH_OK = 4;
	public static final int SELLER_LOGIN_AUTH_OK = 5;
	public static final int ADMIN_LOGIN_AUTH_OK = 6;
	public static final int LOGIN_PW_MISMATCH = 7;
	
	public static final HashMap<Integer,String> 
	 	MSG_MAP = new HashMap<Integer, String>();
	
	public static final String getMsg(int r) {
		MSG_MAP.put(LOGIN_PARAM_ERROR, 
				"로그인 파람 에러");
		MSG_MAP.put(PW_PARAM_ERROR, 
				"패스워드 파람 에러");
		MSG_MAP.put(LOGIN_NONE, 
				"가입되지 않은 회원 계정");
		MSG_MAP.put(MEMBER_LOGIN_AUTH_OK, 
				"일반회원 로그인 인증 성공!");
		MSG_MAP.put(SELLER_LOGIN_AUTH_OK, 
				"판매자 로그인 인증 성공!");
		MSG_MAP.put(ADMIN_LOGIN_AUTH_OK, 
				"관리자 로그인 인증 성공!");
		MSG_MAP.put(LOGIN_PW_MISMATCH, 
				"로그인 암호 불일치");
		return MSG_MAP.get(r);
	}
}
