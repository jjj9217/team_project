package com.crfr.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OneInqVo {
	private int one_inq_idx;
	private int member_idx;
	private String one_inq_content;
	private String one_inq_answer;
	private Date one_inq_regDate;	
	private String member_nickname;
}
