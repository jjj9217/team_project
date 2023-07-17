package service.membership;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import dao.MembershipDao;

@Service("mCheckId")
public class MembershipCheckIdService implements MembershipService{
	private MembershipDao dao;
	
	@Autowired
	public MembershipCheckIdService(MembershipDao dao) {
		this.dao = dao;
	}
	
	public int checkId(String member_id) {
		
		return dao.checkId(member_id);
	}
	
}
