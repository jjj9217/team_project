package com.crfr.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.crfr.vo.MemberVo;

public class AdminLoginInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		boolean result = true; //Controller로 사용자의 요청이 전달되게 하는 반환값
		HttpSession session = request.getSession();
		MemberVo member = (MemberVo)session.getAttribute("member");
		
		int grade = 10;
		try {
			grade = member.getMember_grade();
		}catch(NullPointerException e) {
			grade = 30;
		}finally {
			
		}			
		
//		System.out.println("관리자로그인 인터셉터 / Member등급번호: "+grade +"\n");
				
		
		if(grade != 2 || grade == 30) {
			//전체회원용(판매자,구매자포함) - 로그인 안되어있으면 로그인창으로 이동
			//판매자용 - 로그인은 했는데, 등급이 1이 아니면 -> 로그인창으로 이동
			//관리자용 - 로그인은 했는데, 등급이 2가 아니면 -> 로그인창으로 이동
			session.invalidate();//세션 초기화
			response.sendRedirect(request.getContextPath()+"/member/login.do");
			result = false; //Controller로 사용자 요청이 전달되지 못하도록 하는 반환값
		}		
		
		
		return result;			
	}
}
