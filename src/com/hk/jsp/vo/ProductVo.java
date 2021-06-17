package com.hk.jsp.vo;

import java.util.*;

public class ProductVo {
	private int pno;
	private int kind;
	private String name;
	private int price;
	private String bname;
	private String fid;
	private String origin;
	//private String accupoint;
	private int quantity;
	private String whid;
	private int sell_count;
	private int review_count;
	private double review_average;
	private int qna_count;
	private String regdate;
	private String available;
	private String main_img1;
	private String main_img2;
	private List<String> imgs;
	
	public String getMain_img2() {
		return main_img2;
	}
	public void setMain_img2(String main_img2) {
		this.main_img2 = main_img2;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getMain_img1() {
		return main_img1;
	}
	public void setMain_img1(String main_img1) {
		this.main_img1 = main_img1;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getWhid() {
		return whid;
	}
	public void setWhid(String whid) {
		this.whid = whid;
	}
	public int getSell_count() {
		return sell_count;
	}
	public void setSell_count(int sell_count) {
		this.sell_count = sell_count;
	}
	public int getReview_count() {
		return review_count;
	}
	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	public double getReview_average() {
		return review_average;
	}
	public void setReview_average(double review_average) {
		this.review_average = review_average;
	}
	public int getQna_count() {
		return qna_count;
	}
	public void setQna_count(int qna_count) {
		this.qna_count = qna_count;
	}
	public String getAvailable() {
		return available;
	}
	public void setAvailable(String available) {
		this.available = available;
	}
	public void setImgs(List<String> imgs) {
		this.imgs = imgs;
	}
	public List<String> getImgs() {
		return imgs;
	}
}