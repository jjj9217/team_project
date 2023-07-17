package service.membership;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MembershipDao;
import vo.MembershipVo;

@Service("mAdmin_member_edit")
public class MembershipAdminMemberEditService implements MembershipService{
	private MembershipDao dao;
	
	@Autowired
	public MembershipAdminMemberEditService(MembershipDao dao) {
		this.dao = dao;
	}
	
	public MembershipVo member_edit(MembershipVo vo) {
		
		return dao.member_edit(vo);
	}
	
}
