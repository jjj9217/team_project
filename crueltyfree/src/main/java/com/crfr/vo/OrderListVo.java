package com.crfr.vo;

import java.util.Date;

import lombok.Data;

@Data

public class OrderListVo {
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
	
	private int product_idx;
	private String originFile;
	private String saveFile;
	private String member_nickname;
	private String product_name;	
	private int product_price;
	
	private int order_product_idx;
	private int order_product_count;	
}
