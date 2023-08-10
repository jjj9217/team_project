package com.crfr.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.crfr.vo.FileVo;
import com.crfr.vo.LikeVo;
import com.crfr.vo.ProductInfoVo;
import com.crfr.vo.ProductInqVo;
import com.crfr.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ProductViewDao {
	public static final String MAPPER = "com.crfr.ProductViewMapper";
	
	private final SqlSession sqlSession;
	
	//지정한 상품번호의 상품을찾아 Vo반환하는 메소드
	public ProductVo selectView(int product_view) {
		return sqlSession.selectOne(MAPPER+".selectView", product_view);
	}
	
	//지정한 상품번호의 파일중 썸네일을 찾아 Vo반환하는 메소드
	public FileVo selectThumbnail(int product_view) {
		return sqlSession.selectOne(MAPPER+".selectThumbnail", product_view);
	}

	//지정한 상품번호의 파일을 찾아 Vo반환하는 메소드
	public List<FileVo> selectFile(int product_view) {
		return sqlSession.selectList(MAPPER+".selectFile", product_view);
	}	
	
	//지정한 상품번호의 상품정보를찾아 Vo반환하는 메소드
	public ProductInfoVo selectInfo(int product_view) {
		return sqlSession.selectOne(MAPPER+".selectInfo", product_view);
	}
	
	//지정한 상품번호의 상품문의를 찾아 Vo반환
	public List<ProductInqVo> selectProductInq(int product_view) {
		return sqlSession.selectList(MAPPER+".selectProductInq", product_view);
	}
	
	//지정상품의 상품문의 수
	public int selectProductInqCount(int product_idx) {
		return sqlSession.selectOne(MAPPER+".selectProductInqCount", product_idx);
	}	
	
	//상품문의 등록
	public int insertProductInq(String member_idx, String product_idx, String product_inq_content, String member_nickname) {
		Map<String, String> map = new HashMap<>();
		map.put("member_idx", member_idx);
		map.put("product_idx", product_idx);
		map.put("product_inq_content", product_inq_content);
		map.put("member_nickname", member_nickname);
		return sqlSession.insert(MAPPER+".insertProductInq",map);
	}
	
	//상품문의 수정
	public int updateProductInq(String product_inq_idx, String product_inq_content) {
		Map<String, String> map = new HashMap<>();
		map.put("product_inq_idx", product_inq_idx);
		map.put("product_inq_content", product_inq_content);
		return sqlSession.update(MAPPER+".updateProductInq",map);
	}

	//상품문의 삭제
	public int deleteProductInq(String product_inq_idx) {
		int productInqIdx = Integer.parseInt(product_inq_idx);
		return sqlSession.delete(MAPPER+".deleteProductInq",productInqIdx);
	}	
	
	//좋아요 정보 불러오기
	public LikeVo selectLike(int product_idx, int member_idx) {
	    String strProductIdx = String.valueOf(product_idx);
	    String strMemberIdx = String.valueOf(member_idx);		
		
		Map<String, String> map = new HashMap<>();
		map.put("product_idx", strProductIdx);
		map.put("member_idx", strMemberIdx);
		
		return sqlSession.selectOne(MAPPER+".selectLike", map);
	}
	
	//좋아요 등록
	public int insertlike(String product_idx, String member_idx) {
		Map<String, String> map = new HashMap<>();
		map.put("member_idx", member_idx);
		map.put("product_idx", product_idx);
		return sqlSession.insert(MAPPER+".insertlike",map);
	}

	//좋아요 삭제
	public int deletelike(String product_idx, String member_idx) {
		Map<String, String> map = new HashMap<>();
		map.put("member_idx", member_idx);
		map.put("product_idx", product_idx);
		return sqlSession.delete(MAPPER+".deletelike",map);
	}

	//지정상품의 리뷰 수
	public int selectReviewCount(int product_idx) {
		return sqlSession.selectOne(MAPPER+".selectReviewCount", product_idx);
	}	
	
	//사용자 조건에 따른 리뷰 수
	public int selectReviewListCount(Map<String, Object> map) {
		return sqlSession.selectOne(MAPPER+".selectReviewListCount", map);
	}	
		
	
}
