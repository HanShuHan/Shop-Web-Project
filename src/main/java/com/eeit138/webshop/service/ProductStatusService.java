package com.eeit138.webshop.service;

import java.util.List;

import com.eeit138.webshop.model.ProductStatus;


public interface ProductStatusService {
	
	List<ProductStatus> findAll();
	
	ProductStatus findById(Integer id);
}
