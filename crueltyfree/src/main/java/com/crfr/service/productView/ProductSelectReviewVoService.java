package com.crfr.service.productView;

import java.util.List;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.ProductVo;
import com.crfr.vo.ReviewVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectReviewVo")
@RequiredArgsConstructor
public class ProductSelectReviewVoService implements ProductViewService{
	private final ProductViewDao dao;
	
	public List<ReviewVo> selectReviewVo(int product_idx) {
		return dao.selectReviewVo(product_idx);
	}
}
