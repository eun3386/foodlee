package com.fdl.foodlee.model.dao.inf;

import java.util.HashMap;
import java.util.List;

import com.fdl.foodlee.model.vo.AdminVO;
import com.fdl.foodlee.model.vo.FoodtruckVO;
import com.fdl.foodlee.model.vo.MemberVO;
import com.fdl.foodlee.model.vo.MenuVO;
import com.fdl.foodlee.model.vo.SellerVO;

public interface IAdminDAO {
//- 관리자 로그인 체크 
	int adminLoginCheck(String login, String pw);
	
//- 관리자 찾기
	AdminVO selectAdmin(String login);
	
//- 관리자 로그인 인증
	String adminLoginCertification(String login, int adId);
	
//- 관리자 정보를 확인 할 수 있다.
	int selectAdminIdbyLogin(String login);
	
//-회원 조회  할 수 있다(리스트 조회 회원번호, 아이디, 로그인시간, 로그아웃 시간)
//	admin_list.fdl(proc, get, dao)
	//일반 회원
	List<MemberVO> showAllMember(MemberVO mb);
	//판매자
	List<SellerVO> showAllSeller(SellerVO sel);
	
//-회원 상세보기 할 수 있다(회원 리스트 클릭시)
//	admin_show.fdl(get, proc, dao, param? vo)
	MemberVO selectOneMember(MemberVO mb);
	MemberVO selectOneMemberId(int id);
	MemberVO showOneMemberLogin(String login);
	SellerVO selectOneSeller(SellerVO sel);
	SellerVO selectOneSellerId(int id);
	SellerVO showOneSellerLogin(String login);
//-회원 정보 수정 할 수 있다(회원 상세보기에서 )
//	admin_edit_form.fdl(get, proc, dao, param?id)
//	admin_mb_pw_chagnge.fdl(proc, post, dao, 회원)
//	admin_mb_update.fdl (proc, post, 세션, dao, 회원)
	boolean updateOneMember(MemberVO mb);
	boolean updateOneSeller(SellerVO sel);
	
//-회원 삭제 할 수 있다(활동 정지한 판매자)
//	admin_del.fdl(proc, get, dao, param?id)
	boolean deleteOneMember(MemberVO mbId);
	boolean deleteOneMember(SellerVO selId);
//-회원 추가 할 수 있다(?)
//	admin_new_join_form.fdl(get)
//	admin_add_join.fdl(proc, post, dao)
	boolean insertNewMember(MemberVO mb); 
	boolean insertNewSeller(SellerVO sel); 
//-회원 통계 할수 있다(남/녀, 메뉴, 가격, 구별)
//	admin_mb_statistics_form.fdl(get)
//	admin_statistics.fdl(get, proc, dao, param..vo)
	List<MemberVO> showAllMembers(int offset, int limit);
//-트럭 통계 할수 있다(구별, 매출, 좋아요수)
//	admin_truck_statistics_form.fdl(get)
//	admin_truck_statistics.fdl(get, proc, dao, param..vo)
	List<FoodtruckVO> showAllFoodtruck(int offset, int limit);
//-메뉴 카테고리 통계 할 수 있다( 각 카테고리 개수, 매출, 구별 )
//	admin_menu_statistics_form.fdl(get)
//	admin_menu_statistics.fdl(get, proc, dao, param..vo)
	List<MenuVO> showAllMenu(int offset, int limit);
//-회원 가입통계 할 수 있다(ex 이번달 회원 가입수)
//	admin_join_statistics_form.fdl(get)
//	admin_join_statistics.fdl(get, proc, dao, param..vo)
	List<MemberVO> showAllMemberJoin(MemberVO mv);
	List<MemberVO> showAllMemberJoin(int mbId, String login);
	List<SellerVO> showAllSellerJoin(SellerVO sv);
	List<SellerVO> showAllSellerJoin(int mbId, String login);
	HashMap<String, Object> showAllJoin();
//-이벤트를 관리할 수 있다.
//


//나중에….
//관리자 그룹을 만들수 있다( 구별 판매자 그룹)
//관리자 그룹 지정 할 수 있다
//광고자 리스트를 볼 수 있다.
	
	// -----------------------------------------------------신규 추가----------------------------------------------------
	int countMembers();
	int countSellers();
	int countFoodTrucks();
	int countMenus();
	int countTodayOrders();
	int countTodayPriceSum();
	int countOrderSum();
	int countOrderPriceSum();
	
	List<Integer> countMenuCategory();
}
