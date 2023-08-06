package com.crfr.service.manager;

import java.util.List;

import com.crfr.vo.MemberVo;
import com.crfr.vo.OneInqVo;
import com.crfr.vo.ProductInqVo;
import com.crfr.vo.ProductVo;
import com.crfr.vo.ReviewVo;

public interface ManagerService {
	default List<OneInqVo> getList() {return null;}
	default List<ProductVo> productList() {return null;}
	default List<MemberVo> memberList() {return null;}
	default List<ProductInqVo> productinqList() {return null;}
	default List<ReviewVo> reviewList() {return null;}
}
