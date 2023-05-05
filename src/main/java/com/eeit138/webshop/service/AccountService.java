package com.eeit138.webshop.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.eeit138.webshop.model.AccountBean;

public interface AccountService {
	AccountBean save(AccountBean ac);
	
	List<AccountBean> findAll();
	
	AccountBean findById(Integer id);
	
	AccountBean findByAc(String ac);
	
	AccountBean findTop1ByOrderByAddedDesc();
	
	void deleteById(Integer id);

	Page<AccountBean> findByPage(Integer pageNumber);
}
