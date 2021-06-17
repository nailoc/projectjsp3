package com.hk.jsp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.hk.jsp.vo.*;
import java.util.*;


public class ProductDao extends DBDao{
	
	private ProductDao() {}
	
	private static ProductDao instance = new ProductDao();
	
	public static ProductDao getInstance() {
		return instance;
	}
	
	
	private String getDate() {
		String date = "";
		try {
			connectDB();
			String sql = "select date_format(now(), '%Y%m%d') as date;";
			stmt.executeQuery(sql);
			if(rs.next()) {
				date = rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
		}
		return date;
	}
	
	private int getNext(String bname) { //saveProduct에 사용
		int next = 1;
		try {
			connectDB();
			String sql = String.format("select pno from product where bname = '%s' order by pno desc limit 1", bname);
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				next = (rs.getInt(1)) + 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
		}
		return next;
	}
	
	/*
	public int saveProduct(ProductVo pro) {
		int result = 0;
		try {
			connectDB();
			String sql1 = "insert into product (pno, kind, name, price, bname, fid, origin, main_img1, main_img2, quantity, whid, regdate)"
						+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now())";
			String sql2 = "insert into detail_imgs values (?, ?)";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, getNext(pro.getBname()));
			pstmt.setInt(2, pro.getKind());
			pstmt.setString(3, pro.getName());
			pstmt.setInt(4, pro.getPrice());
			pstmt.setString(5, pro.getBname());
			pstmt.setString(6, pro.getFid());
			pstmt.setString(7, pro.getOrigin());
			pstmt.setString(8, pro.getMain_img1());
			pstmt.setString(9, pro.getMain_img2());
			pstmt.setInt(10, pro.getQuantity());
			pstmt.setString(11, pro.getWhid());
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, pro.getPno());
			for(int i=0; i<pro.getDetail_imgs().size(); i++) {
				pstmt.setString(i+2, pro.getDetail_imgs().get(i));				
				pstmt.executeUpdate();
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			result = -1;
		}finally {
			closeDB();
		}
		return result;
	}
	*/
	
	/*
	public int updateProduct(ProductVo provo) {
		int result = 0;
		try {
			StringBuffer sb = new StringBuffer();
			sb.append("update product set ");
			sb.append("pno=? and kind=? and name=? and price=? and bname=?");
			sb.append(" and fid=? and origin=? and main_img1=? and main_img2=? and quantity=?");
			sb.append(" and sell_count=? and review_count=? and review_average=? and qna_count=?");
			String sql = sb.toString();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, provo.getPno());
			pstmt.setInt(2, provo.getKind());
			pstmt.setString(3, provo.getName());
			pstmt.setInt(4, provo.getPrice());
			pstmt.setString(5, provo.getBname());
			pstmt.setString(6, provo.getFid());
			pstmt.setString(7, provo.getOrigin());
			pstmt.setString(8, provo.getMain_img1());
			pstmt.setString(9, provo.getMain_img2());
			pstmt.setInt(10, provo.getQuantity());
			pstmt.setInt(11, provo.getSell_count());
			pstmt.setInt(12, provo.getReview_count());
			pstmt.setDouble(13, provo.getReview_average());
			pstmt.setInt(14, provo.getQna_count());
			int update = pstmt.executeUpdate();
			
			//상품 이미지 업데이트
			int imgCount = 0;
			sql = String.format("select count(*) from deail_imgs where pno=%s order by image",provo.getPno());
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				imgCount=rs.getInt(1);
			}
			//상품 이미지 갯수 구해와서 변경
			//변경하려는 상품 이미지 갯수가 기존보다 적을 경우
			if(imgCount > provo.getDetail_imgs().size()) {
				for(int i=0; i<provo.getDetail_imgs().size(); i++) { //변경
					String num = String.format("%02d", i+1);
					sql = String.format("update deail_imgs set image = '%s' where image like '%d%'",provo.getDetail_imgs().get(i), num);
					stmt.executeUpdate(sql);
				}
				for(int i=provo.getDetail_imgs().size()+1; i<=imgCount; i++) { //남은거 삭제
					String num = String.format("%02d", i);
					sql = String.format("delete from detail_imgs where pno='%d' and image like '%d%'",provo.getDetail_imgs().get(i), num);
					stmt.executeUpdate(sql);
				}
			}else { //변경하려는 상품 이미지 갯수가 기존보다 같거나 많을 경우
				for(int i=0; i<imgCount; i++) {
					String num = String.format("%02d", i+1);
					sql = String.format("update deail_imgs set image = '%s' where image like '%d%'",provo.getDetail_imgs().get(i), num);
					stmt.executeUpdate(sql);
				}
				if(provo.getDetail_imgs().size() > imgCount) {
					for(int i=imgCount; i<provo.getDetail_imgs().size(); i++) {
						sql = String.format("insert into detail_imgs (pno, image) values(%d, %s)",provo.getPno(), provo.getDetail_imgs().get(i));
						stmt.executeUpdate(sql);
					}
				}					
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			result = -1;
		}finally {
			closeDB();
		}
		return result;
	}
	*/
	
	public int[] getBnameCnt(String kind) {
		int[] result = null;
		if(kind.equals("10")) {
			result = new int[9];
		}else {
			result = new int[8];
		}
		try {
			StringBuffer sb = new StringBuffer("");
			sb.append("select count(*) fendiCnt");
			sb.append(", (ifnull((select count(*) from product where bname='dior' and kind="+kind+"),0)) diorCnt");
			sb.append(", (ifnull((select count(*) from product where bname='jimmy choo' and kind="+kind+"),0)) jimmyCnt");
			sb.append(", (ifnull((select count(*) from product where bname='maxmara' and kind="+kind+"),0)) maxCnt");
			sb.append(", (ifnull((select count(*) from product where bname='carrera' and kind="+kind+"),0)) carCnt");
			sb.append(", (ifnull((select count(*) from product where bname='givenchy' and kind="+kind+"),0)) givenCnt");
			sb.append(", (ifnull((select count(*) from product where bname='hugo boss' and kind="+kind+"),0)) hugoCnt");
			sb.append(", (ifnull((select count(*) from product where bname='tommy hilfiger' and kind="+kind+"),0)) tommyCnt");
			if(kind.equals("10")) {
				sb.append(", (ifnull((select count(*) from product where bname='polaroid'),0)) polaCnt");				
			}
			sb.append(" from product where bname='fendi' and kind="+kind+"");
			String sql = sb.toString();
			connectDB();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				result[0] = rs.getInt("fendiCnt");
				result[1] = rs.getInt("diorCnt");
				result[2] = rs.getInt("jimmyCnt");
				result[3] = rs.getInt("maxCnt");
				result[4] = rs.getInt("carCnt");
				result[5] = rs.getInt("givenCnt");
				result[6] = rs.getInt("hugoCnt");
				result[7] = rs.getInt("tommyCnt");
				if(kind.equals("10")) {
					result[8] = rs.getInt("polaCnt");					
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
			closeDB();
		}
		return result;
	}
	
	public List<ProductVo> getProductList(String keyword, String kind, String bname, String sort, String page) {
		int cPage = Integer.parseInt(page);
		int limitStart = (cPage-1) * 20;
		int limitEnd = cPage * 20;
		int totalPage = 0;

		List<ProductVo> list = new ArrayList<>();
		StringBuffer sb = new StringBuffer();
		sb.append("select * from product where");
		String sql1 = " name like '%" + keyword + "%'";
		String sql2 = " and kind like '%" + kind + "%'";
		String sql3 = " and bname like '%" + bname + "%'";
		String sql4 = " and available='y'";
		String sqlSort = "";
		switch (sort) {
			case "sell_count" :
				sqlSort = "sell_count desc";
				break;
			case "rowPrice" :
				sqlSort = "price";
				break;
			case "highPrice" :
				sqlSort = "price desc";
				break;
			case "review_average" :
				sqlSort = "review_average desc";
				break;
			case "rec" :
			case "regdate" :
				sqlSort = "regdate desc";
				break;
		}
		String sql5 = " order by " + sqlSort;
		
		sb.append(sql1);
		sb.append(sql2);
		sb.append(sql3);
		sb.append(sql4);
		sb.append(sql5);
		sb.append(String.format(" limit %d, %d", limitStart, limitEnd));
		try {
			connectDB();
			rs = stmt.executeQuery(sb.toString());
			while(rs.next()) {
				ProductVo provo = new ProductVo();
				List<String> imgs = new ArrayList<>();
				provo.setPno(rs.getInt("pno"));
				provo.setKind(rs.getInt("kind"));
				provo.setName(rs.getString("name"));
				provo.setPrice(rs.getInt("price"));
				provo.setBname(rs.getString("bname"));
				provo.setSell_count(rs.getInt("sell_count"));
				provo.setReview_count(rs.getInt("review_count"));
				provo.setReview_average(rs.getDouble("review_average"));
				provo.setRegdate(rs.getString("regdate"));
				provo.setMain_img1(rs.getString("main_img1"));
				provo.setMain_img2(rs.getString("main_img2"));
				for(int i=0; i<9; i++) {
					imgs.add(rs.getString("img"+(i+1)));					
				}
				provo.setImgs(imgs);
				list.add(provo);
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
			closeDB();
		}
		return list;
	}
	
	public int getTotalPage(String keyword, String kind, String bname) {
		int result = 0;
		StringBuffer sb = new StringBuffer();
		sb.append("select count(*) cnt from product where");
		String sql1 = " name like '%" + keyword + "%'";
		String sql2 = " and kind like '%" + kind + "%'";
		String sql3 = " and bname like '%" + bname + "%'";
		String sql4 = " and available='y'";
		
		sb.append(sql1);
		sb.append(sql2);
		sb.append(sql3);
		sb.append(sql4);
		try {
			connectDB();
			rs = stmt.executeQuery(sb.toString());
			while(rs.next()) {
				result = rs.getInt("cnt");
			}
			result = (int)Math.ceil((result/20.0));
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
			closeDB();
		}
		return result;
	}
	
	
	public ProductVo getProductByPno(String pno) {
		ProductVo provo = new ProductVo();
		try {
			connectDB();
			String sql1 = String.format("select * from product where pno=%s", pno);
			rs = stmt.executeQuery(sql1);
			while(rs.next()) {
				List<String> imgs = new ArrayList<>();
				provo.setPno(rs.getInt("pno"));
				provo.setKind(rs.getInt("kind"));
				provo.setName(rs.getString("name"));
				provo.setPrice(rs.getInt("price"));
				provo.setBname(rs.getString("bname"));
				provo.setFid(rs.getString("fid"));
				provo.setOrigin(rs.getString("origin"));
				provo.setQuantity(rs.getInt("quantity"));
				provo.setWhid(rs.getString("whid"));
				provo.setSell_count(rs.getInt("sell_count"));
				provo.setReview_count(rs.getInt("review_count"));
				provo.setReview_average(rs.getDouble("review_average"));
				provo.setQna_count(rs.getInt("qna_count"));
				provo.setMain_img1(rs.getString("main_img1"));
				provo.setMain_img2(rs.getString("main_img2"));
				for(int i=0; i<9; i++) {
					imgs.add(rs.getString("img"+(i+1)));
				}
				provo.setImgs(imgs);
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
			closeDB();
		}
		return provo;
	}
	
	public int removeProductByNo(String pno) {
		int result = 0;
		try {
			connectDB();
			String sql = String.format("update product set available='n' where pno=%s", pno);
			stmt.executeUpdate(sql);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			result = -1;
		}finally {
			closeDB();
		}
		return result;
	}
	
}
