package com.crfr.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.crfr.vo.FileVo;
import com.crfr.vo.OrderProductVo;
import com.crfr.vo.OrderVo;
import com.crfr.vo.ProductInfoVo;
import com.crfr.vo.ProductVo;
import com.crfr.vo.PurchaseListVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ProductSellerDao{
	//RegiProMapper.xml파일의 네임스페이스로 Mapper가 구분되므로
	//DAO에서 사용하는 Mapper의 네임스페이스를 상수로 정의함
	public static final String MAPPER = "com.crfr.ProductInsert";
	
	//MyBatis를 이용한 DB연결 및 SQL작업은 SqlSession객체가 담당함
	private final SqlSession sqlSession;
	
	//검색 조건에 맞는 게시물 목록을 반환하는 메소드
	public List<ProductVo> checkProductList(Map<String, Object> map) {
		return sqlSession.selectList(MAPPER+".checkProductList", map);
	}
	
	//검색 조건에 맞는 게시물 수를 반환하는 메소드
	public int checkProductCount(Map<String, Object> map) {
		return sqlSession.selectOne(MAPPER+".checkProductCount", map);
	}
	
	//지정한 게시물의 파일을 수정하는 메소드
	public int productUpdateFile0(FileVo vo) {
		return sqlSession.update(MAPPER+".productUpdateFile0", vo);
	}
	public int productUpdateFile1(FileVo vo) {
		return sqlSession.update(MAPPER+".productUpdateFile1", vo);
	}
	public int productUpdateFile2(FileVo vo) {
		return sqlSession.update(MAPPER+".productUpdateFile2", vo);
	}
	public int productUpdateFile3(FileVo vo) {
		return sqlSession.update(MAPPER+".productUpdateFile3", vo);
	}
	
	//지정한 게시물의 내용을 수정하는 메소드
	public int productUpdate(ProductVo vo) {
		return sqlSession.update(MAPPER+".productUpdate", vo);
	}
		
	//지정한 게시물의 내용을 수정하는 메소드
	public int updateProductInfo(ProductInfoVo vo) {
		return sqlSession.update(MAPPER+".updateProductInfo", vo);
	}
	
	//지정한 게시물을 찾아 상품 정보를 반환하는 메소드
	public ProductVo findProductPost(String product_idx) {
		return sqlSession.selectOne(MAPPER+".findProductPost", product_idx);
	}
	
	//지정한 상품을 찾아 구매 정보를 반환하는 메소드
	public ProductInfoVo findProductInfoPost(String product_idx) {
		return sqlSession.selectOne(MAPPER+".findProductInfoPost", product_idx);
	}
	
	//지정한 상품을 찾아 파일 정보를 반환하는 메소드
	public List<FileVo> findProductFilePost(String product_idx) {
		return sqlSession.selectList(MAPPER+".findProductFilePost", product_idx);
	}
	
	// 지정한 상품 번호로 파일 번호를 반환하는 메소드
	public List<FileVo> findProductFileIdx(String product_idx) {
		return sqlSession.selectList(MAPPER+".findProductFileIdx", product_idx);
	}
	
	//지정한 상품 삭제 메소드
	public int deleteProduct(String product_idx) {
		return sqlSession.update(MAPPER+".deleteProduct", product_idx);
	}
	
	//특정 member_idx에 해당되는 상품 리스트
	public List<ProductVo> checkMemberList(String member_idx) {		
		return sqlSession.selectList(MAPPER+".checkMemberList", member_idx);
	}
	//특정 product_idx에 해당되는 주문 상품 리스트
	public List<OrderProductVo> checkOrderProductList(int product_idx) {		
		return sqlSession.selectList(MAPPER+".checkOrderProductList", product_idx);
	}
	//특정 order_idx에 해당되는 주문 리스트
	public OrderVo checkOrderList(Map<String, Object> map) {		
		return sqlSession.selectOne(MAPPER+".checkOrderList", map);
	}
	
	// 구매 내역 리스트
	public List<PurchaseListVo> checkProductHistoryList(Map<String, Object> map) {
		return sqlSession.selectList(MAPPER+".checkProductHistoryList", map);
	}
	
	// order_ing 상태 업데이트
	public int updateDeliveryState(String order_num) {		
		return sqlSession.update(MAPPER+".updateDeliveryState", order_num);
	}
	
}