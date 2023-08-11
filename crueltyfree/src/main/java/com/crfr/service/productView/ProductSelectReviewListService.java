package com.crfr.service.productView;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.ProductVo;
import com.crfr.vo.ReviewVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectReviewList")
@RequiredArgsConstructor
public class ProductSelectReviewListService implements ProductViewService{
	private final ProductViewDao dao;
	
	public List<ReviewVo> selectReviewList(Map<String, Object> map) {
		return dao.selectReviewList(map);
	}
}
