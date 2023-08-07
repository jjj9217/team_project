package com.crfr.service.mypage;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.crfr.dao.MypageDao;
import com.crfr.vo.DeliveryVo;

@Service("mpUpdate")
public class MypageUpdateService implements MypageService {
	private MypageDao dao;
	
	@Autowired
	public MypageUpdateService(MypageDao dao) {
		this.dao = dao;
	}
		
	public int updatedeliveryPostdefault (DeliveryVo vo) {
		return dao.updatedeliveryPostdefault(vo);
	}
	
	public int updatedeliveryPostchangedefault(DeliveryVo vo) {
		return dao.updatedeliveryPostchangedefault(vo);
	}
	
	public int updatedeliveryPost(DeliveryVo vo) {
		return dao.updatedeliveryPost(vo);
	}	
	

}
