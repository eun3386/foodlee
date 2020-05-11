package com.fdl.foodlee.model.dao;

import java.util.HashMap;

public class MyCode {
	public static final int MB_LOGIN_PARAM_ERROR = 1;
	public static final int MB_PW_PARAM_ERROR = 2;
	public static final int MB_LOGIN_NONE = 3;
	public static final int MB_LOGIN_AUTH_OK = 4;
	public static final int MB_LOGIN_PW_MISMATCH = 5;
	
	public static final HashMap<Integer,String> 
	 	MB_MSG_MAP = new HashMap<Integer, String>();
	
	public static final String getMsg(int r) {
		MB_MSG_MAP.put(MB_LOGIN_PARAM_ERROR, 
				"로그인 파람 에러");
		MB_MSG_MAP.put(MB_PW_PARAM_ERROR, 
				"패스워드 파람 에러");
		MB_MSG_MAP.put(MB_LOGIN_NONE, 
				"가입되지 않은 회원 계정");
		MB_MSG_MAP.put(MB_LOGIN_AUTH_OK, 
				"로그인 인증 성공!");
		MB_MSG_MAP.put(MB_LOGIN_PW_MISMATCH, 
				"로그인 암호 불일치");
		return MB_MSG_MAP.get(r);
	}
}
