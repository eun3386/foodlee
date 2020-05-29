package com.fdl.foodlee.model.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.dao.inf.IAdminDAO;
import com.fdl.foodlee.model.vo.AdminVO;
import com.fdl.foodlee.model.vo.FoodtruckVO;
import com.fdl.foodlee.model.vo.MemberVO;
import com.fdl.foodlee.model.vo.MenuVO;
import com.fdl.foodlee.model.vo.SellerVO;

@Repository("admybatis")
public class AdminMysqlMybatisDAOImpl implements IAdminDAO {
	
	@Autowired
	private SqlSessionTemplate sstem;
	
	@Override
	public int adminLoginCheck(String login, String pw) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public String adminLoginCertification(String login, int adId) {
		HashMap<String, Object> pMap = new HashMap<>();
		pMap.put("login", login);
		pMap.put("adId", adId);
		HashMap<String, Object> rMap = 
		sstem.selectOne("IAdminDAO.admin_login_certification", pMap);
		System.out.println("rMap: login = " + rMap.get("login"));
		System.out.println("rMap: pw = " + rMap.get("password"));
		return (String)rMap.get("password");
	}
	
	@Override
	public AdminVO selectAdmin(String login) {
			AdminVO ad = (AdminVO)sstem.selectOne("IAdminDAO.select_admin", login);
			return ad;
	}
	
	@Override
	public int selectAdminIdbyLogin(String login) {
		return sstem.selectOne("IAdminDAO.select_admin_idby_login", login);
	}
	
	@Override
	public List<MemberVO> showAllMember(MemberVO mb) {
		System.out.println("mybatis - showAllMember()");
		List<MemberVO> mbList = sstem.selectList("IAdminDAO.showAllMember", mb);
		return mbList;
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
		return sstem.selectOne("IAdminDAO.SQL_SELECT_MEMBER_COUNT");
	}

	@Override
	public int countSellers() {
		return sstem.selectOne("IAdminDAO.SQL_SELECT_SELLER_COUNT");
	}

	@Override
	public int countFoodTrucks() {
		return sstem.selectOne("IAdminDAO.SQL_SELECT_FOODTRUCK_COUNT");
	}

	@Override
	public int countMenus() {
		return sstem.selectOne("IAdminDAO.SQL_SELECT_MENU_COUNT");
	}

	@Override
	public int countTodayOrders() {
		return sstem.selectOne("IAdminDAO.SQL_SELECT_TODAY_ORDER_COUNT");
	}

	@Override
	public int countTodayPriceSum() {
		return sstem.selectOne("IAdminDAO.SQL_SELECT_TODAY_ORDER_PRICE_SUM");
	}

	@Override
	public int countOrderSum() {
		return sstem.selectOne("IAdminDAO.SQL_SELECT_ORDER_COUNT");
	}

	@Override
	public int countOrderPriceSum() {
		return sstem.selectOne("IAdminDAO.SQL_SELECT_ORDER_PRICE_SUM");
	}

	@Override
	public List<Integer> countMenuCategory() {
		return sstem.selectList("IAdminDAO.SQL_SELECT_MENU_CATEGORYS");
	}

}
