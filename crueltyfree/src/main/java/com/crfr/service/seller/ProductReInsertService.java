package com.crfr.service.seller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.crfr.dao.ProductSellerDao;
import com.crfr.vo.MemberVo;
import com.crfr.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("pReInsertProduct")
@RequiredArgsConstructor
public class ProductReInsertService implements ProductSellerService {
	private final ProductSellerDao dao;
	
	public int reInsertProduct(String product_idx, HttpServletRequest request) {
		int result = 0; //삭제 실패시 반환값
		
		ProductVo vo = dao.findProductPost(product_idx);
		HttpSession session = request.getSession();
		
		//로그인된 회원의 member_idx 얻기
		MemberVo mVo = (MemberVo)session.getAttribute("member");
		int m_idx = mVo.getMember_idx();
		
		if(m_idx == vo.getMember_idx()) {//작성자가 회원 본인인 것을 다시 확인
			result = dao.reInsertProduct(product_idx);
		}
		
		return result;
	}
	

}
