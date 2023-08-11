package com.crfr.service.manager;

import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;
import com.crfr.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("pfineProductPost")
@RequiredArgsConstructor
public class ProductSelectPostService implements ManagerService {
	private final ManagerDao dao;
	
	public ProductVo findProductPost(String product_idx) {
		return dao.findProductPost(product_idx);
	}
}