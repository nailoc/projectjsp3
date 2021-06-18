package com.hk.jsp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hk.jsp.dao.*;
import com.hk.jsp.vo.*;

public class OrderDao extends DBDao{
		
	private OrderDao() {}
	
	private static OrderDao instance = new OrderDao();
	
	public static OrderDao getInstance() {
		return instance;
	}
	
	public List<OrderVo> getOrderList(String id) {
		List<OrderVo> result = new ArrayList<>();
		CartDao cartdao = CartDao.getInstance();
		try {
			connectDB();
			String sql = String.format("select * from orderView where id='%s' order by ono desc",id);
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				OrderVo orvo = new OrderVo();
				orvo.setOno(rs.getString("ono"));
				orvo.setCno(rs.getString("cno"));
				orvo.setProPrice(rs.getInt("proPrice"));
				orvo.setDeliFee(rs.getInt("deliFee"));
				orvo.setPrice(rs.getInt("price"));
				orvo.setDno(rs.getString("dno"));
				orvo.setId(rs.getString("id"));
				orvo.setRegdate(rs.getString("regdate"));
				orvo.setDeliway(rs.getString("deliway"));
				orvo.setPayway(rs.getString("payway"));
				orvo.setPaystate(rs.getString("paystate"));
				orvo.setEtc(rs.getString("etc"));
				orvo.setAddress(rs.getString("address"));
				orvo.setPhn(rs.getString("phn"));
				orvo.setCntItem(rs.getInt("cntItem"));
				orvo.setItemList(cartdao.getOrderItemList(orvo.getCno()));
				result.add(orvo);
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
			closeDB();
		}
		return result;
	}
	
	public void test(String id) {
		try {
			connectDB();
			String sql = String.format("select * from orderView where id='%s' order by ono desc",id);
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				System.out.println("테스트");
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
			closeDB();
		}
	}

}
