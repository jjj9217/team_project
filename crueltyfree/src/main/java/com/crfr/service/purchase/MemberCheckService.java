package com.crfr.service.purchase;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDao;
import com.crfr.vo.BasketVo;
import com.crfr.vo.DeliveryVo;
import com.crfr.vo.OrderVo;
import com.crfr.vo.PayVo;

import lombok.RequiredArgsConstructor;

@Service("mSelectCountMember")
@RequiredArgsConstructor
public class MemberCheckService implements PurchaseService {
	private final OrderDao dao;
	
	public int selectCountMember(Map<String, String> map) {	
		return dao.selectCountMember(map);
	}
}
