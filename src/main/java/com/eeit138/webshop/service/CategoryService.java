package com.eeit138.webshop.service;

import java.util.List;

import com.eeit138.webshop.model.Category;


public interface CategoryService {
	
	List<Category> findAll();
	
	Category findById(Integer id);
}
