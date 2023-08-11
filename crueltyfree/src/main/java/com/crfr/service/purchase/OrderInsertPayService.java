package com.crfr.service.purchase;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDao;
import com.crfr.vo.BasketVo;
import com.crfr.vo.DeliveryVo;
import com.crfr.vo.OrderVo;
import com.crfr.vo.PayVo;

import lombok.RequiredArgsConstructor;

@Service("oInsertPay")
@RequiredArgsConstructor
public class OrderInsertPayService implements PurchaseService {
	private final OrderDao dao;
	
	public int insertPay(PayVo payVo){	
		return dao.insertPay(payVo);
	}
}
