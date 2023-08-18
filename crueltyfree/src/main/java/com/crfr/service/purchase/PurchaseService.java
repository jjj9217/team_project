package com.crfr.service.purchase;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.crfr.vo.BasketVo;
import com.crfr.vo.CouponVo;
import com.crfr.vo.DeliveryVo;
import com.crfr.vo.OrderVo;
import com.crfr.vo.PayVo;

public interface PurchaseService {
	default int selectCount(String client_num) {return 0;}
	default List<BasketVo> selectList(String client_num) {return null;}
	default void plusBasketCount(int product_idx, String client_num) {}
	default void minusBasketCount(int product_idx, String client_num) {}
	default void updateBasketCount(int product_idx, int basket_count, String client_num) {}
	default int basketInsert(int product_idx, int prd_cart_cnt, String client_num) {return 0;}
	default void plusBasketMultipleCount(int product_idx, int prd_cart_cnt, String client_num) {}
	default int basketDeleteOne(String basket_idx) {return 0;}
	default BasketVo selectBasket(String basket_idx) {return null;}
	default int selectDeliveryCount(String client_num) {return 0;}
	default List<DeliveryVo> selectDeliveryList(String client_num) {return null;}
	default int insertDelivery(DeliveryVo deliveryVo){return 0;}
	default DeliveryVo selectDeliveryVo(DeliveryVo deliveryVo) {return null;}
	default int insertOrder(OrderVo orderVo){return 0;}
	default int selectOrderIdx(OrderVo orderVo){return 0;}
	default int insertPay(PayVo payVo){return 0;}
	default int deleteBasket(String basket_idx){return 0;}
	default String getImportToken() {return null;}
	default int cancelPay(String token, String merchant_uid) {return 0;}
	default int insertOrderProduct(String order_idx, String product_idx, 
			String client_num, String order_product_count) {return 0;}
	default void updateOrder(String order_idx) {}
	default void updatePay(String order_idx) {}
	default Map<String, String> getInfo(String token, String mId) {return null;}
	default int selectCountMember(Map<String, String> map) {return 0;}
	default List<CouponVo> selectCouponList(int member_idx,Date today) {return null;}
	default int deleteCoupon(String coupon_idx) {return 0;}
}
