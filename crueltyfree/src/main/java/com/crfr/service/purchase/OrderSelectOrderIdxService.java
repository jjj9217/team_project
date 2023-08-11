package com.crfr.service.purchase;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDao;
import com.crfr.vo.BasketVo;
import com.crfr.vo.OrderVo;

import lombok.RequiredArgsConstructor;

@Service("oSelectOrderIdx")
@RequiredArgsConstructor
public class OrderSelectOrderIdxService implements PurchaseService {
	private final OrderDao dao;
	
	public int selectOrderIdx(OrderVo orderVo){	
		return dao.selectOrderIdx(orderVo);
	}
}
