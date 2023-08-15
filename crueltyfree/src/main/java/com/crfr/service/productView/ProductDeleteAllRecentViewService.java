package com.crfr.service.productView;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.ProductInfoVo;

import lombok.RequiredArgsConstructor;

@Service("pDeleteAllRecentView")
@RequiredArgsConstructor
public class ProductDeleteAllRecentViewService implements ProductViewService{
	private final ProductViewDao dao;
	
	public int deleteAllRecentView(String client_num) {
		return dao.deleteAllRecentView(client_num);
	}
}
