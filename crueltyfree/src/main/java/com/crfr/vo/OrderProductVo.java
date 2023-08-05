package com.crfr.vo;

import lombok.Data;

@Data
public class OrderProductVo {
	private int order_product_idx;
	private int order_idx;
	private int product_idx;
	private String client_num;
	private int order_product_count;	
}
