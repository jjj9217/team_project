package com.crfr.vo;

import lombok.Data;

@Data
public class PayVo {
	private int pay_idx;
	private int order_idx;
	private int pay_price;
	private String pay_uid;
	private int pay_refund;	
}
