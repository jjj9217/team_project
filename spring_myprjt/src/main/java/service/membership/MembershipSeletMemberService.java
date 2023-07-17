package service.membership;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MembershipDao;

@Service("mSelectMember")
public class MembershipSeletMemberService implements MembershipService{
	private MembershipDao dao;
	
	@Autowired
	public MembershipSeletMemberService(MembershipDao dao) {
		this.dao = dao;
	}
	
	public int selectMember(Map<String, Object> map) {
		
		return dao.selectMember(map);
	}
	
}
