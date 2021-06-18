<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project01</title>
<link rel="stylesheet" href="css/style.css"></link>
<style></style>
</head>
<body>
<%

	/* String jdbcUrl = "jdbc:mysql://kclh9b.freehongs.net:3306/kclh9b?autoReconnect=true&validationQuery=select 1";
	String jdbcUrl = "jdbc:mysql://localhost:3306/mysql";
	String dbId = "kclh9b";
	String dbPass = "Nev%U_aPfl*n";
	String dbId = "root";
	String dbPass = "1234"; */
	
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    String url = "jdbc:mysql://kclh9b.freehongs.net:3306/kclh9b?autoReconnect=true&validationQuery=select 1";
    //String url = "jdbc:mysql://localhost:3306/mysql";
    //String id = "root";
    //String pw = "mysql";
    String id = "kclh9b";
	String pw = "Nev%U_aPfl*n";
     
    try{
        Class.forName("com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection(url,id,pw);
        /* String sql = "select * from board_qna";
        pstmt = conn.prepareStatement( sql);
        rs = pstmt.executeQuery();
         
        if(!rs.next()) { out.println("검색된 결과가 없습니다"); }
         
        int num = rs.getInt("NUM");
        String wdate = rs.getString("DATE");
        String title = rs.getString("TITLE"); */
         
        out.println("연결에 성공했습니다"+"<br>");
        //out.println("글번호: "+num+"<br>");
        //out.println("날짜: "+wdate+"<br>");
        //out.println("제목: "+title+"<br>");
     
    }catch(Exception e){
        out.println("오류발생:"+e.getMessage());
        
    }finally {
        if(rs!=null) rs.close();
        if(pstmt!=null)pstmt.close();
        if(conn!=null) conn.close();
    }
%>

</body>
<script></script>
</html>