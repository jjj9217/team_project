package com.crfr.service.purchase;

import java.util.List;

import com.crfr.vo.BasketVo;

public interface PurchaseService {
	default int selectCount(String client_num) {return 0;}
	default public List<BasketVo> selectList(String client_num) {return null;}
	default void plusBasketCount(int product_idx, String client_num) {}
	default void minusBasketCount(int product_idx, String client_num) {}
	default void updateBasketCount(int product_idx, int basket_count, String client_num) {}
	default int basketInsert(int product_idx, int prd_cart_cnt, String client_num) {return 0;}
	default void plusBasketMultipleCount(int product_idx, int prd_cart_cnt, String client_num) {}
}
