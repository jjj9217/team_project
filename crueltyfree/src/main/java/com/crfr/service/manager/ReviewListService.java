package com.crfr.service.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;
import com.crfr.vo.ReviewVo;

@Service("rvList")
public class ReviewListService implements ManagerService {
	private final ManagerDao dao;

	@Autowired
	public ReviewListService(ManagerDao dao) {
		this.dao = dao;
	}

	public List<ReviewVo> reviewList() {

		return dao.reviewList();
	}
}
