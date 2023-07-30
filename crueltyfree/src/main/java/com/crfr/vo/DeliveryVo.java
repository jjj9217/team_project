package com.crfr.vo;

import lombok.Data;

@Data
public class DeliveryVo {
	private int order_idx;
	private int member_idx;
	private String delivery_address_name;
	private String delivery_get_name;
	private String delivery_handphone;
	private String delivery_message;
	private int delivery_pass;
	private String delivery_pass_content;
	private int delivery_postNum;	
	private String delivery_address;
	private String delivery_address2;
}
