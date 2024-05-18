package com.eeit138.webshop.service;

import java.util.List;

import com.eeit138.webshop.model.CartList;
import com.eeit138.webshop.model.ProductBean;

public interface CartListService {

	CartList save(CartList cartList);
		
	CartList findById(Integer id);
	
	CartList findByAccountId(Integer accountId);
	
	CartList findByProduct(ProductBean product);
	
	List<CartList> findAll();
	
	List<CartList> findAllByAccountId(Integer accountId);
	
	List<CartList> findAllByProduct(ProductBean product);
	
	CartList findByAccountIdAndProductId(Integer accountId, Integer productId);
	
	long countByAccountId(Integer accountId);
	
	void deleteById(Integer id);

	CartList findByProductIdAndAccountId(Integer id, Integer userId);

	void deleteByAccountId(Integer id);
}
