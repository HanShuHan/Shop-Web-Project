package com.eeit138.webshop.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.eeit138.webshop.model.CartList;
import com.eeit138.webshop.model.ProductBean;

@Repository
public interface CartListRepository extends JpaRepository<CartList, Integer>{

	public CartList findByProduct(ProductBean product);
	
	public List<CartList> findAllByProduct(ProductBean product);
	
	@Query(value = "select * from Cart_Lists where product_id = :productId and account_id = :accountId", nativeQuery = true)
	CartList findByProductIdAndAccountId(@Param(value = "productId") Integer productId, @Param(value = "accountId") Integer userId);

	List<CartList> findByAccountId(Integer id);
	
	void deleteByAccountId(Integer id);
}
