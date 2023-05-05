package com.eeit138.webshop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eeit138.webshop.model.AccountBean;

@Repository
public interface AccountRepository extends JpaRepository<AccountBean, Integer>{
	AccountBean findByAc(String ac);
	
	AccountBean findTop1ByOrderByAddedDesc();
}
