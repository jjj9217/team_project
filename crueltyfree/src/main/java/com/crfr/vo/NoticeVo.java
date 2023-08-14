package com.crfr.vo;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVo {
	private int notice_idx;
	private String notice_title;
	private String notice_content;
	private Date notice_regDate;	
	private String notice_originFile;
	private String notice_saveFile;
	private int member_idx;
}
