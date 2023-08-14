package com.crfr.service.oneInq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.OneInqDao;
import com.crfr.vo.NoticeVo;
import com.crfr.vo.OneInqVo;

@Service("delNotice")
public class NoticedeleteService implements OneInqService {
	private OneInqDao dao;
	
	@Autowired
	public NoticedeleteService(OneInqDao dao) {
		this.dao = dao;
	}
	
	//해당 공지사항 삭제 메소드
	public int deletenotice(int notice_idx) {
		return dao.deletenotice(notice_idx);
	}
	
	//1:1문의 삭제하기
	public int deleteoneinq(OneInqVo vo) {
		return dao.deleteoneinq(vo);
	}
}
