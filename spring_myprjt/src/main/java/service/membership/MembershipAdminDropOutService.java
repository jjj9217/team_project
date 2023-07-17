package service.membership;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import dao.MembershipDao;

@Service("mAdmin_drop_out")
public class MembershipAdminDropOutService implements MembershipService{
	private MembershipDao dao;
	
	@Autowired
	public MembershipAdminDropOutService(MembershipDao dao) {
		this.dao = dao;
	}
	
	public int admin_drop_out(int member_idx) {
		
		return dao.admin_drop_out(member_idx);
	}
	
}
