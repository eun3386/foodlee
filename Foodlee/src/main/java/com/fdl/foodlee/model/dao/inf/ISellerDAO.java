package com.fdl.foodlee.model.dao.inf;

import java.util.HashMap;
import java.util.List;

import com.fdl.foodlee.model.vo.FoodtruckVO;
import com.fdl.foodlee.model.vo.MemberVO;
import com.fdl.foodlee.model.vo.OrderVO;
import com.fdl.foodlee.model.vo.SellerVO;

public interface ISellerDAO {
	
//	가입 할 수 있다. (암호화 저장 처리)
	boolean insertNewSellerWithCrypto(SellerVO sel);
	
///	아이디를 찾을 수 있다.
	List<String> selectSellerLogin(String name, String phoneNumber);
	
//	비밀번호를 찾을 수 있다.
	String selectSellerPassword(String login, String email);
	
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
	boolean updateOneSellerPW(int id, String login, String password);
	
//	탈퇴 할 수 있다.
	boolean deleteOneSeller(int id);
	
//	로그인 시간 갱신
	boolean updateSellerLoginTime(int id);
	
//	로그아웃 시간 갱신
	boolean updateSellerLogoutTime(int id);

	// 트럭 통계 할수 있다(매출, 좋아요수)
		List<FoodtruckVO> showAllFoodtruck(int offset, int limit); //몇번째 row부터 출력할 지, 출력할 행의 수 
	// 주문 통계 할 수 있다(매출,판매량 )
		List<OrderVO> showAllMenu(int offset, int limit);
	//-회원 가입통계 할 수 있다(ex 이번달 회원 가입수)
		List<MemberVO> showAllMemberJoin(MemberVO mv);
		List<MemberVO> showAllMemberJoin(int mbId, String login);
		List<SellerVO> showAllSellerJoin(SellerVO sv);
		List<SellerVO> showAllSellerJoin(int mbId, String login);
		HashMap<String, Object> showAllJoin();

		
		
	}

