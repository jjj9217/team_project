package com.crfr.service.oneInq;

import org.springframework.stereotype.Service;

import com.crfr.vo.OneInqVo;
import com.crfr.vo.PageNav;

@Service("noticePage2")
public class oneInqPageService2 implements OneInqService {
	
	public PageNav setPageNav2(PageNav pageNav, String pageNum, String pageBlock, OneInqVo vo) {
		int totalRows = pageNav.getTotalRows();
		int rows_per_page = 15;
			
		System.out.println("ProductPageService's rows_per_page count: "+rows_per_page);	
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
		
		int startNum = (pNum-1)*rows_per_page + 1;
		int endNum = pNum*rows_per_page;
		int totalPageNum = (int)Math.ceil((double)totalRows/rows_per_page);
		int lastPageBlock = (int)Math.ceil((double)totalPageNum/pages_per_block);
		
		pageNav.setStartNum(startNum);
		pageNav.setEndNum(endNum);
		pageNav.setTotalPageNum(totalPageNum);
		pageNav.setLastPageBlock(lastPageBlock);
		
		return pageNav;
	}
		
}