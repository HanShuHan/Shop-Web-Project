package com.eeit138.webshop.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.eeit138.webshop.model.CustomerBean;

@Repository
public interface CustomerBeanRepository extends JpaRepository<CustomerBean, Integer> {
	@Query(value = "select * from customer_reply where fk_account_acid = :acid Order By Added Desc ", nativeQuery = true)
	public List<CustomerBean> findByAcidOrderByAddedDesc(@Param(value = "acid")int acid);
	
	@Query(value = "UPDATE customer_reply SET fk_account_acid = :acid WHERE id = :id", nativeQuery = true)
	public void savereply(@Param(value = "acid")int acid, @Param(value = "id")int id);
}
