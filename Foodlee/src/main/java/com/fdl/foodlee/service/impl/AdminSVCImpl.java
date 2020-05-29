package com.fdl.foodlee.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fdl.foodlee.model.dao.MyCode;
import com.fdl.foodlee.model.dao.inf.IAdminDAO;
import com.fdl.foodlee.model.dao.inf.IFoodtruckDAO;
import com.fdl.foodlee.model.dao.inf.IMemberDAO;
import com.fdl.foodlee.model.dao.inf.IMenuDAO;
import com.fdl.foodlee.model.dao.inf.ISellerDAO;
import com.fdl.foodlee.model.vo.AdminVO;
import com.fdl.foodlee.model.vo.FoodtruckVO;
import com.fdl.foodlee.model.vo.MemberVO;
import com.fdl.foodlee.model.vo.MenuVO;
import com.fdl.foodlee.model.vo.SellerVO;
import com.fdl.foodlee.service.inf.IAdminSVC;
@Service
public class AdminSVCImpl implements IAdminSVC {
	
	@Autowired
	@Qualifier("admybatis")
//	@Qualifier("jdbcAsRepo")
	private IAdminDAO adDao;
	
	@Override
	public int adminLoginCheck(String login, String pw) {
		System.out.println("SVC: adminLoginCheck() - " + login);
		
		if( login == null || login.isEmpty() ) 
				return MyCode.LOGIN_PARAM_ERROR;
		if( pw == null || pw.isEmpty() ) 
				return MyCode.LOGIN_PW_MISMATCH;
		
		// 관리자 인지?
		AdminVO ad = adDao.selectAdmin(login);
		if( ad == null ) {
			return MyCode.LOGIN_NONE; // not found
		} 
		int id = ad.getAdId();
		
		// 패스워드도 일치? 
		String dbPW = this.adDao.adminLoginCertification(login, id);
		if( dbPW.equals(pw) ) { // 인증
			return MyCode.ADMIN_LOGIN_AUTH_OK;
		} else {
			return MyCode.LOGIN_PW_MISMATCH;
		}
	}
	
	@Override
	public String adminLoginCertification(String login, int abId) {
		// TODO Auto-generated method stub
		return adDao.adminLoginCertification(login, abId);
	}
	
	@Override
	public AdminVO selectAdmin(String login) {
		// TODO Auto-generated method stub
		return adDao.selectAdmin(login);
	}
	
	@Override
	public int selectAdminIdbyLogin(String login) {
		// TODO Auto-generated method stub
		return adDao.selectAdminIdbyLogin(login);
	}
	
	@Override
	public List<MemberVO> showAllMember(MemberVO mb) {
		// TODO Auto-generated method stub
		return adDao.showAllMember(mb);
	}

	@Override
	public List<SellerVO> showAllSeller(SellerVO sel) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO selectOneMember(MemberVO mb) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO selectOneMemberId(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO showOneMemberLogin(String login) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SellerVO selectOneSeller(SellerVO sel) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SellerVO selectOneSellerId(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SellerVO showOneSellerLogin(String login) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateOneMember(MemberVO mb) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateOneSeller(SellerVO sel) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteOneMember(MemberVO mbId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteOneMember(SellerVO selId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean insertNewMember(MemberVO mb) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean insertNewSeller(SellerVO sel) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<MemberVO> showAllMembers(int offset, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FoodtruckVO> showAllFoodtruck(int offset, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MenuVO> showAllMenu(int offset, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberVO> showAllMemberJoin(MemberVO mv) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberVO> showAllMemberJoin(int mbId, String login) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SellerVO> showAllSellerJoin(SellerVO sv) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SellerVO> showAllSellerJoin(int mbId, String login) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> showAllJoin() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int countMembers() {
		return adDao.countMembers();
	}

	@Override
	public int countSellers() {
		return adDao.countSellers();
	}

	@Override
	public int countFoodTrucks() {
		return adDao.countFoodTrucks();
	}

	@Override
	public int countMenus() {
		return adDao.countMenus();
	}

	@Override
	public int countTodayOrders() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int countTodayPriceSum() {
		return adDao.countTodayPriceSum();
	}

	@Override
	public int countOrderSum() {
		return adDao.countOrderSum();
	}

	@Override
	public int countOrderPriceSum() {
		return adDao.countOrderPriceSum();
	}

	@Override
	public Map<String,Object> countMenuCategory() {
		return adDao.countMenuCategory();
	}

	@Override
	public List<MemberVO> showAllMember() {
		return adDao.showAllMember();
	}

	@Override
	public List<SellerVO> showAllSeller() {
		return adDao.showAllSeller();
	}
	
}
