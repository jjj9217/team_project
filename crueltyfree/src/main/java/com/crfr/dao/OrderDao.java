package com.crfr.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.crfr.vo.BasketVo;
import com.crfr.vo.DeliveryVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class OrderDao {
	//BasketMapper.xml파일의 네임스페이스로 Mapper가 구분되므로
	//DAO에서 사용하는 Mapper의 네임스페이스를 상수로 정의함	
	public static final String MAPPER = "com.crfr.OrderMapper";
	
	//MyBatis를 이용한 DB연결 및 SQL작업은 SqlSession객체가 담당함
	private final SqlSession sqlSession;
		
	//장바구니 Vo불러오기
	public BasketVo selectBasket(String basket_idx) {		
		return sqlSession.selectOne(MAPPER+".selectBasket", basket_idx);
	}
	
	//회원의 배송지목록 불러오기
	public List<DeliveryVo> selectDeliveryList(String client_num) {		
		return sqlSession.selectList(MAPPER+".selectDeliveryList", client_num);
	}	
	
	//배송지목록 수량
	public int selectDeliveryCount(String client_num) {
		return sqlSession.selectOne(MAPPER+".selectDeliveryCount", client_num);
	}	
}
