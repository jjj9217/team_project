package com.crfr.service.manager;

import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;
import com.crfr.vo.OneInqVo;

import lombok.RequiredArgsConstructor;

@Service("oneUpdate")
@RequiredArgsConstructor
public class OneUpdateService implements ManagerService {
	private final ManagerDao dao;
	
	public int oneinqUpdate(String one_inq_answer, 
			String one_inq_idx) {
		
		OneInqVo vo = new OneInqVo();
		vo.setOne_inq_answer(one_inq_answer);
		vo.setOne_inq_idx(Integer.parseInt(one_inq_idx));

		
		return dao.oneinqUpdate(vo);
	}
	

}
