package com.crfr.service.orderDelivery;

import java.sql.Timestamp;
import java.util.List;

import com.crfr.vo.DeliveryVo;
import com.crfr.vo.OrderProductVo;
import com.crfr.vo.OrderVo;

public interface OrderDeliveryService {
	default List<OrderVo> selectOrderVo(int member_idx, Timestamp timestamp_begin, Timestamp timestamp_end){return null;}
	default List<OrderProductVo> selectOrderProduct (int order_idx){return null;}
	default int selectOrderCount(int member_idx, Timestamp timestamp_begin, Timestamp timestamp_end) {return 0;}
	default int selectCountPayEd(int member_idx, Timestamp timestamp_begin, Timestamp timestamp_end) {return 0;}
	default int selectCountDlvIng(int member_idx, Timestamp timestamp_begin, Timestamp timestamp_end) {return 0;}
	default int selectCountDlvEd(int member_idx, Timestamp timestamp_begin, Timestamp timestamp_end) {return 0;}
	default List<OrderVo> selectRefund(int member_idx, Timestamp timestamp_begin, Timestamp timestamp_end){return null;}
	default int selectRefundCount(int member_idx, Timestamp timestamp_begin, Timestamp timestamp_end) {return 0;}
	default OrderVo selectOrderView(String order_num){return null;}
	default DeliveryVo selectDelivery(int delivery_idx){return null;}
}
