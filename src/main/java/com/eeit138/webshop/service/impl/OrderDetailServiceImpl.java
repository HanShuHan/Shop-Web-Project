package com.eeit138.webshop.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eeit138.webshop.dao.OrderDetailRepository;
import com.eeit138.webshop.model.OrderDetail;
import com.eeit138.webshop.model.ProductBean;
import com.eeit138.webshop.service.OrderDetailService;

@Service
@Transactional
public class OrderDetailServiceImpl implements OrderDetailService {

	private OrderDetailRepository dao;
	
	@Autowired
	public OrderDetailServiceImpl(OrderDetailRepository dao) {
		this.dao = dao;
	}

	@Override
	public OrderDetail save(OrderDetail OrderDetail) {
		return dao.save(OrderDetail);
	}
	
	@Override
	public OrderDetail findByProduct(ProductBean product) {
		return dao.findByProduct(product);
	}
	
	@Override
	public List<OrderDetail> findAllByProduct(ProductBean product) {
		return dao.findAllByProduct(product);
	}

	@Override
	public List<OrderDetail> findAll() {
		return dao.findAll();
	}

	@Override
	public OrderDetail findById(Integer id) {
		return dao.findById(id).get();
	}

	@Override
	public void deleteById(Integer id) {
		dao.deleteById(id);
	}
	
	@Override
	public void deleteByAccountId(Integer id) {
		dao.deleteByAccountId(id);
	}
	
	@Override
	public void deleteByOrderid(String id) {
		dao.deleteByOrderid(id);
	}

	@Override
	public OrderDetail findByProductIdAndAccountId(Integer productId, Integer userId) {
		return dao.findByProductIdAndAccountId(productId, userId);
	}

	@Override
	public List<OrderDetail> findByAccountId(Integer id) {
		return dao.findByAccountId(id);
	}
	
	@Override
	public List<OrderDetail> findByOrderid(String id) {
		return dao.findByOrderid(id);
	}



}
