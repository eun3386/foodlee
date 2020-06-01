package com.fdl.foodlee.model.dao.inf;

import java.util.List;

import com.fdl.foodlee.model.vo.MemberVO;

public interface IMemberDAO {
	
//	가입 할 수 있다. (암호화 저장 처리)
	boolean insertNewMemberWithCrypto(MemberVO mb);
	
//	아이디를 찾을 수 있다.
	List<String> selectMemberLogin(String name, String phoneNumber);
	
//	비밀번호를 찾을 수 있다.
	String selectMemberPassword(String login, String email);
	
//	로그인 중복체크 할 수 있다.
	boolean isDuplicatedMember(String login);
	
//	로그인 할 수 있다. (세션 + 암호화 인증)
	String loginAuthenticate(String login, int id);
	
//	자신의 정보를 확인 할 수 있다.
	MemberVO selectOneMember(int id); // pk 
	MemberVO selectOneMember(String login); // uq
	int selectMemberIdbyLogin(String login);
	
//	자신의 정보를 갱신 할 수 있다.
	boolean updateOneMember(MemberVO mb);
	
//	탈퇴 할 수 있다.
	boolean deleteOneMember(int id);
	
//	로그인 시간 갱신
	boolean updateMemberLoginTime(int id);
	
//	로그아웃 시간 갱신
	boolean updateMemberLogoutTime(int id);
	
}
