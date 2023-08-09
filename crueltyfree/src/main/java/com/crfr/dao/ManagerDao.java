package com.crfr.dao;

import java.util.List;
import java.util.Map;

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
	public List<ProductInqVo> proinqSelectList(Map<String, Object> map) {		
		return sqlSession.selectList(MAPPER+".proinqSelectList",map);
	}
	public List<ReviewVo> rvSelectList(Map<String, Object> map) {		
		return sqlSession.selectList(MAPPER+".rvSelectList",map);
	}
}