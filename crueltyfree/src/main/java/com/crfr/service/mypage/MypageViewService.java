package com.crfr.service.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.MypageDao;
import com.crfr.dao.ProductDao;
import com.crfr.vo.DeliveryVo;
import com.crfr.vo.ExploreVo;

@Service("mpView")
public class MypageViewService implements MypageService {
	private MypageDao dao;
	
	@Autowired
	public MypageViewService(MypageDao dao) {
		this.dao = dao;
	}
	
	public DeliveryVo selectVieweditdelivery(int delivery_idx) {		
		return dao.selectVieweditdelivery(delivery_idx);
	}
	
}
