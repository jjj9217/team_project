package com.crfr.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crfr.vo.MemberVo;
import com.crfr.vo.OneInqVo;
import com.crfr.vo.ProductInqVo;
import com.crfr.vo.ProductVo;
import com.crfr.vo.ReviewVo;

@Repository
public class ManagerDao{
	
	public static final String MAPPER = "ManagerMapper";
	//MyBatis를 이용한 DB 연결 및 작업은 SqlSession객체가 담당함
    SqlSession sqlSession;
    
    @Autowired
	public ManagerDao(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
    
	public List<OneInqVo> getList(){
		return sqlSession.selectList(MAPPER+".getList");
	}
	public List<OneInqVo> sellersignList(){
		return sqlSession.selectList(MAPPER+".sellersignList");
	}
	public List<ProductVo> productList(){
		return sqlSession.selectList(MAPPER+".productList");
	}
	public List<MemberVo> memberList(){
		return sqlSession.selectList(MAPPER+".memberList");
	}
	public List<ProductInqVo> productinqList(){
		return sqlSession.selectList(MAPPER+".productinqList");
	}
	public List<ReviewVo> reviewList(){
		return sqlSession.selectList(MAPPER+".reviewList");
	}
	//검색 조건에 맞는 게시물 수를 반환하는 메소드
	public int selectCount(Map<String, Object> map) {
		return sqlSession.selectOne(MAPPER+".selectCount",map);
	}
	public int proselectCount(Map<String, Object> map) {
		return sqlSession.selectOne(MAPPER+".proselectCount",map);
	}
	public int memselectCount(Map<String, Object> map) {
		return sqlSession.selectOne(MAPPER+".memselectCount",map);
	}
	public int oneselectCount(Map<String, Object> map) {
		return sqlSession.selectOne(MAPPER+".oneselectCount",map);
	}
	public int selselectCount(Map<String, Object> map) {
		return sqlSession.selectOne(MAPPER+".selselectCount",map);
	}
	public int proinqselectCount(Map<String, Object> map) {
		return sqlSession.selectOne(MAPPER+".proinqselectCount",map);
	}
	//검색 조건에 맞는 게시물 목록을 반환하는 메소드
	public List<ProductVo> proSelectList(Map<String, Object> map) {		
		return sqlSession.selectList(MAPPER+".proSelectList",map);
	}
	public List<MemberVo> memSelectList(Map<String, Object> map) {		
		return sqlSession.selectList(MAPPER+".memSelectList",map);
	}
	public List<OneInqVo> oneSelectList(Map<String, Object> map) {		
		return sqlSession.selectList(MAPPER+".oneSelectList",map);
	}
	public List<OneInqVo> selSelectList(Map<String, Object> map) {		
		return sqlSession.selectList(MAPPER+".selSelectList",map);
	}
	public List<ProductInqVo> proinqSelectList(Map<String, Object> map) {		
		return sqlSession.selectList(MAPPER+".proinqSelectList",map);
	}
	public List<ReviewVo> rvSelectList(Map<String, Object> map) {		
		return sqlSession.selectList(MAPPER+".rvSelectList",map);
	}
	public int delete(String product_idx) {
		return sqlSession.update(MAPPER+".delete", product_idx);
	}
	public int memdelete(String member_idx) {
		return sqlSession.delete(MAPPER+".memdelete", member_idx);
	}
	public int onedelete(String one_inq_idx) {
		return sqlSession.delete(MAPPER+".onedelete", one_inq_idx);
	}
	public int seldelete(String one_inq_idx) {
		return sqlSession.delete(MAPPER+".onedelete", one_inq_idx);
	}
	public int proinqdelete(String product_inq_idx) {
		return sqlSession.delete(MAPPER+".proinqdelete", product_inq_idx);
	}
	public int reviewdelete(String review_idx) {
		return sqlSession.delete(MAPPER+".reviewdelete", review_idx);
	}
	//지정한 게시물의 내용을 수정하는 메소드
	public int productUpdate(ProductVo vo) {
		return sqlSession.update(MAPPER+".productUpdate", vo);
	}
	public int memberUpdate(MemberVo vo) {
		return sqlSession.update(MAPPER+".memberUpdate", vo);
	}
	public int oneinqUpdate(OneInqVo vo) {
		return sqlSession.update(MAPPER+".oneinqUpdate", vo);
	}
	public int productinqUpdate(ProductInqVo vo) {
		return sqlSession.update(MAPPER+".productinqUpdate", vo);
	}
	public int reviewUpdate(ReviewVo vo) {
		return sqlSession.update(MAPPER+".reviewUpdate", vo);
	}
	//지정한 게시물을 찾아 상품 정보를 반환하는 메소드
	public ProductVo findProductPost(String product_idx) {
		return sqlSession.selectOne(MAPPER+".findProductPost", product_idx);
	}
	public int productDeleteOne(String product_idx) {
		int productIdx = Integer.parseInt(product_idx);
		return sqlSession.delete(MAPPER+".productDeleteOne",productIdx);
	}
	public int memberDeleteOne(String member_idx) {
		int memberIdx = Integer.parseInt(member_idx);
		return sqlSession.delete(MAPPER+".memberDeleteOne",memberIdx);
	}
	public int oneinqDeleteOne(String one_inq_idx) {
		int one_inq_Idx = Integer.parseInt(one_inq_idx);
		return sqlSession.delete(MAPPER+".oneinqDeleteOne",one_inq_Idx);
	}
	public int seloneinqDeleteOne(String one_inq_idx) {
		int one_inq_Idx = Integer.parseInt(one_inq_idx);
		return sqlSession.delete(MAPPER+".seloneinqDeleteOne",one_inq_Idx);
	}
	public int productinqDeleteOne(String product_inq_idx) {
		int product_inq_Idx = Integer.parseInt(product_inq_idx);
		return sqlSession.delete(MAPPER+".productinqDeleteOne",product_inq_Idx);
	}
	public int reviewDeleteOne(String review_idx) {
		int review_Idx = Integer.parseInt(review_idx);
		return sqlSession.delete(MAPPER+".reviewDeleteOne",review_Idx);
	}
}