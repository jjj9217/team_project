package com.crfr.vo;

import lombok.Data;

@Data

public class PurchaseListVo {
	private String order_num;
	private String order_name;
	
	private String product_name;
	private int order_product_count;
	
	private int order_ing;
}
