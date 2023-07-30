package com.crfr.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ProductInqVo {
	private int product_inq_idx;
	private int member_idx;
	private int product_idx;
	private String product_inq_content;
	private String product_inq_answer;
	private Date product_inq_regDate;	
	private String member_nickname;
}
