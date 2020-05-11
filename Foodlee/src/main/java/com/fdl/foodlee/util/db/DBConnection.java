package com.fdl.foodlee.util.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLTimeoutException;
import java.sql.Statement;

public class DBConnection {
	public static final String DB_DRIVER 
		= "com.mysql.jdbc.Driver"; // org.gjt.mm.mysql.Driver?
	public static final String URL 
		= "jdbc:mysql://localhost";	
	public static final String PORT = "3306";
	public static final String DBNAME = "foodle_DB";
	public static final String LOGIN = "root";
	public static final String PW = "marshall1221";

	public static Connection conn;
//	public static Statement stmt;
//	public static PreparedStatement pstmt;
//	public static ResultSet rs;

	public static Connection getConn() {
		if( conn != null ) return conn;
		else // null
			return connetDB();
	}
	
	public static Connection connetDB() {
		try {
			Class.forName(DB_DRIVER);
			String dbURL = URL+ ":" + PORT
							+ "/" + DBNAME;
			conn = DriverManager
					.getConnection(dbURL, LOGIN, PW);
			System.out.println("MySQL " + DBNAME +
					" 접속 성공!");
			return conn;
		//} catch (ClassNotFoundException | SQLException e) {
		} catch (ClassNotFoundException e) {
			System.out.println("접속 실패 1");
			e.printStackTrace();
		} catch (SQLTimeoutException e) {
			System.out.println("접속 실패 2 - 시간만료");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("접속 실패 3");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("일반 자바 실패들.. ");
			e.printStackTrace();
		}
		return null;
	}

	public static boolean terminateDB() {		
		if( conn != null ) {
			try {
				conn.close();
				System.out.println("DB 접속해제 성공!");
				return true;
			} catch (SQLException e) {
				System.out.println("DB 접속해제 실패..");
				e.printStackTrace();				
			}
		}
		return false;
	}
	
	public static boolean releaseRS(ResultSet rs) {		
		if( conn != null && rs != null ) {
			try {				
				rs.close();
				System.out.println("RS 해제 성공!");
				return true;
			} catch (SQLException e) {
				System.out.println("RS 해제 실패..");
				e.printStackTrace();				
			}
		}
		return false;
	}
	
	public static boolean releaseStmt(Statement stmt) {		
		if( conn != null && stmt != null ) {
			try {				
				stmt.close();
				System.out.println("stmt 해제 성공!");
				return true;
			} catch (SQLException e) {
				System.out.println("stmt 해제 실패..");
				e.printStackTrace();				
			}
		}
		return false;
	}	
	
	public static boolean releasePstmt(
			PreparedStatement pstmt) {		
		if( conn != null && pstmt != null ) {
			try {				
				pstmt.close();
				System.out.println("pstmt 해제 성공!");
				return true;
			} catch (SQLException e) {
				System.out.println("pstmt 해제 실패..");
				e.printStackTrace();				
			}
		}
		return false;
	}	
	
//	public static boolean releaseRS(
//			Connection conn,
//			ResultSet rs) {		
//		if( conn != null ) {
//			try {
//				rs.close();
//				System.out.println("RS 해제 성공!");
//				return true;
//			} catch (SQLException e) {
//				System.out.println("RS 해제 실패..");
//				e.printStackTrace();				
//			}
//		}
//		return false;
//	}	
	
	public static void main(String[] args) {
		DBConnection.getConn();
		DBConnection.terminateDB();
	}
}











