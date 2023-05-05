package com.eeit138.webshop.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.eeit138.webshop.model.ProductBean;


@Repository
public interface ProducRepository extends JpaRepository<ProductBean, Integer>{
	
	@Query(value = "select * from Products where name like '%'+:nameLike+'%' and price >= :priceLowerBound and price <= :priceUpperBound", nativeQuery = true)
	List<ProductBean> findAllByNameLikeAndPriceBoundaries(
			@Param(value = "nameLike") String nameLike,
			@Param(value = "priceLowerBound") String priceLowerBound,
			@Param(value = "priceUpperBound") String priceUpperBound);
	
	@Query(value = "select * from Products where name like '%'+:nameLike+'%' and price >= :priceLowerBound and price <= :priceUpperBound order by price asc", nativeQuery = true)
	List<ProductBean> findAllByNameLikeAndPriceBoundariesOrderByPriceAsc(
			@Param(value = "nameLike") String nameLike,
			@Param(value = "priceLowerBound") String priceLowerBound,
			@Param(value = "priceUpperBound") String priceUpperBound);
	
	@Query(value = "select * from Products where name like '%'+:nameLike+'%' and price >= :priceLowerBound and price <= :priceUpperBound order by price desc", nativeQuery = true)
	List<ProductBean> findAllByNameLikeAndPriceBoundariesOrderByPriceDesc(
			@Param(value = "nameLike") String nameLike,
			@Param(value = "priceLowerBound") String priceLowerBound,
			@Param(value = "priceUpperBound") String priceUpperBound);
	
	List<ProductBean>findTop9ByOrderByAddedTimeDesc();
	
	List<ProductBean>findTop5ByOrderByAddedTimeDesc();
	
	List<ProductBean>findAllByOrderByAddedTimeDesc();
	
	List<ProductBean> findByType(String type);
	
	@Query(value = "select * from Products where (type = :type1 or type = :type2 or type = :type3 or type = :type4) and name like '%'+:nameLike+'%' and price >= :priceLowerBound and price <= :priceUpperBound", nativeQuery = true)
	List<ProductBean> findByTypesAndNameLikeAndPriceBoundaries(
			@Param(value = "type1") String type1,
			@Param(value = "type2") String type2,
			@Param(value = "type3") String type3,
			@Param(value = "type4") String type4,
			@Param(value = "nameLike") String nameLike,
			@Param(value = "priceLowerBound") String priceLowerBound,
			@Param(value = "priceUpperBound") String priceUpperBound);
	
	@Query(value = "select * from Products where (type = :type1 or type = :type2 or type = :type3 or type = :type4) and name like '%'+:nameLike+'%' and price >= :priceLowerBound and price <= :priceUpperBound order by price asc", nativeQuery = true)
	List<ProductBean> findByTypesAndNameLikeAndPriceBoundariesOrderByPriceAsc(
			@Param(value = "type1") String type1,
			@Param(value = "type2") String type2,
			@Param(value = "type3") String type3,
			@Param(value = "type4") String type4,
			@Param(value = "nameLike") String nameLike,
			@Param(value = "priceLowerBound") String priceLowerBound,
			@Param(value = "priceUpperBound") String priceUpperBound);
	
	@Query(value = "select * from Products where (type = :type1 or type = :type2 or type = :type3 or type = :type4) and name like '%'+:nameLike+'%' and price >= :priceLowerBound and price <= :priceUpperBound order by price desc", nativeQuery = true)
	List<ProductBean> findByTypesAndNameLikeAndPriceBoundariesOrderByPriceDesc(
			@Param(value = "type1") String type1,
			@Param(value = "type2") String type2,
			@Param(value = "type3") String type3,
			@Param(value = "type4") String type4,
			@Param(value = "nameLike") String nameLike,
			@Param(value = "priceLowerBound") String priceLowerBound,
			@Param(value = "priceUpperBound") String priceUpperBound);
	
	
}
	