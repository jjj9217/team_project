package com.crfr.vo;

import lombok.Data;

@Data
public class ExploreVo {	
	private String searchWord;
	private String category_code;
	private String category_code_small;
	private int product_price;
	private int product_price_max;
	private int product_price_min;
	private int product_idx;
	
	//정렬순서
	private String sort_salecount;
	private String sort_lastdate;
	private String sort_review_score;
	private String sort_maxprice;
	private String sort_minprice;
	
	//뷰목록개수
	private int sort_view;
}
