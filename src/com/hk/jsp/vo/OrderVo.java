package com.hk.jsp.vo;

import java.util.List;

import com.hk.jsp.vo.*;

public class OrderVo {
	private String ono;
	private String cno;
	private int proPrice;
	private int deliFee;
	private int price;
	private String dno;
	private String id;
	private String regdate;
	private String deliway;
	private String payway;
	private String paystate;
	private String etc;
	private String address;
	private String phn;
	private int cntItem;
	private List<CartItemVo> itemList;
	
	
	public List<CartItemVo> getItemList() {
		return itemList;
	}
	public void setItemList(List<CartItemVo> itemList) {
		this.itemList = itemList;
	}
	public int getDeliFee() {
		return deliFee;
	}
	public void setDeliFee(int deliFee) {
		this.deliFee = deliFee;
	}
	public int getProPrice() {
		return proPrice;
	}
	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}
	
	public int getCntItem() {
		return cntItem;
	}
	public void setCntItem(int cntItem) {
		this.cntItem = cntItem;
	}
	public String getOno() {
		return ono;
	}
	public void setOno(String ono) {
		this.ono = ono;
	}
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	public String getDno() {
		return dno;
	}
	public void setDno(String dno) {
		this.dno = dno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String addr) {
		this.address = addr;
	}
	public String getPhn() {
		return phn;
	}
	public void setPhn(String phn) {
		this.phn = phn;
	}
	public String getDeliway() {
		return deliway;
	}
	public void setDeliway(String deliway) {
		this.deliway = deliway;
	}
	public String getPayway() {
		return payway;
	}
	public void setPayway(String payway) {
		this.payway = payway;
	}
	public String getPaystate() {
		return paystate;
	}
	public void setPaystate(String paystate) {
		this.paystate = paystate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
}
