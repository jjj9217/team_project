package com.crfr.dao;

import java.util.List;

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
}