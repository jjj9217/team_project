package com.crfr.service.oneInq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.OneInqDao;
import com.crfr.vo.NoticeVo;
import com.crfr.vo.OneInqVo;

@Service("mListNotice")
public class NoticeListService implements OneInqService {
	private OneInqDao dao;
	
	@Autowired
	public NoticeListService(OneInqDao dao) {
		this.dao = dao;
	}
	
	//공지사항 리스트
	public List<NoticeVo> noticeList() {
	return dao.noticeList();
	}
		
	//1:1문의 리스트
	public List<OneInqVo> oneinqList(OneInqVo vo) {
	return dao.oneinqList(vo);
	}
	
	
	
}
