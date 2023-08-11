package com.crfr.service.manager;

import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;
import com.crfr.vo.MemberVo;

import lombok.RequiredArgsConstructor;

@Service("memUpdate")
@RequiredArgsConstructor
public class MemberUpdateService implements ManagerService {
	private final ManagerDao dao;
	
	public int memberUpdate(String member_id, String member_name, String member_gender, String member_grade,
			String member_idx) {
		
		MemberVo vo = new MemberVo();
		vo.setMember_id(member_id);
		vo.setMember_name(member_name);
		vo.setMember_gender(member_gender);
		vo.setMember_grade(Integer.parseInt(member_grade));
		vo.setMember_idx(Integer.parseInt(member_idx));

		
		return dao.memberUpdate(vo);
	}
	

}
