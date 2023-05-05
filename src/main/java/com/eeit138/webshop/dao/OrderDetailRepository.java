package com.eeit138.webshop.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.eeit138.webshop.model.OrderDetail;
import com.eeit138.webshop.model.ProductBean;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Integer>{

	public OrderDetail findByProduct(ProductBean product);
	
	public List<OrderDetail> findAllByProduct(ProductBean product);
	
	@Query(value = "select * from OrderDetail where product_id = :productId and account_id = :accountId", nativeQuery = true)
	OrderDetail findByProductIdAndAccountId(@Param(value = "productId") Integer productId, @Param(value = "accountId") Integer userId);

	List<OrderDetail> findByAccountId(Integer id);
	
	List<OrderDetail> findByOrderid(String id);
	
	void deleteByAccountId(Integer id);
	
	void deleteByOrderid(String id);
}
