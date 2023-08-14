package com.crfr.service.oneInq;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.crfr.dao.OneInqDao;
import com.crfr.service.seller.ProductSellerService;

import lombok.RequiredArgsConstructor;

@Service("cNoticeCount")
@RequiredArgsConstructor
public class CheckNoticeCountService implements OneInqService {
	private final OneInqDao dao;
	
	public int checkNoticeCount(String notice_idx) {
		return dao.checkNoticeCount(notice_idx);
	}
}
