package com.crfr.service.manager;

import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;
import com.crfr.vo.ReviewVo;

import lombok.RequiredArgsConstructor;

@Service("rvUpdate")
@RequiredArgsConstructor
public class ReviewUpdateService implements ManagerService {
	private final ManagerDao dao;
	
	public int reviewUpdate(String review_content,
			String review_idx) {
		
		ReviewVo vo = new ReviewVo();
		vo.setReview_content(review_content);
		vo.setReview_idx(Integer.parseInt(review_idx));

		
		return dao.reviewUpdate(vo);
	}
	

}