package com.hk.jsp.dao;

import java.sql.*;
import java.util.*;
import com.hk.jsp.vo.UserVo;

public class UserDao {
	
			static String driveName = "com.mysql.jdbc.Driver";
		static String url = "jdbc:mysql://localhost:3306/jspweb";
		static String user = "jsp";
		static String password = "1234";

		private static Connection conn = null;
		private static Statement stmt = null;
		private static PreparedStatement pstmt = null;
		private static ResultSet rs = null;
		private static UserDao instance = null;
		
			public static UserDao getInstance() {
			if(instance==null) {
				instance = new UserDao();
			}
			return instance;			
		}		
		
		{
			try {
			Class.forName(driveName);
			System.out.println("MYSQL connect");
			} catch(Exception e) {
			System.out.println("MYSQL connect exception");
			}
		}
		
			private void connectDB() throws Exception {

			if(conn==null) {
				conn=DriverManager.getConnection(url, user, password);
				stmt = conn.createStatement();
				System.out.println("DB connect");
			}
			
		}

		private void closeDB() {
			
			try {
				
				if(conn!=null) {
					conn.close();
					conn=null;
				}
				if(stmt!=null) {
					stmt.close();
					stmt=null;
				}
				if(pstmt!=null) {
					pstmt.close();
					pstmt=null;
				}
				if(rs!=null) {
					rs.close();
					rs=null;
				}
				System.out.println("DB close");
				
			} catch(SQLException e) {
				System.out.println("DB SQL exception : " + e.getMessage());
			} catch(Exception e2) {
				System.out.println("DB close exception : " + e2.getMessage());
			} 
			
		}
		
		
		public void testDB() throws Exception {
			connectDB();
			closeDB();
		}
		
		// 특정회원정보
		public UserVo getMemberById(String id) throws Exception {
			UserVo temp = new UserVo();
			connectDB();
			
			String sql = String.format("select * from user where id='%s'",id);
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {				
				temp.setId(rs.getString("id"));
				temp.setPwd(rs.getString("pwd"));
				temp.setName(rs.getString("name"));
				temp.setEmail(rs.getString("email"));
				temp.setZip_num(rs.getString("zip_num"));
				temp.setAddress(rs.getString("address"));
				temp.setAddress2(rs.getString("address2"));
				temp.setPhone(rs.getString("phone"));
				temp.setPic(rs.getString("pic"));
				temp.setIndate(rs.getString("indate"));
			}
			
			closeDB();
			return temp;			
		}
		
		
		
		// 아이디 중복체크
		public int checkMemberById(String id) throws Exception {
			int rst = 0;	// 0=중복x / 1=중복o
			
			connectDB();
			
			String sql = String.format("select count(id) as chk from member where id='%s'", id);
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				rst = rs.getInt("chk");
			}
			
			closeDB();
			
			return rst;
		}
			
		// 아이디 비밀번호 인증체크
		public int authMemberByIdPw(String id, String pw) throws Exception {
			int rst=0;
			String dbid = "";
			String dbpw = "";
			
			connectDB();
			
			String sql = String.format("select id,pwd from member where id='%s'", id);
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				dbid = rs.getString("id");
				dbpw = rs.getString("pwd");
			}				
				// 비교
				if(dbid.equals(id)) {
					if(dbpw.equals(pw)) {
						rst = 1;	// 로그인성공
					} else {
						rst = -1;	// pw 틀림
					}
				} else {
					rst = 0;	// id 틀림			
				}		
				
			closeDB();
			return rst;
		}
	
			
			
		
		// 회원탈퇴
		public int withdrawMember(String id) throws Exception {
			int rst = 0;			
			connectDB();
			
			String sql = String.format("delete from user set where id='%s'",id);
			rst = stmt.executeUpdate(sql);						
			
			closeDB();			
			return rst;
		}
		
		// 아이디찾기
		public String forgotId(String id, String email) throws Exception {
			String rst= "";			
			connectDB();
			
			String sql = String.format("select id from user where id='%s' and email='%s' ",id,email);
			rs = stmt.executeQuery(sql);					
			
			while(rs.next()) {
				rst = rs.getString("id");
			}			
			
			closeDB();			
			return rst;
		}
		
		// 비밀번호 찾기
		public String forgotPw(String id,String email,String name) throws Exception {
			String rst = "";
			connectDB();
			
			String sql = String.format("select passwd from user "
					+ "where id='%s' and email='%s' and name='%s' ",id,email,name);
			rs = stmt.executeQuery(sql);					
			
			while(rs.next()) {
				rst = rs.getString("passwd");
			}
			
			closeDB();	
			return rst;
		}
		
		// 개인정보수정
		public int modifyUser(UserVo memvo) throws Exception {
			int rst = 0;
			connectDB();
			
			StringBuffer sb = new StringBuffer("");
			sb.append("update user set name=?, email=?, zip_num=?, ");
			sb.append("\n address=?, address2=?, phone=?, pic=?, pwd=? where id=? ");
			String sql= sb.toString();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memvo.getName());
			pstmt.setString(2, memvo.getEmail());
			pstmt.setString(3, memvo.getZip_num());
			pstmt.setString(4, memvo.getAddress());
			pstmt.setString(5, memvo.getAddress2());
			pstmt.setString(6, memvo.getPhone());
			pstmt.setString(7, memvo.getPic());						
			pstmt.setString(8, memvo.getPwd());
			pstmt.setString(9, memvo.getId());	
			rst = pstmt.executeUpdate();
				
			closeDB();
			return rst;
		}
		
		// 모든회원정보
		// 관리자 전용
		public List<UserVo> userlist() throws Exception {
			List<UserVo> rst = new ArrayList<UserVo>();			
			connectDB();
			
			String sql = "select * from member";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				UserVo temp = new UserVo();
				temp.setId(rs.getString("id"));
				temp.setPwd(rs.getString("pwd"));
				temp.setName(rs.getString("name"));
				temp.setEmail(rs.getString("email"));
				temp.setZip_num(rs.getString("zip_num"));
				temp.setAddress(rs.getString("address"));
				temp.setAddress2(rs.getString("address2"));
				temp.setPhone(rs.getString("phone"));
				temp.setPic(rs.getString("pic"));
				temp.setIndate(rs.getString("indate"));
				
				rst.add(temp);
			}
			
			closeDB();
			return rst;
		}		
		
		// 회원가입
			public int regUser(UserVo memvo) throws Exception {
				int rst = 0;	// 등록 성공 여부
				connectDB();
				
				StringBuffer sb = new StringBuffer("");
				sb.append("insert into user(id,pwd,name,email,zip_num,address,address2,phone,pic,indate)");
				sb.append("\n values (?,?,?,?,?,?,?,?,?,now() )");
				String sql = sb.toString();
						// 성공=1 실패=0
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memvo.getId());
				pstmt.setString(2, memvo.getPwd());
				pstmt.setString(3, memvo.getName());
				pstmt.setString(4, memvo.getEmail());		
				
				pstmt.setString(5, memvo.getZip_num());
				pstmt.setString(6, memvo.getAddress());
				pstmt.setString(7, memvo.getAddress2());
				pstmt.setString(8, memvo.getPhone());
				
				pstmt.setString(9, memvo.getPic());
				
				rst = pstmt.executeUpdate();
							
				closeDB();
				return rst;
			}		
			
			
			
			
			
			
			
			
		
}
