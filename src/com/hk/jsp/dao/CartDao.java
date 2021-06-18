package com.hk.jsp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hk.jsp.vo.*;

public class CartDao extends DBDao{
	
	private CartDao() {}
	
	private static CartDao instance = new CartDao();
	
	public static CartDao getInstance() {
		return instance;
	}
	
	private String getDate() {
		String date = "";
		try {
			connectDB();
			String sql = "select date_format(now(), '%Y%m%d') as date;";
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				date = rs.getString("date");
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
		}
		return date;
	}
	
	public String getCnoById(String id) {
		String result = "none";
		try {
			connectDB();
			String sql = String.format("select cno from cart where id = '%s' and activeyn='y'", id);
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				result=rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
		}
		return result;
	}
	
	private String getCno() {
		String result = "none";
		try {
			connectDB();
			String sql = "select cno from cart order by cno desc limit 1";
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				result=rs.getString("cno");
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
		}
		return result;
	}
		
	public String getNext() { //移댄듃 �떎�쓬踰덊샇 媛��졇�삤湲�
		String curCno = getCno();
		String cartDate = getDate().substring(6, 8);
		String cartNum = "";
		String result = "";
		if(curCno.equals("none")) { // �깮�꽦�맂 移댄듃踰덊샇媛� �뾾�쓣 �떆
			result = getDate().substring(6,8)+"001";
		}else {
			if(curCno.substring(0, 2).equals(cartDate)) { //06021 -> 21 + 1 -> 22
				cartNum = String.format("%03d",(Integer.parseInt(curCno.substring(2).replace("0", ""))+1));
				result = cartDate+cartNum;
			}else {
				cartNum = String.format("%03d", 1);
				result = cartDate+cartNum;
			}
		}
		return result;
	}
	
	public int addCart(String id, String pno, String quantity) {
		int result = 0;
		try {
			connectDB();
			String cnoById = getCnoById(id);
			if(cnoById.equals("none")) { // "none"諛섑솚�떆 �솢�꽦�솕�맂 移댄듃媛� �뾾�쑝誘�濡� 移댄듃瑜� �깉濡� 留뚮뱾�뼱以��떎.
				String sql = ("insert into cart (cno, id, regdate) values (?, ?, now())");
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, getNext());
				pstmt.setString(2, id);
				int insert = pstmt.executeUpdate();
				if(insert!=0) {
					result = addCart(id, pno, quantity); // �솢�꽦�솕�맂 移댄듃媛� �깉濡� 留뚮뱾�뼱議뚯쑝誘�濡� �옱洹��븿�닔�뿉�꽌 �븯�쐞 else臾몄쓣 �� �븘�씠�뀥�씠 異붽��맂�떎.
				}else {
					System.out.println("移댄듃 �깮�꽦 �떎�뙣");
					result = -2;
					return result;
				}
			}else { // 0�씠 �븘�땲�씪硫� �솢�꽦�솕�맂 移댄듃媛� �엳�뒗 寃쎌슦�씠誘�濡� �븘�씠�뀥留� 異붽��빐以��떎
				String selItem = String.format("select quantity from cartItem where cno = %s and pno = %s", cnoById, pno);
				rs = stmt.executeQuery(selItem);
				if(rs.next()) { // �씠誘� �엳�뒗 �븘�씠�뀥�쓽 寃쎌슦 �닽�옄留� 媛깆떊
					String updateItem = String.format("update cartItem set quantity = quantity+%s where cno = '%s' and pno = %s",quantity, cnoById, pno);
					result = stmt.executeUpdate(updateItem);
				}else { // �뾾�뒗 �븘�씠�뀥�씠硫� 異붽�
					String itemInsert = String.format("insert into cartItem (cno, pno, quantity) values ('%s', %s, %s)", cnoById, pno, quantity);
					result = stmt.executeUpdate(itemInsert);					
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
	
	public int removeItem(String id, String pno) {
		int result = 0;
		try {
			connectDB();
			String cnoById = getCnoById(id);
			String sql = String.format("delete from cartItem where pno='%s' and cno='%s'", pno, cnoById);
			result = stmt.executeUpdate(sql);
			if(result!=0) {
				String countItem = String.format("select count(*) cnt from cartItem where cno='%s'",cnoById);
				rs = stmt.executeQuery(countItem);
				//移댄듃�븘�씠�뀥�씠 鍮꾩뿀�떎硫� 移댄듃踰덊샇瑜� 吏��슫�떎
				if(rs.next()) {
					int count = rs.getInt("cnt");
					if(count==0) {
						String delCart = String.format("delete from cart where cno='%s' and activeyn='y'", cnoById);
						result = stmt.executeUpdate(delCart);						
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
	
	public int removeItemAll(String id) {
		int result = 0;
		try {
			connectDB();
			String cnoById = getCnoById(id);
			String sql = String.format("delete from cartItem where cno='%s'", cnoById);
			int delete = stmt.executeUpdate(sql);
			if(delete != 0) {
				sql = String.format("delete from cart where cno='%s' and activeyn='y'", cnoById);
				result = stmt.executeUpdate(sql);				
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
	
	public int cartDeative(String cno) {
		int result = 0;
		try {
			connectDB();
			String sql = String.format("update cart set activeyn='n' where cno=%s", cno);
			result = stmt.executeUpdate(sql);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			result = -1;
		}finally {
		}
		return result;
	}
	
	public List<CartItemVo> getCartItemList(String id) {
		List<CartItemVo> result = new ArrayList<>();
		try {
			connectDB();
			String cnoById = getCnoById(id);
			String sql = String.format("select * from cartItemView where cno='%s'", cnoById);
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				CartItemVo civ = new CartItemVo();
				civ.setCno(rs.getString("cno"));
				civ.setPno(rs.getInt("pno"));
				civ.setName(rs.getString("name"));
				civ.setQuantity(rs.getInt("quantity"));
				civ.setTotalPrice(rs.getInt("totalPrice"));
				civ.setMain_img1(rs.getString("main_img1"));
				result.add(civ);
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
			closeDB();
		}
		return result;
	}
	
	public int addItemQuantity(String id, String pno, String add) {
		int result=0;
		try {
			connectDB();
			String cnoById = getCnoById(id);
			int cQuantity = 0;
			String sql = String.format("select quantity from cartItem where cno='%s' and pno=%s", cnoById, pno);
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				cQuantity = rs.getInt("quantity");
			}
			if(!(cQuantity==1 && add.equals("-1"))) {
				sql = String.format("update cartItem set quantity = quantity+%s where cno='%s' and pno=%s", add, cnoById, pno);
				result = stmt.executeUpdate(sql);				
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			result=-1;
		}finally {
			closeDB();
		}
		return result;
	}
	
	public int orderCart(String id, String proPrice, String deliFee, String endPrice, String deliway, String payway, String etc) {
		int result = 0;
		try {
			//�삤�뜑�뀒�씠釉� �궫�엯
			connectDB();
			CartDao cartdao = CartDao.getInstance();
			String cnoById = cartdao.getCnoById(id);
			StringBuffer dno = new StringBuffer("");
			//諛곕떖踰덊샇 �궃�닔 �깮�꽦 (�쇅�옒�궎濡� 諛쏆븘���빞寃좎�留� 嫄대꼫�쎇�뒗嫄몃줈)
			for(int i=0; i<3; i++) {
				int temp = (int)((Math.random()*9000)+1000);
				if(i==0) {
					dno.append(temp);
				}else {
					dno.append("-"+temp);
				}
			}
			StringBuffer sb = new StringBuffer("");
			sb.append("insert into orderTable (ono, cno, proPrice, deliFee, price, dno, id, regdate, deliway, payway, paystate, etc)");
			sb.append(" values(?, ?, ?, ?, ?, ?, ?, now(), ?, ?, '�엯湲덊솗�씤', ?)");
			String sql = sb.toString();
			pstmt = conn.prepareStatement(sql);
			String curDate = getDate();
			pstmt.setString(1, curDate+"-"+cnoById);
			pstmt.setString(2, cnoById);
			pstmt.setString(3, proPrice);
			pstmt.setString(4, deliFee);
			pstmt.setString(5, endPrice);
			pstmt.setString(6, dno.toString());
			pstmt.setString(7, id);
			pstmt.setString(8, deliway); 
			pstmt.setString(9, payway);
			pstmt.setString(10, etc);
			int order = pstmt.executeUpdate();
			if(order != 0) { // product �뾽�뜲�씠�듃 (�옱怨�, �뙏由곌갗�닔)
				sb = new StringBuffer("");
				sb.append("update product p join cartItem c on p.pno = c.pno set p.quantity = (p.quantity - c.quantity)");
				sb.append("\n ,p.sell_count = (p.sell_count+c.quantity) where c.cno = ?");
				sql = sb.toString();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cnoById);
				int product = pstmt.executeUpdate();
				if(product != 0) { // �쉶�썝 �룷�씤�듃 �쟻由�
					int point = (int)(Integer.valueOf(proPrice)*0.01);
					System.out.println("�뵒踰꾧렇�뀒�뒪�듃1");
					sql = String.format("update member set point = (point + %d) where id = '%s'", point, id);
					System.out.println("�뵒踰꾧렇�뀒�뒪�듃2");
					stmt.executeUpdate(sql);
					
					
					result = cartdao.cartDeative(cnoById);	//移댄듃 鍮꾪솢�꽦�솕				
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
	
	
	public List<CartItemVo> getOrderItemList(String cno) {
		List<CartItemVo> result = new ArrayList<>();
		try {
			connectDB();
			String sql = String.format("select * from cartItemView where cno='%s'",cno);
			rs2 = stmt2.executeQuery(sql);
			while(rs2.next()) {
				CartItemVo itemvo = new CartItemVo();
				itemvo.setCno(rs2.getString("cno"));
				itemvo.setPno(rs2.getInt("pno"));
				itemvo.setName(rs2.getString("name"));
				itemvo.setQuantity(rs2.getInt("quantity"));
				itemvo.setPrice(rs2.getInt("price"));
				itemvo.setMain_img1(rs2.getString("main_img1"));
				result.add(itemvo);
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
		}
		return result;
	}
	
}
