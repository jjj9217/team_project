package com.crfr.service.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;
import com.crfr.vo.OneInqVo;
@Service("oneList")
public class OneListService implements ManagerService {
	private final ManagerDao dao;

	@Autowired
	public OneListService(ManagerDao dao) {
		this.dao = dao;
	}

	public List<OneInqVo> getList() {

		return dao.getList();
	}
}