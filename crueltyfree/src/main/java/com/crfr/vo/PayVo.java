package com.crfr.vo;

import lombok.Data;

@Data
public class PayVo {
	private int pay_idx;
	private int order_idx;
	private int pay_price;
	private int pay_method;
	private int pay_refund;	
}
