package com.crfr.service.seller;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductSellerDao;
import com.crfr.vo.OrderVo;

import lombok.RequiredArgsConstructor;

@Service("cOrderList")
@RequiredArgsConstructor
public class CheckOrderListService implements ProductSellerService {
	private final ProductSellerDao dao;
	
	public OrderVo checkOrderList(Map<String, Object> map){
		return dao.checkOrderList(map);
	}
}