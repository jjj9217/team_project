package com.crfr.vo;

import lombok.Data;

@Data
public class FileVo {
	private int file_idx;
	private int one_inq_idx;
	private int product_idx;
	private int review_idx;
	private String originFile;
	private String saveFile;
	private int member_idx;
}
