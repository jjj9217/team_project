package com.crfr.service.oneInq;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.crfr.dao.OneInqDao;
import com.crfr.service.seller.ProductSellerService;
import com.crfr.vo.OneInqVo;

import lombok.RequiredArgsConstructor;

@Service("cNoticeCount")
@RequiredArgsConstructor
public class CheckNoticeCountService implements OneInqService {
	private final OneInqDao dao;
	
	public int checkNoticeCount(String notice_idx) {
		return dao.checkNoticeCount(notice_idx);
	}
	
	//공지사항 리스트 개수
	public int noticeListCount() {
		return dao.noticeListCount();
	}
	
	//1:1문의 개수
	public int oneinqListCount(OneInqVo vo) {
	return dao.oneinqListCount(vo);
	}
	
}
