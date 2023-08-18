package com.crfr.service.purchase;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDao;
import com.crfr.vo.CouponVo;

import lombok.RequiredArgsConstructor;

@Service("oSelectCouponList")
@RequiredArgsConstructor
public class OrderSelectCouponService implements PurchaseService {
	private final OrderDao dao;
	
	public List<CouponVo> selectCouponList(int member_idx, Date today) {	
		return dao.selectCouponList(member_idx, today);
	}
}
