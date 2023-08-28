package com.crfr.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.crfr.vo.BasketVo;
import com.crfr.vo.CouponVo;
import com.crfr.vo.DeliveryVo;
import com.crfr.vo.OrderVo;
import com.crfr.vo.PayVo;

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

	//배송지테이블 등록
	public int insertDelivery(DeliveryVo deliveryVo){
		return sqlSession.insert(MAPPER+".insertDelivery",deliveryVo);
	}
	
	//배송지 Vo불러오기
	public DeliveryVo selectDeliveryVo(DeliveryVo deliveryVo) {		
		return sqlSession.selectOne(MAPPER+".selectDeliveryVo", deliveryVo);
	}	
	
	//주문테이블 등록
	public int insertOrder(OrderVo orderVo){
		return sqlSession.insert(MAPPER+".insertOrder",orderVo);
	}
	
	//order_idx불러오기
	public int selectOrderIdx(OrderVo orderVo) {		
		return sqlSession.selectOne(MAPPER+".selectOrderIdx", orderVo);
	}	
	
	//결제테이블 등록
	public int insertPay(PayVo payVo){
		return sqlSession.insert(MAPPER+".insertPay",payVo);
	}
	
	//장바구니삭제
	public int deleteBasket(String basket_idx){
		return sqlSession.delete(MAPPER+".deleteBasket",basket_idx);
	}

	//주문상품 테이블 등록
	public int insertOrderProduct(String order_idx, String product_idx, 
			String client_num, String order_product_count) {		
		Map<String, String> map = new HashMap<>();
		map.put("order_idx", order_idx);
		map.put("product_idx", product_idx);
		map.put("client_num", client_num);
		map.put("order_product_count", order_product_count);
		return sqlSession.insert(MAPPER+".insertOrderProduct",map);
	}
	
	//환불후 주문테이블 업데이트
	public void updateOrder(String order_idx) {		
		sqlSession.update(MAPPER+".updateOrder",order_idx);
	}
	
	//환불후 결제테이블 업데이트
	public void updatePay(String order_idx) {		
		sqlSession.update(MAPPER+".updatePay",order_idx);
	}		
	
	//회원체크
	public int selectCountMember(Map<String, String> map) {
		return sqlSession.selectOne(MAPPER+".selectCountMember", map);
	}
	
	//쿠폰리스트 수량
	public int selectCouponCount(int member_idx,Date today) {
		Map<String, Object> map = new HashMap<>();
		map.put("member_idx", member_idx);
		map.put("coupon_expDate", today);
		return sqlSession.selectOne(MAPPER+".selectCouponCount", map);
	}
	
	
	//쿠폰리스트 불러오기
	public List<CouponVo> selectCouponList(int member_idx,Date today) {
		Map<String, Object> map = new HashMap<>();
		map.put("member_idx", member_idx);
		map.put("coupon_expDate", today);
		return sqlSession.selectList(MAPPER+".selectCouponList", map);
	}
	
	//사용한 쿠폰 삭제
	public int deleteCoupon(String coupon_idx){
		return sqlSession.delete(MAPPER+".deleteCoupon",coupon_idx);
	}
	
	//주문상품 테이블 등록
	public int insertProductOut(String order_idx, String product_idx, String product_out_count) {		
		Map<String, String> map = new HashMap<>();
		map.put("order_idx", order_idx);
		map.put("product_idx", product_idx);
		map.put("product_out_count", product_out_count);
		return sqlSession.insert(MAPPER+".insertProductOut",map);
	}	
	
	//상품출고 상태 업데이트
	public int updateProductOutStatus(int order_idx, int product_idx) {
		Map<String, Object> map = new HashMap<>();
		map.put("order_idx", order_idx);		
	    map.put("product_idx", product_idx);
		return sqlSession.update(MAPPER+".updateProductOutStatus", map);
	}		
	
	//환불전 상태 수 불러오기
	public int selectCountProductOutStatus(String order_idx) {
		return sqlSession.selectOne(MAPPER+".selectCountProductOutStatus", order_idx);
	}
}
