package com.eeit138.webshop.service.impl;

import java.util.List;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eeit138.webshop.dao.CategoryRepository;
import com.eeit138.webshop.model.Category;
import com.eeit138.webshop.service.CategoryService;


@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryRepository categoryDao;
	
	public CategoryServiceImpl() {
	}

	@Override
	public List<Category> findAll() {
		return categoryDao.findAll();
	}

	@Override
	public Category findById(Integer id) {

		return categoryDao.findById(id).get();
	}

}
