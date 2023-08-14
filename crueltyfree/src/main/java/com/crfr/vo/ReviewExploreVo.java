package com.crfr.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewExploreVo {
	private Date order_date;
	private String product_name;
	
	
	private int review_score;
	private String review_content;
	private Date review_regDate;
	
	private int product_idx;
	private int review_idx;
	
	private int order_product_idx;
}