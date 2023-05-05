package com.eeit138.webshop.service;

import java.util.List;

import com.eeit138.webshop.model.CartList;
import com.eeit138.webshop.model.ProductBean;

public interface CartListService {

	CartList save(CartList cartList);
	
	List<CartList> findAll();
	
	CartList findById(Integer id);
	
	CartList findByProduct(ProductBean product);
	
	List<CartList> findAllByProduct(ProductBean product);
	
	void deleteById(Integer id);

	CartList findByProductIdAndAccountId(Integer id, Integer userId);

	List<CartList> findByAccountId(Integer id);

	void deleteByAccountId(Integer id);
}
