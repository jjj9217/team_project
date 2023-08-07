package com.crfr.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVo {
	private int member_idx;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_handphone;
	private String member_nickname;
	private String member_birthday; 
	private String member_gender;
	private String member_email;
	private int member_postNum;
	private String member_address;
	private String member_address2;
	private int grade;
	private Date join_date;
	private Date update_date;
	private Date cancel_date;
	private int cancel_or_not;
}
