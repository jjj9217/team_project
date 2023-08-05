package com.crfr.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.crfr.vo.BasketVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BasketDao {
	//BasketMapper.xml파일의 네임스페이스로 Mapper가 구분되므로
	//DAO에서 사용하는 Mapper의 네임스페이스를 상수로 정의함	
	public static final String MAPPER = "com.crfr.BasketMapper";
	
	//MyBatis를 이용한 DB연결 및 SQL작업은 SqlSession객체가 담당함
	private final SqlSession sqlSession;
	
	//장바구니에 담긴 상품 수량
	public int selectCount(String client_num) {
		return sqlSession.selectOne(MAPPER+".selectCount", client_num);
	}
	
	//장바구니 리스트
	public List<BasketVo> selectList(String client_num) {		
		return sqlSession.selectList(MAPPER+".selectList", client_num);
	}
	
	//장바구니 수량 +
	public void plusBasketCount(int product_idx, String client_num) {
		Map<String, Object> map = new HashMap<>();
	    map.put("product_idx", product_idx);
	    map.put("client_num", client_num);
		
		sqlSession.update(MAPPER+".plusBasketCount",map);		
	}
	
	//장바구니 수량 -
	public void minusBasketCount(int product_idx, String client_num) {
		Map<String, Object> map = new HashMap<>();
	    map.put("product_idx", product_idx);
	    map.put("client_num", client_num);
		
		sqlSession.update(MAPPER+".minusBasketCount",map);		
	}
	
	//장바구니 수량 업데이트
	public void updateBasketCount(int product_idx, int basket_count, String client_num) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("product_idx", product_idx);
	    map.put("basket_count", basket_count);
	    map.put("client_num", client_num);
	    
		sqlSession.update(MAPPER+".updateBasketCount",map);		
	}
	
	//장바구니 담기
	public int basketInsert(int product_idx, int prd_cart_cnt, String client_num) {
		Map<String, Object> map = new HashMap<>();
	    map.put("product_idx", product_idx);
	    map.put("basket_count", prd_cart_cnt);
	    map.put("client_num", client_num);
		
		return sqlSession.insert(MAPPER+".basketInsert",map);
	}	
	
	//장바구니 수량 다수+ (상세보기 페이지 담기용)
	public void plusBasketMultipleCount(int product_idx, int prd_cart_cnt, String client_num) {
		Map<String, Object> map = new HashMap<>();
	    map.put("product_idx", product_idx);
	    map.put("basket_count", prd_cart_cnt);
	    map.put("client_num", client_num);
		
		sqlSession.update(MAPPER+".plusBasketMultipleCount",map);		
	}
	
	//장바구니 상품 개별 삭제
	public int basketDeleteOne(String basket_idx) {
		int basketIdx = Integer.parseInt(basket_idx);
		return sqlSession.delete(MAPPER+".basketDeleteOne",basketIdx);
	}
}
