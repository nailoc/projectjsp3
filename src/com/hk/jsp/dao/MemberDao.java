package com.hk.jsp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hk.jsp.vo.MemberVo;
import com.hk.jsp.vo.UserVo;



public class MemberDao {
	static String driveName = "com.mysql.jdbc.Driver";
	static String url = "jdbc:mysql://kclh9b.freehongs.net:3306/kclh9b";
	static String user = "kclh9b";
	static String password = "Nev%U_aPfl*n";
	
	private static Connection conn = null;
	private static Statement stmt = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;

	private static MemberDao instance = null;
	public static MemberDao getInstance() {
		if(instance==null) {
			instance = new MemberDao();
		}
		return instance;
	}
	{
		try{
			Class.forName(driveName);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
	}
	

	private void connectDB() throws Exception {
		if(conn==null) { 
			conn=DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
		}
	}

	private void closeDB() {
		try {
			if(conn!=null) { conn.close(); conn=null; }
			if(stmt!=null) { stmt.close(); stmt=null; }
			if(pstmt!=null) { pstmt.close(); pstmt=null; }
			if(rs!=null) { rs.close(); rs=null; }
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}catch(Exception e2) {
			System.out.println(e2.getMessage());
		}
	}

	public int loginck(String id, String pw) throws Exception {
		int rst=0;
		String dbid = "";
		String dbpw = "";
		connectDB();
		String sql = String.format("select id, passwd from member where id='%s'", id);
		rs=stmt.executeQuery(sql);
		while(rs.next() ) {
			dbid = rs.getString("id");
			dbpw = rs.getString("passwd");
		}
		
		if(dbid.equals(id)) 
		{
			if(dbpw.equals(pw)) {
				rst = 1; 
			}else {
				rst = -1; 
			}
		}else {
			rst = 0;   
		}

		return rst;
	
	}
	
	
	
	public int regMember(MemberVo memvo) throws Exception {
		int rst = 0;
		connectDB();
		StringBuffer sb = new StringBuffer("");
		sb.append("insert into member (id, passwd, name, resinum, address, address2, zipcode, phn, email, point) ");
		sb.append("\n values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		String sql = sb.toString();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memvo.getId());
		pstmt.setString(2, memvo.getPasswd());
		pstmt.setString(3, memvo.getName());
		pstmt.setString(4, memvo.getResinum());
		pstmt.setString(5, memvo.getAddress());
		pstmt.setString(6, memvo.getAddress2());
		pstmt.setString(7, memvo.getZipcode());
		pstmt.setString(8, memvo.getPhn());
		pstmt.setString(9, memvo.getEmail());
		pstmt.setInt(10, memvo.getPoint());
		rst = pstmt.executeUpdate();
		closeDB();
		return rst;		
	}
	
	
	public int delMember(String id) throws Exception  {
		connectDB();
		String sql = String.format("delete from member where id='%s'", id);
		int res = stmt.executeUpdate(sql);
		closeDB();
		return res;
	}
	
	
	public MemberVo memberInfo(String id) throws Exception {
		MemberVo rst = new MemberVo();
		connectDB();
		String sql = String.format("select id, name, passwd, email, address, address2 from member where id='%s'", id);
		rs = stmt.executeQuery(sql);
		while(rs.next() ) {
			rst.setId(rs.getString("id"));
			rst.setName(rs.getString("name"));
			rst.setPasswd(rs.getString("passwd"));
			rst.setEmail(rs.getString("email"));
			rst.setAddress(rs.getString("address1"));
	 		rst.setAddress2(rs.getString("address2"));
		}
		closeDB();
		return rst;
	}


	public int Modify_ps(String id, String passwd) throws Exception {
		connectDB();
		String sql = String.format("update member set passwd='%s' where id='%s'", passwd, id);
		int res = stmt.executeUpdate(sql);
		closeDB();
		return res;
	}
	
	public int Modify_email(String id, String email) throws Exception {
		connectDB();
		String sql = String.format("update member set email='%s' where id='%s'", email, id);
		int res = stmt.executeUpdate(sql);
		closeDB();
		return res;
	}
	
	
	public List<MemberVo> AllmemberInfo() throws Exception {
		List<MemberVo> memlist = new ArrayList<MemberVo>();			
		connectDB();
		String sql = "select * from member";
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			MemberVo member = new MemberVo();
			member.setId(rs.getString("id"));
			member.setPasswd(rs.getString("passwd"));
			member.setName(rs.getString("name"));
			member.setResinum(rs.getString("resinum"));
			member.setAddress(rs.getString("address"));
			member.setAddress2(rs.getString("address2"));
			member.setZipcode(rs.getString("zipcode"));
			member.setPhn(rs.getString("phn"));
			member.setEmail(rs.getString("email"));
			memlist.add(member);
		}
		closeDB();
		return memlist;
		
	}
	
	
	public int adminChange(MemberVo memvo) throws Exception {
		int rst = 0;
		connectDB();
		StringBuffer sb = new StringBuffer("");
		sb.append("update member set passwd=?, email=?, ");
		sb.append("\n zipcode=?, address=?, address2=?, phn=? where id=? ");
		String sql= sb.toString();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memvo.getPasswd());
		pstmt.setString(2, memvo.getEmail());
		pstmt.setString(3, memvo.getZipcode());
		pstmt.setString(4, memvo.getAddress());
		pstmt.setString(5, memvo.getAddress2());						
		pstmt.setString(6, memvo.getPhn());
		pstmt.setString(7, memvo.getId());	
		rst = pstmt.executeUpdate();	
		closeDB();
		return rst;
	}
	
	public int checkMemberById(String id) throws Exception {
		int rst = 0; 
		connectDB();
		String sql = String.format("select count(id) as chk "
				+ "from member where id='%s'",id);
		rs = stmt.executeQuery(sql);
		while(rs.next() ) {
			rst = rs.getInt("chk"); 
		}
		closeDB();
		return rst;
	}
	
	
	public String ScId(String email, String name) throws Exception {
		String rst= "";			
		connectDB();
		
		String sql = String.format("select id from member where name='%s' and email='%s' ", name, email);
		rs = stmt.executeQuery(sql);					
		while(rs.next()) {
			rst = rs.getString("id");
		}			
		
		closeDB();			
		return rst;
	}
	
	public String ScPw(String id, String email) throws Exception {
		String rst = "";
		connectDB();	
		String sql = String.format("select passwd from member where id='%s' and email='%s' ", id , email);
		rs = stmt.executeQuery(sql);					
		
		while(rs.next()) {
			rst = rs.getString("passwd");
		}
		
		closeDB();	
		return rst;
	}
		 }
