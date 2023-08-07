package com.crfr.service.mypage;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.MypageDao;
import com.crfr.vo.DeliveryVo;


@Service("mpDelete")
public class MypageDeleteService implements MypageService {
	private MypageDao dao;
	
	@Autowired
	public MypageDeleteService(MypageDao dao) {
		this.dao = dao;
	}
	
	public int deletedeliveryPost(DeliveryVo vo) {
		return dao.deletedeliveryPost(vo);}

}
