package com.crfr.service.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;

@Service("mUpdateMemberGrade")
public class MemberUpdateGradeService implements ManagerService {
	private ManagerDao dao;
	
	@Autowired
	public MemberUpdateGradeService(ManagerDao dao) {
		this.dao = dao;
	}

	public void updateMemberGrade(int member_idx) {
		dao.updateMemberGrade(member_idx);
	}
}