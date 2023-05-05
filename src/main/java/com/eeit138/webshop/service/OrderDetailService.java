package com.eeit138.webshop.service;

import java.util.List;

import com.eeit138.webshop.model.OrderDetail;
import com.eeit138.webshop.model.ProductBean;

public interface OrderDetailService {

	OrderDetail save(OrderDetail OrderDetail);
	
	void deleteByOrderid(String id);
	
	List<OrderDetail> findAll();
	
	OrderDetail findById(Integer id);
	
	OrderDetail findByProduct(ProductBean product);
	
	List<OrderDetail> findAllByProduct(ProductBean product);
	
	void deleteById(Integer id);

	OrderDetail findByProductIdAndAccountId(Integer id, Integer userId);

	List<OrderDetail> findByAccountId(Integer id);
	
	List<OrderDetail> findByOrderid(String id);

	void deleteByAccountId(Integer id);
}
