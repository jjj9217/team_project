package com.crfr.service.manager;

import org.springframework.stereotype.Service;

import com.crfr.common.PageNav1;


@Service("mPage")
public class MPageService implements ManagerService {
	
	public PageNav1 setPageNav(PageNav1 pageNav, String pageNum, String pageBlock) {
		int totalRows = pageNav.getTotalRows();
		int rows_per_page = 15;
		int pages_per_block = 5;
		

		pageNav.setRows_per_page(rows_per_page);
		pageNav.setPages_per_block(pages_per_block);
			
		int pNum = 0;
		if(pageNum == null) {
			pNum = 1;
		}else {
			pNum=Integer.parseInt(pageNum);
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
		if(pNum == totalPageNum) {
			endNum = totalRows;
		}else {
			endNum = pNum*rows_per_page;			
		}
		
		pageNav.setStartNum(startNum);
		pageNav.setEndNum(endNum);
		pageNav.setTotalPageNum(totalPageNum);
		pageNav.setLastPageBlock(lastPageBlock);

		return pageNav;
	}
}