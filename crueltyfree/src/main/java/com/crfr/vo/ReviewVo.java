package com.crfr.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVo {
	private int review_idx;
	private int member_idx;
	private int product_idx;
	private int review_score;
	private String review_content;
	private Date review_regDate;
	private String member_nickname;
	private int review_recom_count;	
	private int file_idx;
	private String originFile;
	private String saveFile;
}
