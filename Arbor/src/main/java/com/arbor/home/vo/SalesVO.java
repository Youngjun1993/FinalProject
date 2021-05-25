package com.arbor.home.vo;

public class SalesVO {
	private String orderdate;
	private String totalsales;
	private String ordercnt;
	private String totaldelivery;
	private String sales_from="";
	private String sales_to="";
	private String terms;
	private int ttlordercnt;
	private int cateOrderCnt;
	private String cateName;
	
	private int orderno;
	private String userid;
	private String username;
	private int subprice;
	
	
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getTotalsales() {
		return totalsales;
	}
	public void setTotalsales(String totalsales) {
		this.totalsales = totalsales;
	}
	public String getOrdercnt() {
		return ordercnt;
	}
	public void setOrdercnt(String ordercnt) {
		this.ordercnt = ordercnt;
	}
	public String getTotaldelivery() {
		return totaldelivery;
	}
	public void setTotaldelivery(String totaldelivery) {
		this.totaldelivery = totaldelivery;
	}
	public String getSales_from() {
		return sales_from;
	}
	public void setSales_from(String sales_from) {
		this.sales_from = sales_from;
	}
	public String getSales_to() {
		return sales_to;
	}
	public void setSales_to(String sales_to) {
		this.sales_to = sales_to;
	}
	public String getTerms() {
		return terms;
	}
	public void setTerms(String terms) {
		this.terms = terms;
	}
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getSubprice() {
		return subprice;
	}
	public void setSubprice(int subprice) {
		this.subprice = subprice;
	}
	public int getTtlordercnt() {
		return ttlordercnt;
	}
	public void setTtlordercnt(int ttlordercnt) {
		this.ttlordercnt = ttlordercnt;
	}
	public int getCateOrderCnt() {
		return cateOrderCnt;
	}
	public void setCateOrderCnt(int cateOrderCnt) {
		this.cateOrderCnt = cateOrderCnt;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
		
	
}
