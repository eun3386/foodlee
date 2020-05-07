package com.fdl.foodlee.model.dao.inf;

import com.fdl.foodlee.model.vo.MemberVO;

public interface IMemberDAO {
//	가입 할 수 있다. (암호화 저장 처리)
	boolean insertNewMemberWithCrypto(MemberVO mb);
	
//	아이디를 찾을 수 있다.
	
	
//	비밀번호를 찾을 수 있다.
	
	
//	로그인 중복체크 할 수 있다.
	boolean isDuplicatedMember(String login);
	
//	로그인 할 수 있다. (세션 + 암호화 인증)
	//String loginAuthenticate( String login, int mbId );
	int loginAuthenticate( String login, int mbId );
	
//	로그아웃 할 수 있다.
	
	
//	자신의 정보를 확인 할 수 있다.
	MemberVO selectOneMember(int mbId); // pk 
	MemberVO selectOneMember(String login); // uq
	int selectMemberIdbyLogin(String login);
	
//	자신의 정보를 갱신 할 수 있다.
	boolean updateOneMember(MemberVO mb);
	
//	탈퇴 할 수 있다.
	boolean deleteOneMember(int mbId);
}
