package com.crfr.service.manager;

import java.util.List;

import com.crfr.common.PageNav1;
import com.crfr.vo.MemberVo;
import com.crfr.vo.OneInqVo;
import com.crfr.vo.ProductInqVo;
import com.crfr.vo.ProductVo;
import com.crfr.vo.ReviewVo;

public interface ManagerService {
	default List<OneInqVo> getList() {return null;}
	default List<ProductVo> productList() {return null;}
	default List<MemberVo> memberList() {return null;}
	default List<OneInqVo> sellersignList() {return null;}
	default List<ProductInqVo> productinqList() {return null;}
	default List<ReviewVo> reviewList() {return null;}
	default PageNav1 setPageNav(PageNav1 pageNav, String pageNum, String pageBlock) {return null;}
	default int selectCount(String searchField, String searchWord){return 0;}
	default int proselectCount(String searchField, String searchWord){return 0;}
	default int memselectCount(String searchField, String searchWord){return 0;}
	default int oneselectCount(String searchField, String searchWord){return 0;}
	default int selselectCount(String searchField, String searchWord){return 0;}
	default int proinqselectCount(String searchField, String searchWord){return 0;}
	default List<ProductVo> proSelectList(String searchField, String searchWord) {return null;}
	default List<MemberVo> memSelectList(String searchField, String searchWord) {return null;}
	default List<OneInqVo> oneSelectList(String searchField, String searchWord) {return null;}
	default List<OneInqVo> selSelectList(String searchField, String searchWord) {return null;}
	default List<ProductInqVo> proinqSelectList(String searchField, String searchWord) {return null;}
	default List<ReviewVo> rvSelectList(String searchField, String searchWord) {return null;}
	default int delete(String product_idx) {return 0;}
	default int memdelete(String member_idx) {return 0;}
	default int onedelete(String one_inq_idx) {return 0;}
	default int seldelete(String one_inq_idx) {return 0;}
	default int proinqdelete(String product_inq_idx) {return 0;}
	default int reviewdelete(String review_idx) {return 0;}
	default int productUpdate (String product_name, String product_price, 
			String product_capa, String delivery_company, String product_idx) {return 0;}
	default int memberUpdate (String member_id, String member_name, 
			String member_gender,String member_grade, String member_idx) {return 0;}
	default int oneinqUpdate (String one_inq_answer, String one_inq_idx) {return 0;}
	default int productinqUpdate (String product_inq_answer, String product_inq_idx) {return 0;}
	default int reviewUpdate (String review_content, String review_idx) {return 0;}
	default ProductVo findProductPost(String product_idx) {return null;}
	default int productDeleteOne(String product_idx) {return 0;}
	default int memberDeleteOne(String member_idx) {return 0;}
	default int oneinqDeleteOne(String one_inq_idx) {return 0;}
	default int seloneinqDeleteOne(String one_inq_idx) {return 0;}
	default int productinqDeleteOne(String product_inq_idx) {return 0;}
	default int reviewDeleteOne(String review_idx) {return 0;}
}
