package service.membership;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import dao.MembershipDao;

@Service("mDrop_out")
public class MembershipDropOutService implements MembershipService{
	private MembershipDao dao;
	
	@Autowired
	public MembershipDropOutService(MembershipDao dao) {
		this.dao = dao;
	}
	
	public int drop_out(int member_idx) {
		
		return dao.drop_out(member_idx);
	}
	
}
