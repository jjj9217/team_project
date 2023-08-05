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
}