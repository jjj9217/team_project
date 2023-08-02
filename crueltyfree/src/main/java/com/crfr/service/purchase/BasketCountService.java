package com.crfr.service.purchase;

import org.springframework.stereotype.Service;

import com.crfr.dao.BasketDao;

import lombok.RequiredArgsConstructor;

@Service("bSelectCount")
@RequiredArgsConstructor
public class BasketCountService implements PurchaseService {
	private final BasketDao dao;
	
	public int selectCount(String client_num) {		
		return dao.selectCount(client_num);
	}
}
