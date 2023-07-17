package service.membership;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import dao.MembershipDao;

@Service("mCheckNickname")
public class MembershipCheckNicknameService implements MembershipService{
	private MembershipDao dao;
	
	@Autowired
	public MembershipCheckNicknameService(MembershipDao dao) {
		this.dao = dao;
	}
	
	public int checkNickname(String member_nickname) {
		
		return dao.checkNickname(member_nickname);
	}
	
}
