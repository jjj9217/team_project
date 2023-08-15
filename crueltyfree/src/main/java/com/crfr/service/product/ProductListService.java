package com.crfr.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.ProductDao;
import com.crfr.vo.ExploreVo;
import com.crfr.vo.FileVo;
import com.crfr.vo.ProductVo;

@Service("pdList")
public class ProductListService implements ProductService {
	private ProductDao dao;
	
	@Autowired
	public ProductListService(ProductDao dao) {
		this.dao = dao;
	}
	
	
	public List<ProductVo> selectList(ExploreVo vo) {										
		return dao.selectList(vo);
	}
	
	public List<FileVo> selectListimg(ExploreVo vo) {										
		return dao.selectListimg(vo);
	}
	
	//상품 목록 반환 구문
	public List<ProductVo> MainselectList() {	
		return dao.MainselectList();
	}
	
	//상품 목록 사진 출력
	public List<FileVo> MainselectListimg() {	
		return dao.MainselectListimg();
	}
	

}
