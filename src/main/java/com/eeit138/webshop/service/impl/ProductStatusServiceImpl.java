package com.eeit138.webshop.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eeit138.webshop.dao.ProducStatusRepository;
import com.eeit138.webshop.model.ProductStatus;
import com.eeit138.webshop.service.ProductStatusService;

@Service
@Transactional
public class ProductStatusServiceImpl implements ProductStatusService {

	private ProducStatusRepository producStatusDao;
	
	@Autowired
	public ProductStatusServiceImpl(ProducStatusRepository producStatusDao) {
		this.producStatusDao = producStatusDao;
	}

	@Override
	public List<ProductStatus> findAll() {
		return producStatusDao.findAll();
	}

	@Override
	public ProductStatus findById(Integer id) {
		return producStatusDao.findById(id).get();
	}

}
