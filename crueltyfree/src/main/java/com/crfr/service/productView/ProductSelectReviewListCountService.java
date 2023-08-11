package com.crfr.service.productView;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectReviewListCount")
@RequiredArgsConstructor
public class ProductSelectReviewListCountService implements ProductViewService{
	private final ProductViewDao dao;
	
	public int selectReviewListCount(Map<String, Object> map) {
		return dao.selectReviewListCount(map);
	}
}
