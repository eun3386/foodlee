package com.fdl.foodlee.model.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.List;

import com.fdl.foodlee.model.dao.inf.IFoodtruckDAO;
import com.fdl.foodlee.model.vo.FoodtruckVO;

public class FoodtruckMysqlDAOImpl implements IFoodtruckDAO {

	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
/*
private int sellerId; // 판매자 번호 ⇔ integer seller_id NN <<FK>>
private String foodtruckImgPath; // 푸드트럭 이미지 경로 ⇔ varchar (256) foodtruck_img_path  NN
private String foodtruckName; // 푸드트럭 이름 ⇔ varchar (64) foodtruck_name NN
private String foodtruckMainMenu; // 푸드트럭 대표메뉴 ⇔ varchar (512) foodtruck_main_menu NN
private String foodtruckLocation; // 푸드트럭 위치 ⇔ varchar(256) foodtruck_location NN
private String foodtruckOperationHour; // 푸드트럭 영업시간 ⇔ varchar (64)  foodtruck_operation_hour NN	
private int favoriteCount; // 좋아요 트럭 ⇔ integer favorite_count <<FK>>
private String sellerFoodtruckCoordinate; // 판매자 푸드트럭 좌표 ⇔ varchar(1024) seller_foodtruck_coordinate NN
private Timestamp locationUpdatedAt; // 위치이동날짜 ⇔ timestamp location_updated_at CURRENT_TIMESTAMP
 */
	
	// 판매자의 새 푸드트럭을 등록 할 수 있다.
	public boolean insertNewFoodtruck(FoodtruckVO ft) {
		if( conn != null ) {
			String sql = "insert into foodtrucks"
						+ "values(null,?,?,?,'',?,0,'',now())";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ft.getSellerId());
				pstmt.setString(2, ft.getFoodtruckImgPath());
				pstmt.setString(3, ft.getFoodtruckName());
				pstmt.setString(4, ft.getFoodtruckMainMenu());
				pstmt.setString(5, ft.getFoodtruckLocation());
				pstmt.setString(6, ft.getFoodtruckOperationHour());
				pstmt.setInt(7, ft.getFavoriteCount());
				pstmt.setString(8, ft.getSellerFoodtruckCoordinate());
				pstmt.setTimestamp(9, ft.getLocationUpdatedAt());
				int r = pstmt.executeUpdate();
				if( r == 1 ) {
					System.out.println(ft.getSellerId() + "번 판매자님의 " + ft.getFoodtruckName() + " 푸드 트럭 개업을 축하합니다!");
					return true;
				} else {
					System.out.println("푸드 트럭 등록 에러");
					return false;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	// 판매자의 ID를 받아 푸드트럭 정보를 조회 할 수 있다.
	public FoodtruckVO selectOneFoodtruck(int sellerId) {
		if( conn != null ) {
			String sql = "select * from foodtrucks where seller_id = '" + sellerId + "'";
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				if( rs.next() ) {
					FoodtruckVO ft
						= new FoodtruckVO(
								rs.getInt("seller_id"),
								rs.getString("foodtruck_img_path"),
								rs.getString("foodtruck_name"),
								rs.getString("foodtruck_main_menu"),
								rs.getString("foodtruck_location"),
								rs.getString("foodtruck_operation_hour"),
								rs.getInt("favorite_count"),
								rs.getString("seller_foodtruck_coordinate"),
								rs.getTimestamp("location_updated_at"));
					System.out.println(sellerId + "번 판매자님의 " + ft.getFoodtruckName() + " 푸드 트럭 정보 조회");
					return ft;
				} else {
					System.out.println("푸드 트럭 조회 에러");
					return null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	// 푸드트럭 이름을 받아 푸드트럭 정보를 조회 할 수 있다.
	public FoodtruckVO selectOneFoodtruck(String foodtruckName) {
		if( conn != null ) {
			String sql = "select * from foodtrucks where foodtruck_name = '" + foodtruckName + "'";
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				if( rs.next() ) {
					FoodtruckVO ft
						= new FoodtruckVO(
								rs.getInt("seller_id"),
								rs.getString("foodtruck_img_path"),
								rs.getString("foodtruck_name"),
								rs.getString("foodtruck_main_menu"),
								rs.getString("foodtruck_location"),
								rs.getString("foodtruck_operation_hour"),
								rs.getInt("favorite_count"),
								rs.getString("seller_foodtruck_coordinate"),
								rs.getTimestamp("location_updated_at"));
					System.out.println(ft.getSellerId() + "번 판매자님의 " + foodtruckName + " 푸드 트럭 정보 조회");
					return ft;
				} else {
					System.out.println("푸드 트럭 조회 에러");
					return null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	// 판매자가 자신의 푸드 트럭 정보를 업데이트 할 수 있다.
	public boolean updateOneFoodtruck(FoodtruckVO ft) {
		if( conn != null ) {
			String sql = "update foodtrucks set foodtruck_img_path=?, foodtruck_name=?, "
					+ "foodtruck_main_menu, foodtruck_location='', "
					+ "foodtruck_operation_hour=?, seller_foodtruck_coordinate='', "
					+ "location_updated_at=now()";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ft.getSellerId());
				pstmt.setString(2, ft.getFoodtruckImgPath());
				pstmt.setString(3, ft.getFoodtruckName());
				pstmt.setString(4, ft.getFoodtruckMainMenu());
				pstmt.setString(5, ft.getFoodtruckLocation());
				pstmt.setString(6, ft.getFoodtruckOperationHour());
				pstmt.setInt(7, ft.getFavoriteCount());
				pstmt.setString(8, ft.getSellerFoodtruckCoordinate());
				pstmt.setTimestamp(9, ft.getLocationUpdatedAt());
				int r = pstmt.executeUpdate();
				if( r == 1 ) {
					System.out.println(ft.getSellerId() + "번 판매자님의 푸드 트럭 업데이트 성공!");
					return true;
				} else {
					System.out.println("푸드 트럭 업데이트 에러!");
					return false;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	// 판매자가 등록된 자신의 푸드 트럭을 삭제 할 수 있다.
	public boolean deleteOneFoodtruck(FoodtruckVO ft) {
		if( conn != null ) {
			String sql = "delete from foodtrucks where foodtruck_name = ?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, ft.getFoodtruckName());
				int r = pstmt.executeUpdate();
				if( r == 1 ) {
					System.out.println("푸드 트럭 삭제 성공!");
					return true;
				} else {
					System.out.println("푸드 트럭 삭제 에러");
					return false;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	// 구매자가 푸드 트럭을 좋아요 할 수 있다.
	public boolean likeFoodtruck(int ftId, int mbId) {
		return false;
	}
	// 구매자가 푸드 트럭 리스트를 검색 할 수 있다.
	public List<FoodtruckVO> searchOneFoodtruck(String foodtruckMainMenu) {
		return null;
	}
	
}












