package com.crfr.service.productView;

import java.util.List;
import java.util.Map;

import com.crfr.vo.FileVo;
import com.crfr.vo.LikeVo;
import com.crfr.vo.PageNav;
import com.crfr.vo.ProductInfoVo;
import com.crfr.vo.ProductInqVo;
import com.crfr.vo.ProductVo;

public interface ProductViewService {
	default ProductVo selectView(int Product_idx) {return null;}
	default FileVo selectThumbnail(int product_idx) {return null;}
	default List<FileVo> selectFile(int product_idx) {return null;}
	default ProductInfoVo selectInfo(int product_idx) {return null;}
	default List<ProductInqVo> selectProductInq(int product_idx) {return null;}
	default int selectProductInqCount(int product_idx) {return 0;}	
	default int insertProductInq(String member_idx, String product_idx, 
			String product_inq_content, String member_nickname) {return 0;}
	default int updateProductInq(String product_inq_idx, String product_inq_content) {return 0;}
	default int deleteProductInq(String product_inq_idx) {return 0;}
	default LikeVo selectLike(int product_idx, int member_idx) {return null;}
	default int insertlike(String product_idx, String member_idx) {return 0;}
	default int deletelike(String product_idx, String member_idx) {return 0;}
	default PageNav setPageNav(PageNav pageNav, String pageNum, String pageBlock) {return null;}//상품문의페이징
	default int selectReviewCount(int product_idx) {return 0;}
	default int selectReviewListCount(Map<String, Object> map) {return 0;}	
}
