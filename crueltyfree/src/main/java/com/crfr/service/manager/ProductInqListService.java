package com.crfr.service.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;
import com.crfr.vo.ProductInqVo;

@Service("proinqList")
public class ProductInqListService implements ManagerService {
	private final ManagerDao dao;

	@Autowired
	public ProductInqListService(ManagerDao dao) {
		this.dao = dao;
	}

	public List<ProductInqVo> productinqList() {

		return dao.productinqList();
	}
}
