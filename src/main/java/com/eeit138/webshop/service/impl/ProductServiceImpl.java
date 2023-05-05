package com.eeit138.webshop.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eeit138.webshop.dao.ProducRepository;
import com.eeit138.webshop.model.ProductBean;
import com.eeit138.webshop.service.CategoryService;
import com.eeit138.webshop.service.ProductService;
import com.eeit138.webshop.service.ProductStatusService;

@Transactional
@Service
public class ProductServiceImpl implements ProductService {

	private ProducRepository productDao;
	private CategoryService categoryService;
	private ProductStatusService productStatusService;
	
	@Autowired
	public ProductServiceImpl(ProducRepository productDao,
							  CategoryService categoryService,
							  ProductStatusService productStatusService) {
		
		this.productDao = productDao;
		this.categoryService = categoryService;
		this.productStatusService = productStatusService;
	}

	@Override
	public ProductBean save(ProductBean product) {
		
		Integer categoryId = product.getCategoryId();
		product.setCategory(categoryService.findById(categoryId));
		Integer statusId = product.getProductStatusId();
		product.setProductStatus(productStatusService.findById(statusId));
		return productDao.save(product);
	}

	@Override
	public List<ProductBean> findAll() {

		return productDao.findAll();
	}
	
	@Override
	public List<ProductBean> findTop9ByOrderByAddedTimeDesc() {

		return productDao.findTop9ByOrderByAddedTimeDesc();
	}
	
	@Override
	public List<ProductBean> findTop5ByOrderByAddedTimeDesc() {

		return productDao.findTop5ByOrderByAddedTimeDesc();
	}

	@Override
	public List<ProductBean> findAllByOrderByAddedTimeDesc() {
		// TODO Auto-generated method stub
		return productDao.findAllByOrderByAddedTimeDesc();
	}
	
	@Override
	public ProductBean findById(Integer id) {
		
		return productDao.findById(id).get();
	}

	@Override
	public void deleteById(Integer id) {

		ProductBean product = productDao.findById(id).get();
		product.setCategory(null);
		productDao.deleteById(id);
	}

	@Override
	public List<ProductBean> findByType(String type) {
		return productDao.findByType(type);
	}
	
	@Override
	public List<ProductBean> findAllByNameLikeAndPriceBoundaries(String nameLike, String priceLowerBound, String priceUpperBound) {
		// TODO Auto-generated method stub
		return productDao.findAllByNameLikeAndPriceBoundaries(nameLike, priceLowerBound, priceUpperBound);
	}
	
	@Override
	public List<ProductBean> findAllByNameLikeAndPriceBoundariesOrderByPriceAsc(String nameLike, String priceLowerBound,
			String priceUpperBound) {
		// TODO Auto-generated method stub
		return productDao.findAllByNameLikeAndPriceBoundariesOrderByPriceAsc(nameLike, priceLowerBound, priceUpperBound);
	}
	
	@Override
	public List<ProductBean> findAllByNameLikeAndPriceBoundariesOrderByPriceDesc(String nameLike, String priceLowerBound,
			String priceUpperBound) {
		// TODO Auto-generated method stub
		return productDao.findAllByNameLikeAndPriceBoundariesOrderByPriceDesc(nameLike, priceLowerBound, priceUpperBound);
	}
	
	@Override
	public List<ProductBean> findByTypesAndNameLikeAndPriceBoundaries(String type1, String type2, String type3,
			String type4, String nameLike, String priceLowerBound, String priceUpperBound) {
		// TODO Auto-generated method stub
		return productDao.findByTypesAndNameLikeAndPriceBoundaries(type1, type2, type3, type4, nameLike, priceLowerBound, priceUpperBound);
	}

	@Override
	public List<ProductBean> findByTypesAndNameLikeAndPriceBoundariesOrderByPriceAsc(String type1, String type2,
			String type3, String type4, String nameLike, String priceLowerBound, String priceUpperBound) {
		// TODO Auto-generated method stub
		return productDao.findByTypesAndNameLikeAndPriceBoundariesOrderByPriceAsc(type1, type2, type3, type4, nameLike, priceLowerBound, priceUpperBound);
	}
	
	@Override
	public List<ProductBean> findByTypesAndNameLikeAndPriceBoundariesOrderByPriceDesc(String type1, String type2,
			String type3, String type4, String nameLike, String priceLowerBound, String priceUpperBound) {
		// TODO Auto-generated method stub
		return productDao.findByTypesAndNameLikeAndPriceBoundariesOrderByPriceDesc(type1, type2, type3, type4, nameLike, priceLowerBound, priceUpperBound);
	}
	
	@Override
	public ProductBean updateProductStatus(ProductBean product) {
		
		return productDao.save(product);
	}


}
