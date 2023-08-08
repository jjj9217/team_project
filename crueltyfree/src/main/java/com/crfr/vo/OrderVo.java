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
	private int order_prdPrice;
	private int order_salePrice;
	private int order_dlvPrice;
	private int order_totalPrice;
	private int order_status;	
}
