package com.crfr.service.seller;

import java.util.List;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductSellerDao;
import com.crfr.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("cMemberIdxList")
@RequiredArgsConstructor
public class CheckProductMemberService implements ProductSellerService {
	private final ProductSellerDao dao;
	
	public List<ProductVo> checkMemberList(String member_idx){
		return dao.checkMemberList(member_idx);
	}
}