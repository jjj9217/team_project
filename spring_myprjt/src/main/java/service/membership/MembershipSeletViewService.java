package service.membership;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MembershipDao;
import vo.MembershipVo;

@Service("mSelectView")
public class MembershipSeletViewService implements MembershipService{
	private MembershipDao dao;
	
	@Autowired
	public MembershipSeletViewService(MembershipDao dao) {
		this.dao = dao;
	}
	
	public MembershipVo selectView(int memeber_idx) {
		
		return dao.selectView(memeber_idx);
	}
	
}
