package com.eeit138.webshop.service;
import java.util.List;

import com.eeit138.webshop.model.ProductBean;


public interface ProductService {

	ProductBean save(ProductBean product);
	
	ProductBean updateProductStatus(ProductBean product);
	
	List<ProductBean> findAllByNameLikeAndPriceBoundaries(String nameLike, String priceLowerBound, String priceUpperBound);

	List<ProductBean> findAllByNameLikeAndPriceBoundariesOrderByPriceAsc(String nameLike, String priceLowerBound, String priceUpperBound);

	List<ProductBean> findAllByNameLikeAndPriceBoundariesOrderByPriceDesc(String nameLike, String priceLowerBound, String priceUpperBound);
	
	List<ProductBean> findByTypesAndNameLikeAndPriceBoundaries(String type1, String type2, String type3, String type4, String nameLike, String priceLowerBound, String priceUpperBound);

	List<ProductBean> findByTypesAndNameLikeAndPriceBoundariesOrderByPriceAsc(String type1, String type2, String type3, String type4, String nameLike, String priceLowerBound, String priceUpperBound);
	
	List<ProductBean> findByTypesAndNameLikeAndPriceBoundariesOrderByPriceDesc(String type1, String type2, String type3, String type4, String nameLike, String priceLowerBound, String priceUpperBound);

	List<ProductBean> findAll();
	
	List<ProductBean> findTop9ByOrderByAddedTimeDesc();
	
	List<ProductBean> findTop5ByOrderByAddedTimeDesc();
	
	List<ProductBean>findAllByOrderByAddedTimeDesc();
	
	ProductBean findById(Integer id);
	
	void deleteById(Integer id);
	
	List<ProductBean> findByType(String type);
}
