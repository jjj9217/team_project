package com.crfr.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.crfr.vo.FileVo;
import com.crfr.vo.ProductInfoVo;
import com.crfr.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ProductInsertDao{
	//RegiProMapper.xml파일의 네임스페이스로 Mapper가 구분되므로
	//DAO에서 사용하는 Mapper의 네임스페이스를 상수로 정의함
	public static final String MAPPER = "com.crfr.ProductInsert";
	
	//MyBatis를 이용한 DB연결 및 SQL작업은 SqlSession객체가 담당함
	private final SqlSession sqlSession;
	
	//상품 추가
	public int insertProduct(ProductVo vo) {
		return sqlSession.insert(MAPPER+".insertProduct", vo);
	}
	public int insertProductInfo(ProductInfoVo vo) {
		return sqlSession.insert(MAPPER+".insertProductInfo", vo);
	}
	public int insertFile(FileVo vo) {
		return sqlSession.insert(MAPPER+".insertFile", vo);
	}
	
	public ProductVo findProductIdx(String product_name, String member_nickname) {
		Map<String, String> map = new HashMap<>();
		map.put("product_name", product_name);
		map.put("member_nickname", member_nickname);
		return sqlSession.selectOne(MAPPER+".findProductIdx", map);
	}
}