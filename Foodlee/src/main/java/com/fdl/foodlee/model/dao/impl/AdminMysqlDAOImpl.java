package com.fdl.foodlee.model.dao.impl;

import java.util.HashMap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.dao.inf.IAdminDAO;
import com.fdl.foodlee.model.vo.AdminVO;
import com.fdl.foodlee.model.vo.FoodtruckVO;
import com.fdl.foodlee.model.vo.MemberVO;
import com.fdl.foodlee.model.vo.MenuVO;
import com.fdl.foodlee.model.vo.SellerVO;
// @Repository("jdbcAsRepo")
@Repository
public class AdminMysqlDAOImpl implements IAdminDAO {
	public static final String SQL_SELECT_MEMBER_COUNT = "select count(*) from members";
	public static final String SQL_SELECT_SELLER_COUNT = "select count(*) from sellers;";
	public static final String SQL_SELECT_FOODTRUCK_COUNT = "select count(*) from foodtrucks;";
	public static final String SQL_SELECT_MENU_COUNT = "select count(*) from menus";
	public static final String SQL_SELECT_TODAY_ORDER_COUNT = "SELECT count(*) FROM orders "
			+ "WHERE DATE_FORMAT(order_date, '%Y-%m-%d') = CURDATE()";
	public static final String SQL_SELECT_TODAY_ORDER_PRICE_SUM = "SELECT sum(order_price_sum) FROM orders "
			+ "WHERE DATE_FORMAT(order_date, '%Y-%m-%d') = CURDATE()";
	public static final String SQL_SELECT_ORDER_COUNT = "select count(*) from orders";
	public static final String SQL_SELECT_ORDER_PRICE_SUM = "select sum(order_price_sum) from orders";
	
	
	@Autowired
	private JdbcTemplate jtem;

	@Override
	public int adminLoginCheck(String login, String pw) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String adminLoginCertification(String login, int adId) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public AdminVO selectAdmin(String login) {
		return null;
	}
	
	@Override
	public int selectAdminIdbyLogin(String login) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MemberVO> showAllMember(MemberVO mb) {
		// TODO Auto-generated method stub
		return null;
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
		return jtem.queryForObject(SQL_SELECT_MEMBER_COUNT, Integer.class);
	}

	@Override
	public int countSellers() {
		return jtem.queryForObject(SQL_SELECT_SELLER_COUNT, Integer.class);
	}

	@Override
	public int countFoodTrucks() {
		return jtem.queryForObject(SQL_SELECT_FOODTRUCK_COUNT, Integer.class);
	}

	@Override
	public int countMenus() {
		return jtem.queryForObject(SQL_SELECT_MENU_COUNT, Integer.class);
	}

	@Override
	public int countTodayOrders() {
		return jtem.queryForObject(SQL_SELECT_TODAY_ORDER_COUNT, Integer.class);
	}

	@Override
	public int countTodayPriceSum() {
		return jtem.queryForObject(SQL_SELECT_TODAY_ORDER_PRICE_SUM, Integer.class);
	}

	@Override
	public int countOrderSum() {
		return jtem.queryForObject(SQL_SELECT_ORDER_COUNT, Integer.class);
	}

	@Override
	public int countOrderPriceSum() {
		return jtem.queryForObject(SQL_SELECT_ORDER_PRICE_SUM, Integer.class);
	}
}
