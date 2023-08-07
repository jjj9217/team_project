package com.crfr.vo;

import java.util.Date;

import lombok.Data;

@Data

public class OrderVo {
	private int order_idx;
	private String client_num;
	private int delivery_idx;
	private String order_num;
	private int order_ing;
	private Date order_date;	
	private String order_name;
	private String order_handphone;
	private int order_totalPrice;
	private int order_status;
	public int getOrder_idx() {
		return order_idx;
	}
	public void setOrder_idx(int order_idx) {
		this.order_idx = order_idx;
	}
	public String getClient_num() {
		return client_num;
	}
	public void setClient_num(String client_num) {
		this.client_num = client_num;
	}
	public int getDelivery_idx() {
		return delivery_idx;
	}
	public void setDelivery_idx(int delivery_idx) {
		this.delivery_idx = delivery_idx;
	}
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public int getOrder_ing() {
		return order_ing;
	}
	public void setOrder_ing(int order_ing) {
		this.order_ing = order_ing;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getOrder_handphone() {
		return order_handphone;
	}
	public void setOrder_handphone(String order_handphone) {
		this.order_handphone = order_handphone;
	}
	public int getOrder_totalPrice() {
		return order_totalPrice;
	}
	public void setOrder_totalPrice(int order_totalPrice) {
		this.order_totalPrice = order_totalPrice;
	}
	public int getOrder_status() {
		return order_status;
	}
	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}	
}
