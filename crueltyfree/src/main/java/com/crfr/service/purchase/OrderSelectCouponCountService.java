package com.crfr.service.purchase;

import java.util.Date;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDao;

import lombok.RequiredArgsConstructor;

@Service("oSelectCouponCount")
@RequiredArgsConstructor
public class OrderSelectCouponCountService implements PurchaseService {
	private final OrderDao dao;
	
	public int selectCouponCount(int member_idx,Date today) {		
		return dao.selectCouponCount(member_idx, today);
	}
}
