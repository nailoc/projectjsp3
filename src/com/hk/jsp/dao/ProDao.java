package com.hk.jsp.dao;

import java.sql.*;
import java.util.*;
import com.hk.jsp.vo.*;

public class ProDao {

	static String driveName = "com.mysql.jdbc.Driver";
	static String url = "jdbc:mysql://localhost:3306/jspweb";
	static String user = "jsp";
	static String password = "1234";
	
	private static Connection conn = null;
	private static Statement stmt = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
	private static ProDao instance = new ProDao(); 
	// 자신의 클래스에 대한 참조변수
	
	private ProDao() { } // 생성자
	
	public static ProDao getInstance() {
		return instance;
	}
	
	private void connectDB() throws Exception {
		Class.forName(driveName);
		System.out.println("오라클 드라이버로딩성공");
		if(conn==null) { //접속이 안된 상태면
			conn=DriverManager.getConnection(url, user, password);
			stmt=conn.createStatement();
			System.out.println("오라클 접속 성공");
		}
	}
	
	private void closeDB() {
		
		try {
			if(conn!=null) { conn.close(); conn=null; }
			if(stmt!=null) { stmt.close(); stmt=null; }
			if(pstmt!=null) { pstmt.close(); pstmt=null; }
			if(rs!=null) { rs.close(); rs=null; }
			System.out.println("오라클 접속 종료 완료");
		}catch(Exception e) {
			System.out.println("오라클 접속 종료 오류");
		}
		
	}
	
	// 제품 리스트
		public List<ProReviewVo> getProList() throws Exception {
			List<ProReviewVo> rst = new ArrayList<ProReviewVo>();
			connectDB();
			
			String sql = "select * from proreview";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				ProReviewVo provo = new ProReviewVo();
				provo.setRevno(rs.getInt("revno"));
				provo.setPno(rs.getString("pno"));
				provo.setId(rs.getString("id"));
				provo.setPasswd(rs.getString("passwd"));
				provo.setTitle(rs.getString("title"));
				provo.setContents(rs.getString("contents"));
				provo.setRegdate(rs.getString("regdate"));
				provo.setViews(rs.getInt("views"));
				provo.setScore(rs.getInt("score"));
				provo.setAttach1(rs.getString("attach1"));
				provo.setAvaliable(rs.getString("avaliable"));
				rst.add(provo);
			}		
			
			closeDB();
			return rst;
		}
	
		// 정렬 , 검색
		public List<ProReviewVo> getProLists(String sort, String keyword, String type) throws Exception {
			
			List<ProReviewVo> rst = new ArrayList<ProReviewVo>();
			connectDB();
			
			String sql = "select * from proreview where "+type+" like '%"+keyword+"%' order by "+sort+ " desc";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				ProReviewVo provo = new ProReviewVo();
				provo.setRevno(rs.getInt("revno"));
				provo.setPno(rs.getString("pno"));
				provo.setId(rs.getString("id"));
				provo.setPasswd(rs.getString("passwd"));
				provo.setTitle(rs.getString("title"));
				provo.setContents(rs.getString("contents"));
				provo.setRegdate(rs.getString("regdate"));
				provo.setViews(rs.getInt("views"));
				provo.setScore(rs.getInt("score"));
				provo.setAttach1(rs.getString("attach1"));
				provo.setAvaliable(rs.getString("avaliable"));
				rst.add(provo);
			}
			
			closeDB();
			return rst;
		}
		
}
