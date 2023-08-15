package com.crfr.service.oneInq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.OneInqDao;
import com.crfr.vo.NoticeVo;

@Service("viewNotice")
public class NoticeViewService implements OneInqService {
	private OneInqDao dao;
	
	@Autowired
	public NoticeViewService(OneInqDao dao) {
		this.dao = dao;
	}
		
	//공지사항 뷰
	public NoticeVo noticeView(int notice_idx) {		
		return dao.noticeView(notice_idx);
	} 
	
	
}
