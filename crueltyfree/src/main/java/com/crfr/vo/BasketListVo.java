package com.crfr.vo;

import lombok.Data;

@Data
public class BasketListVo {
	private int basket_idx;
	private int product_idx;
	private String originFile;
	private String saveFile;
	private String member_nickname;
	private String product_name;
	private int product_price;
	private int basket_count;
	private int delivery_company;
	private int product_capa;
}
