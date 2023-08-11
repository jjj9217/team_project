package com.crfr.vo;

import java.util.Date;

import lombok.Data;

@Data
public class DateVo {
	
	private int member_idx;
	private Date product_inq_regDate;
	
	private int year;
	private int month;
	private int day;
}