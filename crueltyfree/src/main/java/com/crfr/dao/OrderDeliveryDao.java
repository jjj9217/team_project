package com.crfr.dao;

import java.sql.Timestamp;
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
	public List<OrderVo> selectOrderVo(int member_idx, Timestamp timestamp_begin, Timestamp timestamp_end){	
	    Map<String, Object> map = new HashMap<>();
	    map.put("member_idx", member_idx);
	    map.put("timestamp_begin", timestamp_begin);
	    map.put("timestamp_end", timestamp_end);
		return sqlSession.selectList(MAPPER+".selectOrderVo", map);
	}
	
	//회원의 주문상품목록 불러오기
	public List<OrderProductVo> selectOrderProduct (int order_idx){
		return sqlSession.selectList(MAPPER+".selectOrderProduct", order_idx);
	}	
	
	//회원의 주문상품 수
	public int selectOrderCount(int member_idx, Timestamp timestamp_begin, Timestamp timestamp_end) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("member_idx", member_idx);
	    map.put("timestamp_begin", timestamp_begin);
	    map.put("timestamp_end", timestamp_end);
		return sqlSession.selectOne(MAPPER+".selectOrderCount", map);	
	}
	
	//회원의 결제완료 수
	public int selectCountPayEd(int member_idx, Timestamp timestamp_begin, Timestamp timestamp_end) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("member_idx", member_idx);
	    map.put("timestamp_begin", timestamp_begin);
	    map.put("timestamp_end", timestamp_end);
		return sqlSession.selectOne(MAPPER+".selectCountPayEd", map);	
	}
	
	//회원의 배송준비중 수
	public int selectCountDlvIng(int member_idx, Timestamp timestamp_begin, Timestamp timestamp_end) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("member_idx", member_idx);
	    map.put("timestamp_begin", timestamp_begin);
	    map.put("timestamp_end", timestamp_end);
		return sqlSession.selectOne(MAPPER+".selectCountDlvIng", map);	
	}
	
	//회원의 배송중 수
	public int selectCountDlvEd(int member_idx, Timestamp timestamp_begin, Timestamp timestamp_end) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("member_idx", member_idx);
	    map.put("timestamp_begin", timestamp_begin);
	    map.put("timestamp_end", timestamp_end);
		return sqlSession.selectOne(MAPPER+".selectCountDlvEd", map);	
	}
	
	//회원의 취소/반품목록 불러오기
	public List<OrderVo> selectRefund(int member_idx, Timestamp timestamp_begin, Timestamp timestamp_end){	
	    Map<String, Object> map = new HashMap<>();
	    map.put("member_idx", member_idx);
	    map.put("timestamp_begin", timestamp_begin);
	    map.put("timestamp_end", timestamp_end);
		return sqlSession.selectList(MAPPER+".selectRefund", map);
	}
	
	//회원의 취소/반품목록 수
	public int selectRefundCount(int member_idx, Timestamp timestamp_begin, Timestamp timestamp_end) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("member_idx", member_idx);
	    map.put("timestamp_begin", timestamp_begin);
	    map.put("timestamp_end", timestamp_end);
		return sqlSession.selectOne(MAPPER+".selectRefundCount", map);	
	}
	
	//주문번호 1건의의 주문목록 불러오기
	public OrderVo selectOrderView(String order_num){	
		return sqlSession.selectOne(MAPPER+".selectOrderView", order_num);
	}
	
	//배송지번호로 배송지 정보 불러오기
	public DeliveryVo selectDelivery(int delivery_idx){
		return sqlSession.selectOne(MAPPER+".selectDelivery", delivery_idx);
	}
}
