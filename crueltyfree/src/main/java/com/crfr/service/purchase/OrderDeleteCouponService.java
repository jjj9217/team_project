package com.crfr.service.purchase;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDao;
import com.crfr.vo.BasketVo;
import com.crfr.vo.DeliveryVo;
import com.crfr.vo.OrderVo;

import lombok.RequiredArgsConstructor;

@Service("oDeleteCoupon")
@RequiredArgsConstructor
public class OrderDeleteCouponService implements PurchaseService {
	private final OrderDao dao;
	
	public int deleteCoupon(String coupon_idx) {	
		return dao.deleteCoupon(coupon_idx);
	}
}
