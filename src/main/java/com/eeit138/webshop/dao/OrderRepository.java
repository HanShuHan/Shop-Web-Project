package com.eeit138.webshop.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eeit138.webshop.model.OrderBean;

@Repository
public interface OrderRepository extends JpaRepository<OrderBean, Integer>{

	OrderBean findByMerchantTradeNo(String id);

	void deleteByMerchantTradeNo(String id);

	List<OrderBean> findByAccountIdOrderByMerchantTradeDateDesc(Integer id);
}
