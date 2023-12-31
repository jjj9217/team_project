package com.crfr.service.productView;

import org.springframework.stereotype.Service;

import com.crfr.vo.PageNav;

import lombok.RequiredArgsConstructor;

@Service("pviPage")
@RequiredArgsConstructor
public class ProductInqPageService implements ProductViewService{
	
	public PageNav setPageNav(PageNav pageNav, String pageNum, String pageBlock) {
		int totalRows = pageNav.getTotalRows();
		int rows_per_page = 10;
		int pages_per_block = 5;
		
		pageNav.setRows_per_page(rows_per_page);
		pageNav.setPages_per_block(pages_per_block);
		
		int pNum = 0;
		if(pageNum == null) {
			pNum = 1;
		}else {
			pNum = Integer.parseInt(pageNum);
		}
		pageNav.setPageNum(pNum);
		
		int pBlock = 0;
		if(pageBlock == null) {
			pBlock = 1;
		}else {
			pBlock = Integer.parseInt(pageBlock);
		}
		pageNav.setPageBlock(pBlock);
		
		int totalPageNum = (int)Math.ceil((double)totalRows/rows_per_page);
		int lastPageBlock = (int)Math.ceil((double)totalPageNum/pages_per_block);
		
		int startNum = (pNum-1)*rows_per_page + 1;
		int endNum = 0;
		if(pNum != totalPageNum){ //끝페이지에서 totalRows만큼만 목록 표시하기 위함
			endNum = pNum*rows_per_page;
		}else{
			endNum = totalRows;
		}
		
		pageNav.setStartNum(startNum);
		pageNav.setEndNum(endNum);
		pageNav.setTotalPageNum(totalPageNum);
		pageNav.setLastPageBlock(lastPageBlock);
		
		return pageNav;
	}
}
