package com.crfr.service.productView;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.ProductVo;
import com.crfr.vo.RecentViewVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectRecentView")
@RequiredArgsConstructor
public class ProductSelectRecentViewService implements ProductViewService{
	private final ProductViewDao dao;
	
	public RecentViewVo selectRecentView(String client_num, int product_idx) {
		return dao.selectRecentView(client_num, product_idx);
	}
}
