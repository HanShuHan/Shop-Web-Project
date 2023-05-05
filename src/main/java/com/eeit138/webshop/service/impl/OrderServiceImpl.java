package com.eeit138.webshop.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eeit138.webshop.dao.OrderRepository;
import com.eeit138.webshop.model.OrderBean;
import com.eeit138.webshop.service.OrderService;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

	private OrderRepository dao;
	
	@Autowired
	public OrderServiceImpl(OrderRepository dao) {
		this.dao = dao;
	}

	@Override
	public OrderBean save(OrderBean OrderBean) {
		return dao.save(OrderBean);
	}

	@Override
	public List<OrderBean> findAll() {
		return dao.findAll();
	}

	@Override
	public OrderBean findByMerchantTradeNo(String id) {
		return dao.findByMerchantTradeNo(id);
	}

	@Override
	public void deleteByMerchantTradeNo(String id) {
		dao.deleteByMerchantTradeNo(id);
	}

	@Override
	public List<OrderBean> findByAccountIdOrderByMerchantTradeDateDesc(Integer id) {
		return dao.findByAccountIdOrderByMerchantTradeDateDesc(id);
	}

}
