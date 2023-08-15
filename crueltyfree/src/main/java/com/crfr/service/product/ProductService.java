package com.crfr.service.product;

import java.util.List;

import com.crfr.vo.ExploreVo;
import com.crfr.vo.FileVo;
import com.crfr.vo.PageNav;
import com.crfr.vo.ProductVo;

public interface ProductService {
	default int selectCount(ExploreVo vo) {return 0;}
	
	default List<ProductVo> selectList(ExploreVo vo){return null;}
	
	default List<FileVo> selectListimg(ExploreVo vo) {return null;}
	
	default ProductVo selectView(int board_idx) {return null;}
	
	default PageNav setPageNav(PageNav pageNav, String pageNum, String pageBlock, ExploreVo vo) {return null;}
	
	default List<ProductVo> MainselectList() {return null;}
		
	default List<FileVo> MainselectListimg() {return null;}
	
}