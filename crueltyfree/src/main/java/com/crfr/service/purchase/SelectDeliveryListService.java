package com.crfr.service.purchase;

import java.util.List;

import org.springframework.stereotype.Service;

import com.crfr.dao.OrderDao;
import com.crfr.vo.DeliveryVo;

import lombok.RequiredArgsConstructor;

@Service("oSelectDeliveryList")
@RequiredArgsConstructor
public class SelectDeliveryListService implements PurchaseService {
	private final OrderDao dao;
	
	public List<DeliveryVo> selectDeliveryList(String client_num) {		
		return dao.selectDeliveryList(client_num);
	}
}
