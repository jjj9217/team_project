package com.crfr.vo;

import java.util.Date;

import lombok.Data;

@Data
public class LikeExploreVo {
	private int member_idx;
	private String product_name;	
	private int product_price;
	private int like_idx;
	private int product_idx;

}