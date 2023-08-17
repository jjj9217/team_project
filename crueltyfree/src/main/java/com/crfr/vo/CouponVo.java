package com.crfr.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CouponVo {
	private int coupon_idx;
	private int member_idx;
	private Date coupon_regDate;
	private Date coupon_expDate;
	private int coupon_exp_or_not;	
	private double coupon_discount;
	private int coupon_limit;	
	private String coupon_name;
}
