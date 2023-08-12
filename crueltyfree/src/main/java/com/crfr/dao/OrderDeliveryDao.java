package com.crfr.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.crfr.vo.BasketVo;
import com.crfr.vo.DeliveryVo;
import com.crfr.vo.OrderProductVo;
import com.crfr.vo.OrderVo;
import com.crfr.vo.PayVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class OrderDeliveryDao {
	//BasketMapper.xml파일의 네임스페이스로 Mapper가 구분되므로
	//DAO에서 사용하는 Mapper의 네임스페이스를 상수로 정의함	
	public static final String MAPPER = "com.crfr.OrderDeliveryMapper";
	
	//MyBatis를 이용한 DB연결 및 SQL작업은 SqlSession객체가 담당함
	private final SqlSession sqlSession;		
	
	//회원의 주문목록 불러오기
	public List<OrderVo> selectOrderVo(int member_idx){	
		return sqlSession.selectList(MAPPER+".selectOrderVo", member_idx);
	}
	
	//회원의 주문상품목록 불러오기
	public List<OrderProductVo> selectOrderProduct (int order_idx){
		return sqlSession.selectList(MAPPER+".selectOrderProduct", order_idx);
	}	
	
}
