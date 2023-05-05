package com.eeit138.webshop.service;

import java.util.List;

import com.eeit138.webshop.model.OrderBean;

public interface OrderService {

	OrderBean save(OrderBean OrderBean);
	
	List<OrderBean> findAll();
	
	OrderBean findByMerchantTradeNo(String MerchantTradeNo);
	
	void deleteByMerchantTradeNo(String MerchantTradeNo);

	List<OrderBean> findByAccountIdOrderByMerchantTradeDateDesc(Integer id);
}
