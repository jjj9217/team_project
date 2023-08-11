package com.crfr.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewListVo {
	private int review_idx;
	private int member_idx;
	private int product_idx;
	private int review_recom_idx;
	private int review_score;
	private String review_content;
	private Date review_regDate;
	private String member_nickname;
	private int review_recom_count;
	
	private String[] originFiles = new String[5];
	private String[] saveFiles = new String[5];
	
	public void setOriginFile(int index, String value) {
        if (index >= 0 && index < originFiles.length) {
            originFiles[index] = value;
        }
    }

    public void setSaveFile(int index, String value) {
        if (index >= 0 && index < saveFiles.length) {
            saveFiles[index] = value;
        }
    }
}
