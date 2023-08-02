package com.crfr.service.purchase;

import java.util.List;

import org.springframework.stereotype.Service;

import com.crfr.dao.BasketDao;
import com.crfr.vo.BasketVo;

import lombok.RequiredArgsConstructor;

@Service("bSelectList")
@RequiredArgsConstructor
public class BasketSelectListService implements PurchaseService {
	private final BasketDao dao;
	
	public List<BasketVo> selectList(String client_num) {		
		return dao.selectList(client_num);
	}
}
