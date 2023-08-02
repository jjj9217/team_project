package com.crfr.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.crfr.vo.FileVo;
import com.crfr.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ProductDao {
	public static final String MAPPER = "com.crfr.ProductMapper";
	
	private final SqlSession sqlSession;
	
	//지정한 상품번호의 상품을찾아 Vo반환하는 메소드
	public ProductVo selectView(int product_view) {
		return sqlSession.selectOne(MAPPER+".selectView", product_view);
	}
	
	//지정한 상품번호의 파일중 썸네일을 찾아 Vo반환하는 메소드
	public FileVo selectThumbnail(int product_view) {
		return sqlSession.selectOne(MAPPER+".selectThumbnail", product_view);
	}
}
