package com.hk.jsp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBDao {

	protected String driveName= "com.mysql.jdbc.Driver";
	//protected static String url = "jdbc:mysql://localhost:3306/jspweb?allowMultiQueries=true&autoReconnect=true&validationQuery=select 1";
	//protected static String user = "jsp";
	//protected static String password = "1234";
	
	protected static String url = "jdbc:mysql://kclh9b.freehongs.net:3306/kclh9b?autoReconnect=true&validationQuery=select 1";
	protected static String user = "kclh9b";
	protected static String password = "Nev%U_aPfl*n";
	
	protected static Connection conn = null;
	protected static Statement stmt = null; 
	protected static Statement stmt2 = null; 
	protected static PreparedStatement pstmt = null;
	protected static ResultSet rs = null;
	protected static ResultSet rs2 = null;
	
	protected DBDao() {}
	
	private static DBDao instance = new DBDao();
	
	public static DBDao getInstance() {
		return instance;
	}
	
	protected void connectDB() {
		try {
			if(conn==null) { 
				conn=DriverManager.getConnection(url, user, password);
				stmt = conn.createStatement();
				stmt2 = conn.createStatement();
				System.out.println("MYSQL connect");
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	protected void closeDB() {
		try {
			if(conn!=null) {conn.close(); conn=null;}
			if(stmt!=null) {stmt.close(); stmt=null;}
			if(stmt2!=null) {stmt2.close(); stmt2=null;}
			if(pstmt!=null) {pstmt.close(); pstmt=null;}
			if(rs!=null) {rs.close(); rs=null;}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	public void test() {
		connectDB();
		closeDB();
	}
}
