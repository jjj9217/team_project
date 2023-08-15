package com.crfr.service.productView;

import java.util.List;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.ProductVo;
import com.crfr.vo.RecentViewVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectRecentViewList")
@RequiredArgsConstructor
public class ProductSelectRecentViewListService implements ProductViewService{
	private final ProductViewDao dao;
	
	public List<RecentViewVo> selectRecentViewList(String client_num) {
		return dao.selectRecentViewList(client_num);
	}
}
