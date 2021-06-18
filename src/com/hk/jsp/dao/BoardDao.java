package com.hk.jsp.dao;

import java.sql.*;
import java.util.*;
import com.hk.jsp.vo.*;

public class BoardDao {
	
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
	private static BoardDao instance = new BoardDao(); 
	
	private BoardDao() { }
	
	public static BoardDao getInstance() {
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
	
	public List<BoardVo> getBoardList(String sort, String keyword, String type) throws Exception {
		
		List<BoardVo> rst = new ArrayList<BoardVo>();
		connectDB();
		
		String sql = "select no, title, contents, writer, regdate, "
				+ "views from board where "+type+" like '%"+keyword+"%' order by "+sort+ " desc";
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			BoardVo row = new BoardVo();
			row.setNo(rs.getInt("no"));
			row.setTitle(rs.getString("title"));
			row.setContents(rs.getString("contents"));
			row.setWriter(rs.getString("writer"));
			row.setRegdate(rs.getString("regdate"));
			row.setViews(rs.getInt("views"));
			rst.add(row);
		}
		closeDB();
		return rst;
	}
	
	public BoardVo getBoardByNo(String no) throws Exception {
		BoardVo rst = new BoardVo();
		connectDB();
		String sql=String.format("select no, title, contents, writer, regdate, views, attach1, passwd from board where no='%s'" , no);
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			rst.setNo(rs.getInt("no"));
			rst.setTitle(rs.getString("title"));
			rst.setWriter(rs.getString("writer"));
			rst.setRegdate(rs.getString("regdate"));
			rst.setViews(rs.getInt("views"));
			rst.setContents(rs.getString("contents"));		
			rst.setAttach1(rs.getString("attach1"));
			rst.setPasswd(rs.getString("passwd"));
			if(rs.getString("attach1")==null) {
				rst.setAttach1("첨부파일이 없습니다");
			}
		}
		closeDB();
		return rst;
		
	}
	
	public void increaseBoardNo(String no) throws Exception {
		connectDB();
		String sql = String.format("update board set views=views+1 where no='%s'", no);
		int res = stmt.executeUpdate(sql);
		closeDB();
	}
	
	public int saveBoard(BoardVo brdvo) throws Exception {
		int rst=0;
		connectDB();
		StringBuffer sb = new StringBuffer("");
		sb.append("insert into board (title,writer,contents,attach1,adm_id,passwd,regdate)");
		sb.append("\n values ( ?, ?, ?, ?, 'admin', ?, now() ) ");
		String sql = sb.toString();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, brdvo.getTitle());
		pstmt.setString(2, brdvo.getWriter());
		pstmt.setString(3, brdvo.getContents());
		pstmt.setString(4, brdvo.getAttach1());
		pstmt.setString(5, brdvo.getPasswd());
		rst = pstmt.executeUpdate();
		closeDB();
		return rst;
	}
	
	public List<BoardVo> getBoardLists() throws Exception {
		List<BoardVo> rst = new ArrayList<BoardVo>();
		connectDB();
		
		String sql = "select * from board";
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			BoardVo bolvo = new BoardVo();
			bolvo.setNo(rs.getInt("no"));
			bolvo.setWriter(rs.getString("writer"));
			bolvo.setTitle(rs.getString("title"));
			bolvo.setRegdate(rs.getString("regdate"));
			bolvo.setViews(rs.getInt("views"));
			bolvo.setAdm_id(rs.getString("adm_id"));
			bolvo.setPasswd(rs.getString("passwd"));
			rst.add(bolvo);
		}		
		
		closeDB();
		return rst;
	}
	
	
	public String chkPwd(String no) throws Exception {
		String rst = "";
		connectDB();
		
		String sql = String.format("select passwd from board where no = '%s'", no);
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			rst = rs.getString("passwd");
		}
				
		closeDB();
		return rst;
	}
	
	public int delBoard(String no) throws Exception {
		int rst = 0;
		connectDB();		
		
		String sql = String.format("delete from board where no='%s'",no);
		rst = stmt.executeUpdate(sql);	
		
		closeDB();
		return rst;
	}
		

}


