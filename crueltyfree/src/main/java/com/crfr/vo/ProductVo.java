package com.crfr.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVo {
	private int product_idx;
	private int member_idx;
	private String product_name;
	private int product_price;
	private int product_capa;
	private int product_saleCount;
	private Date product_regDate;	
	private int delivery_company;
	private String member_nickname;
	private String category_code;
	private int product_del_or_not;	
}
