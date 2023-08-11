package com.crfr.service.email;

import com.crfr.vo.DeliveryVo;
import com.crfr.vo.OrderVo;

public interface EmailService {
	default String joinEmail(String email) {return null;}
	default void orderEmail(String email, String order_num) {}
}
