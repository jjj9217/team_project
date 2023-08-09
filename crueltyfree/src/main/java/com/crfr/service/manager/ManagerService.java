package com.crfr.service.manager;

import java.util.List;
import java.util.Map;

import com.crfr.common.PageNav;
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
	default PageNav setPageNav(PageNav pageNav, String pageNum, String pageBlock) {return null;}
	default int selectCount(String searchField, String searchWord){return 0;}
	default int proselectCount(String searchField, String searchWord){return 0;}
	default int memselectCount(String searchField, String searchWord){return 0;}
	default int oneselectCount(String searchField, String searchWord){return 0;}
	default int proinqselectCount(String searchField, String searchWord){return 0;}
	default List<ProductVo> proSelectList(String searchField, String searchWord) {return null;}
	default List<MemberVo> memSelectList(String searchField, String searchWord) {return null;}
	default List<OneInqVo> oneSelectList(String searchField, String searchWord) {return null;}
	default List<ProductInqVo> proinqSelectList(String searchField, String searchWord) {return null;}
	default List<ReviewVo> rvSelectList(String searchField, String searchWord) {return null;}
}
