package com.crfr.service.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crfr.dao.ManagerDao;
import com.crfr.vo.ProductVo;

@Service("proList")
public class ProductListService implements ManagerService {
	private final ManagerDao dao;

	@Autowired
	public ProductListService(ManagerDao dao) {
		this.dao = dao;
	}

	public List<ProductVo> productList() {

		return dao.productList();
	}
}
