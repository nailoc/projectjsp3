package com.hk.jsp.dao;

import java.sql.*;
import java.util.*;
import com.hk.jsp.vo.*;

public class ProQnaDao {
	
	/*
	 * static String driveName = "com.mysql.jdbc.Driver";
	 * static String url = "jdbc:mysql://localhost:3306/jspweb";
	 * static String user = "jsp";
	 * static String password = "1234";
	 */
	static String driveName = "com.mysql.jdbc.Driver";
	static String url = "jdbc:mysql://kclh9b.freehongs.net:3306/kclh9b";
	static String user = "kclh9b";
	static String password = "Nev%U_aPfl*n";
	
	private static Connection conn = null;
	private static Statement stmt = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
	private static ProQnaDao instance = new ProQnaDao(); 
	
	private ProQnaDao() { }
	
	public static ProQnaDao getInstance() {
		return instance;
	}
	
	private void connectDB() throws Exception {
		Class.forName(driveName);
		System.out.println("MYSQL connect");
		if(conn==null) {
			conn=DriverManager.getConnection(url, user, password);
			stmt=conn.createStatement();
			System.out.println("DB connect");
		}
	}
	
	private void closeDB() {
		
		try {
			if(conn!=null) { conn.close(); conn=null; }
			if(stmt!=null) { stmt.close(); stmt=null; }
			if(pstmt!=null) { pstmt.close(); pstmt=null; }
			if(rs!=null) { rs.close(); rs=null; }
			System.out.println("DB close");
		}catch(Exception e) {
			System.out.println("DB close exception");
		}
		
	}
	
		public List<ProQnaVo> getProQnaList() throws Exception {
			List<ProQnaVo> rst = new ArrayList<ProQnaVo>();
			connectDB();
			
			String sql = "select * from proqna";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				ProQnaVo provo = new ProQnaVo();
				provo.setQnano(rs.getInt("qnano"));
				provo.setPno(rs.getString("pno"));
				provo.setId(rs.getString("id"));
				provo.setPasswd(rs.getString("passwd"));
				provo.setTitle(rs.getString("title"));
				provo.setContents(rs.getString("contents"));
				provo.setRegdate(rs.getString("regdate"));
				provo.setViews(rs.getInt("views"));
				provo.setPrivateyn(rs.getString("privateyn"));
				provo.setAvaliable(rs.getString("avaliable"));
				provo.setComents(rs.getString("coments"));
				
				rst.add(provo);
			}		
			
			closeDB();
			return rst;
		}
	
		public List<ProQnaVo> getProQnaLists(String sort, String keyword, String type) throws Exception {
			
			List<ProQnaVo> rst = new ArrayList<ProQnaVo>();
			connectDB();
			
			String sql = "select * from proqna where "+type+" like '%"+keyword+"%' order by "+sort+ " desc";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				ProQnaVo provo = new ProQnaVo();
				provo.setQnano(rs.getInt("qnano"));
				provo.setPno(rs.getString("pno"));
				provo.setId(rs.getString("id"));
				provo.setPasswd(rs.getString("passwd"));
				provo.setTitle(rs.getString("title"));
				provo.setContents(rs.getString("contents"));
				provo.setRegdate(rs.getString("regdate"));
				provo.setViews(rs.getInt("views"));
				provo.setPrivateyn(rs.getString("privateyn"));
				provo.setAvaliable(rs.getString("avaliable"));
				provo.setComents(rs.getString("coments"));
				
				rst.add(provo);
			}
			
			closeDB();
			return rst;
		}
		
		public void increaseProQnaNo(String no) throws Exception {
			connectDB();
			String sql = String.format("update proqna set views=views+1 where qnano='%s'", no);
			int res = stmt.executeUpdate(sql);
			closeDB();
		}
		
		public ProQnaVo getProQnaByNo(String no) throws Exception {
			ProQnaVo rst = new ProQnaVo();
			connectDB();
			String sql=String.format("select * from proqna where qnano='%s'" , no);
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				rst.setQnano(rs.getInt("qnano"));
				rst.setPno(rs.getString("pno"));
				rst.setId(rs.getString("id"));
				rst.setPasswd(rs.getString("passwd"));
				rst.setTitle(rs.getString("title"));
				rst.setContents(rs.getString("contents"));
				rst.setRegdate(rs.getString("regdate"));
				rst.setViews(rs.getInt("views"));
				rst.setPrivateyn(rs.getString("privateyn"));
				rst.setAvaliable(rs.getString("avaliable"));				
				rst.setComents(rs.getString("coments"));
				if(rs.getString("coments")==null) {
					rst.setComents("");
				}
				
			}
			closeDB();
			return rst;
			
		}
		
		public ProQnaVo getProQnaByNoPno(String no, String pno) throws Exception {
			ProQnaVo rst = new ProQnaVo();
			connectDB();
			String sql=String.format("select * from proqna where qnano='%s' and pno like '%s' " , no, pno);
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				rst.setQnano(rs.getInt("qnano"));
				rst.setPno(rs.getString("pno"));
				rst.setId(rs.getString("id"));
				rst.setPasswd(rs.getString("passwd"));
				rst.setTitle(rs.getString("title"));
				rst.setContents(rs.getString("contents"));
				rst.setRegdate(rs.getString("regdate"));
				rst.setViews(rs.getInt("views"));
				rst.setPrivateyn(rs.getString("privateyn"));
				rst.setAvaliable(rs.getString("avaliable"));
				rst.setComents(rs.getString("coments"));
				if(rs.getString("coments")==null) {
					rst.setComents("코멘트가 없습니다");
				}
			}			
			
			closeDB();
			return rst;
			
		}
		
		public String chkPwd(String no) throws Exception {
			String rst = "";
			connectDB();
			
			String sql = String.format("select passwd from proqna where qnano = '%s'", no);
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				rst = rs.getString("passwd");
			}
					
			closeDB();
			return rst;
		}
		
		public int delQNA(String no) throws Exception {
			int rst = 0;
			connectDB();		
			
			String sql = String.format("delete from proqna where qnano='%s'",no);
			rst = stmt.executeUpdate(sql);	
			
			closeDB();
			return rst;
		}
		
		
		public int saveBoard(ProQnaVo provo) throws Exception {
			int rst=0;
			connectDB();
			StringBuffer sb = new StringBuffer("");
			sb.append("insert into proqna (pno,title,id,passwd,contents,regdate)");
			sb.append("\n values ( ?, ?, ?, ?, ?, now() ) ");
			String sql = sb.toString();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, provo.getPno());
			pstmt.setString(2, provo.getTitle());
			pstmt.setString(3, provo.getId());
			pstmt.setString(4, provo.getPasswd());
			pstmt.setString(5, provo.getContents());
			rst = pstmt.executeUpdate();
			closeDB();
			return rst;
		}
		
		public int saveAnswer(String cont, String no)  throws Exception {
			int rst = 0;
			connectDB();
			
			String sql = String.format("update proqna set coments = '%s' where qnano = '%s'",cont,no);
			rst = stmt.executeUpdate(sql);
					
			closeDB();
			return rst;
		}
		
		public int delAnswer(String no)  throws Exception {
			int rst = 0;
			connectDB();			

			String sql = String.format("update proqna set coments = null where qnano = '%s'",no);
			rst = stmt.executeUpdate(sql);
					
			closeDB();
			return rst;
		}
		
}
