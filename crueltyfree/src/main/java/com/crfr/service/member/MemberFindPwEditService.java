package com.crfr.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.MemberDao;
import com.crfr.vo.MemberVo;

@Service("mFind_pw_edit")
	public class MemberFindPwEditService implements MemberService{
		private MemberDao dao;
		
		@Autowired
		public MemberFindPwEditService(MemberDao dao) {
			this.dao = dao;
		}
		
		public MemberVo find_pw_edit(MemberVo memberVo) {
			
			return dao.find_pw_edit(memberVo);
		}
		
	}
