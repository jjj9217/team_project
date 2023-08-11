package com.crfr.service.productView;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductViewDao;
import com.crfr.vo.FileVo;
import com.crfr.vo.ProductVo;
import com.crfr.vo.ReviewVo;

import lombok.RequiredArgsConstructor;

@Service("pSelectReviewImage")
@RequiredArgsConstructor
public class ProductSelectReviewImageService implements ProductViewService{
	private final ProductViewDao dao;
	
	public List<FileVo> selectReviewImage(int review_idx) {
		return dao.selectReviewImage(review_idx);
	}
}
