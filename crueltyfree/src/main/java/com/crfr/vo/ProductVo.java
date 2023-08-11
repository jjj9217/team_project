package com.crfr.vo;

import java.util.Date;

public class ProductVo {	
	private int product_idx;
	private int member_idx;
	private String product_name;
	private int product_price;
	private int product_capa;
	private int product_saleCount;
	private Date product_regDate;	
	private int delivery_company;
	private String member_nickname;
	private String category_code;
	private int product_del_or_not;
	
	private String category_code_small;
	
	public String getCategory_code_small() {
		return category_code_small;
	}
	public void setCategory_code_small(String category_code_small) {
		this.category_code_small = category_code_small;
	}
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_capa() {
		return product_capa;
	}
	public void setProduct_capa(int product_capa) {
		this.product_capa = product_capa;
	}
	public int getProduct_saleCount() {
		return product_saleCount;
	}
	public void setProduct_saleCount(int product_saleCount) {
		this.product_saleCount = product_saleCount;
	}
	public Date getProduct_regDate() {
		return product_regDate;
	}
	public void setProduct_regDate(Date product_regDate) {
		this.product_regDate = product_regDate;
	}
	public int getDelivery_company() {
		return delivery_company;
	}
	public void setDelivery_company(int delivery_company) {
		this.delivery_company = delivery_company;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getCategory_code() {
		return category_code;
	}
	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}
	public int getProduct_del_or_not() {
		return product_del_or_not;
	}
	public void setProduct_del_or_not(int product_del_or_not) {
		this.product_del_or_not = product_del_or_not;
	}
}
