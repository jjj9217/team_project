package com.crfr.service.orderDelivery;

import java.util.List;

import com.crfr.vo.OrderProductVo;
import com.crfr.vo.OrderVo;

public interface OrderDeliveryService {
	default List<OrderVo> selectOrderVo(int member_idx){return null;}
	default List<OrderProductVo> selectOrderProduct (int order_idx){return null;}
}
