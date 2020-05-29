package com.fdl.foodlee.model.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.dao.inf.IMenuDAO;
import com.fdl.foodlee.model.vo.MenuVO;

@Repository
public class MenuMysqlDAOImpl implements IMenuDAO {
	
//	Connection conn;
//	Statement stmt;
//	PreparedStatement pstmt;
//	ResultSet rs;
	
	
/*
private int menuId;
private String menuName;
private String menuType;
private int menuPrice;
private String menuPic;
private String menuInfor;
private String rawMaterials;
 */
	// SQL부
	private static final String
		SQL_INSERT_MENU = "insert into menus values(null,?,?,?,?,?,?,?)";
	private static final String
		SQL_SELECT_MENU_ID = "select * from menus where menu_id = ?";
	private static final String
	SQL_SELECT_MENU_SELLER_ID = "select * from menus where seller_id = ?";
	private static final String
		SQL_SELECT_MENU_NAME = "select * from menus where menu_name = ?";
	private static final String
		SQL_UPDATE_MENU = "update menus set menu_name=?, menu_type=?, menu_price=?, "
					+ "menu_pic=?, menu_infor=?, rawmaterials=?";
	private static final String
		SQL_DELETE_MENU = "delete from menus where menu_name = ?";
	private static final String
		SQL_SELECT_ALL_MENU_SELLERID = "select * from menus where seller_id = ?";
	// 의존관계 자동주입...
	@Autowired
	private JdbcTemplate jtem;
	
	// 메뉴를 등록 할 수 있다.
	@Override //TODO 사진
	public boolean insertNewMenu(MenuVO mn) {
		int r = jtem.update(SQL_INSERT_MENU,
				mn.getSellerId(), mn.getMenuName(), 
				mn.getMenuType(), mn.getMenuPrice(), 
				mn.getMenuPic(), mn.getMenuInfor(), 
				mn.getRawMaterials());
		return (r == 1);
	}

	// 사장님이 메뉴 번호를 받아 메뉴를 조회 할 수 있다.
	public MenuVO selectOneMenu(int mId) {
		return (MenuVO) jtem.query(SQL_SELECT_MENU_ID,
				BeanPropertyRowMapper
				.newInstance(MenuVO.class), mId);
	}
	
	// 판매자 아이디를 받아 메뉴 조회
	
	// 사장님이 메뉴 이름을 받아 메뉴를 조회 할 수 있다.
	public MenuVO selectOneMenu(String name) {
		return (MenuVO) jtem.query(SQL_SELECT_MENU_NAME,
				BeanPropertyRowMapper
				.newInstance(MenuVO.class), name);
	}

	// 고객이 메뉴를 검색 할 수 있다.
	public MenuVO searchOneMenu(String name) {
		return (MenuVO) jtem.query(SQL_SELECT_MENU_NAME,
				BeanPropertyRowMapper
				.newInstance(MenuVO.class), name);
	}

	// 등록된 메뉴를 업데이트 할 수 있다.
	public boolean updateMenu(MenuVO mn) {
		int r = jtem.update(SQL_UPDATE_MENU,
				mn.getMenuName(), mn.getMenuType(), mn.getMenuPrice(),
				mn.getMenuPic(), mn.getMenuInfor(), mn.getRawMaterials());
		return r == 1;
	}

	// 등록된 메뉴를 삭제 할 수 있다.
	public boolean deleteMenu(MenuVO mn) {
		int r = jtem.update(SQL_DELETE_MENU,
				mn.getMenuName());
		return r == 1;
	}
	// 전체 메뉴를 조회 할 수 있다.
	public List<MenuVO> showAllMenu(int sId){
		return jtem.query(SQL_SELECT_ALL_MENU_SELLERID, 
		 		 BeanPropertyRowMapper.newInstance(MenuVO.class), sId);
	}
}











