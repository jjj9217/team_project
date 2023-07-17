package service.membership;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MembershipDao;
import vo.MembershipVo;

@Service("mSelectList")
public class MembershipSeletListService implements MembershipService{
	private MembershipDao dao;
	
	@Autowired
	public MembershipSeletListService(MembershipDao dao) {
		this.dao = dao;
	}
	
	public List<MembershipVo> selectList(Map<String, Object> map) {
		
		return dao.selectList(map);
	}
	
}
