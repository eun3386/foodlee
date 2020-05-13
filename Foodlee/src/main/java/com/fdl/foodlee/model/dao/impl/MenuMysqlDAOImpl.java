package com.fdl.foodlee.model.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import com.fdl.foodlee.model.dao.inf.IMenuDAO;
import com.fdl.foodlee.model.vo.MenuVO;

public class MenuMysqlDAOImpl implements IMenuDAO {
	
	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
/*
private int menuId;
private String menuName;
private String menuType;
private int menuPrice;
private String menuPic;
private String menuInfor;
private String rawMaterials;
 */
	// 메뉴를 등록 할 수 있다.
	public boolean insertNewMenu(MenuVO mn) {
		if( conn != null ) {
			String sql = "insert into menus values(null,?,?,?,?,?,?)";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, mn.getMenuId());
				pstmt.setString(2, mn.getMenuName());
				pstmt.setString(3, mn.getMenuType());
				pstmt.setInt(4, mn.getMenuPrice());
				pstmt.setString(5, mn.getMenuPic());
				pstmt.setString(6, mn.getMenuInfor());
				pstmt.setString(7, mn.getRawMaterials());
				int r = pstmt.executeUpdate();
				if( r == 1 ) {
					System.out.println(mn.getMenuName() + " 메뉴 등록 성공!");
					return true;
				} else {
					System.out.println("메뉴 등록 실패!");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	// 사장님이 메뉴 번호를 받아 메뉴를 조회 할 수 있다.
	public MenuVO selectOneMenu(int mId) {
		if( conn != null ) {
			String sql = "select * from menus where menu_id = '" + mId + "'";
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				if( rs.next() ) {
					MenuVO mn
						= new MenuVO(
								rs.getInt("menu_id"),
								rs.getString("menu_name"),
								rs.getString("menu_type"),
								rs.getInt("menu_price"),
								rs.getString("menu_pic"),
								rs.getString("menu_infor"),
								rs.getString("menu_rawmaterials"));
					System.out.println(mId + "번 " + mn.getMenuName() + " 메뉴");
					return mn;
				} else {
					System.out.println("메뉴 조회 에러");
					return null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	// 사장님이 메뉴 이름을 받아 메뉴를 조회 할 수 있다.
	public MenuVO selectOneMenu(String name) {
		if( conn != null ) {
			String sql = "select * from menus where menu_name = '" + name + "'";
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				if( rs.next() ) {
					MenuVO mn
						= new MenuVO(
								rs.getInt("menu_id"),
								rs.getString("menu_name"),
								rs.getString("menu_type"),
								rs.getInt("menu_price"),
								rs.getString("menu_pic"),
								rs.getString("menu_infor"),
								rs.getString("menu_rawmaterials"));
					System.out.println(name + " 메뉴 조회");
					return mn;
				} else {
					System.out.println("메뉴 조회 에러");
					return null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	// 고객이 메뉴를 검색 할 수 있다.
	public MenuVO searchOneMenu(String name) {
		if( conn != null ) {
			String sql = "select * from menus where menu_name = '" + name + "'";
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				if( rs.next() ) {
					MenuVO mn
						= new MenuVO(
								rs.getInt("seller_id"),
								rs.getString("menu_name"),
								rs.getString("menu_type"),
								rs.getInt("menu_price"),
								rs.getString("menu_pic"),
								rs.getString("menu_infor"),
								rs.getString("menu_rawmaterials"));
					System.out.println(name + " 메뉴 조회");
					return mn;
				} else {
					System.out.println("메뉴 조회 에러");
					return null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	// 등록된 메뉴를 업데이트 할 수 있다.
	public boolean updateMenu(MenuVO mn) {
		if( conn != null ) {
			String sql = "update menus set menu_name=?, menu_type=?, menu_price=?,"
					+ "menu_pic=?, menu_infor=?, menu_rawmaterials=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, mn.getMenuId());
				pstmt.setString(2, mn.getMenuName());
				pstmt.setString(3, mn.getMenuType());
				pstmt.setInt(4, mn.getMenuPrice());
				pstmt.setString(5, mn.getMenuPic());
				pstmt.setString(6, mn.getMenuInfor());
				pstmt.setString(7, mn.getRawMaterials());
				int r = pstmt.executeUpdate();
				if( r == 1 ) {
					System.out.println(mn.getMenuId() + "번 메뉴 업데이트 성공!");
					return true;
				} else {
					System.out.println(mn.getMenuId() + "번 메뉴 업데이트  실패!");
					return false;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	// 등록된 메뉴를 삭제 할 수 있다.
	public boolean deleteMenu(MenuVO mn) {
		if( conn != null ) {
			String sql = "delete from menus where menu_name = ?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mn.getMenuName());
				int r = pstmt.executeUpdate();
				if( r == 1 ) {
					System.out.println(mn.getMenuName() + " 메뉴 삭제 성공");
					return true;
				} else {
					System.out.println(mn.getMenuName() + " 메뉴 삭제 실패");
					return false;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	@Override
	public List<MenuVO> showAllMenu(int sId) {
		// TODO Auto-generated method stub
		return null;
	}
	
}











