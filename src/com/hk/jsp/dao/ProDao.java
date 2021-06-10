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
	
	private ProDao() { }
	
	public static ProDao getInstance() {
		return instance;
	}
	
	private void connectDB() throws Exception {
		Class.forName(driveName);
		System.out.println("드라이브 로딩 성공");
		if(conn==null) {
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
			System.out.println("오라클 접속 종료");
		}catch(Exception e) {
			System.out.println("종료오류");
		}
		
	}
	
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
		
		public void increaseProRVNo(String no) throws Exception {
			connectDB();
			String sql = String.format("update proreview set views=views+1 where revno='%s'", no);
			int res = stmt.executeUpdate(sql);
			closeDB();
		}
		
		public ProReviewVo getProVByNo(String no) throws Exception {
			ProReviewVo rst = new ProReviewVo();
			connectDB();
			String sql=String.format("select revno, pno, title, contents, id, regdate, views, score, attach1, passwd from proreview where revno='%s'" , no);
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				rst.setRevno(rs.getInt("revno"));
				rst.setPno(rs.getString("pno"));
				rst.setTitle(rs.getString("title"));
				rst.setId(rs.getString("id"));
				rst.setRegdate(rs.getString("regdate"));
				rst.setViews(rs.getInt("views"));
				rst.setScore(rs.getInt("score"));
				rst.setContents(rs.getString("contents"));		
				rst.setAttach1(rs.getString("attach1"));
				rst.setPasswd(rs.getString("passwd"));
			}
			closeDB();
			return rst;
			
		}
		
		public ProReviewVo getProVByNoPno(String no, String pno) throws Exception {
			ProReviewVo rst = new ProReviewVo();
			connectDB();
			String sql=String.format("select revno, pno, title, contents, id, regdate, views, score, attach1, passwd from proreview where revno='%s' and pno like '%s' " , no, pno);
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				rst.setRevno(rs.getInt("revno"));
				rst.setPno(rs.getString("pno"));
				rst.setTitle(rs.getString("title"));
				rst.setId(rs.getString("id"));
				rst.setRegdate(rs.getString("regdate"));
				rst.setViews(rs.getInt("views"));
				rst.setScore(rs.getInt("score"));
				rst.setContents(rs.getString("contents"));		
				rst.setAttach1(rs.getString("attach1"));
				rst.setPasswd(rs.getString("passwd"));
			}
			closeDB();
			return rst;
			
		}
		
		public String chkPwd(String no) throws Exception {
			String rst = "";
			connectDB();
			
			String sql = String.format("select passwd from proreview where revno = '%s'", no);
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				rst = rs.getString("passwd");
			}
					
			closeDB();
			return rst;
		}
		
		public int delPRV(String no) throws Exception {
			int rst = 0;
			connectDB();		
			
			String sql = String.format("delete from proreview where revno='%s'",no);
			rst = stmt.executeUpdate(sql);	
			
			closeDB();
			return rst;
		}
		
}
