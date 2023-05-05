package com.eeit138.webshop.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.eeit138.webshop.dao.AccountRepository;
import com.eeit138.webshop.model.AccountBean;
import com.eeit138.webshop.service.AccountService;

@Transactional
@Service
public class AccountServiceImpl implements AccountService {

	private AccountRepository dao;
	
	@Autowired
	public AccountServiceImpl(AccountRepository dao) {
		this.dao = dao;
	}

	@Override
	public AccountBean save(AccountBean ac) {
		return dao.save(ac);
	}

	@Override
	public List<AccountBean> findAll() {
		return dao.findAll();
	}

	@Override
	public AccountBean findById(Integer id) {
		return dao.findById(id).get();
	}

	@Override
	public void deleteById(Integer id) {
		dao.deleteById(id);
	}
	
	@Override
	public AccountBean findByAc(String ac) {
		return dao.findByAc(ac);
	}
	
	@Override
	public Page<AccountBean> findByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber -1, 100, Sort.Direction.DESC,"Acid");
		
		return dao.findAll(pgb);
	}

	@Override
	public AccountBean findTop1ByOrderByAddedDesc() {
		// TODO Auto-generated method stub
		return dao.findTop1ByOrderByAddedDesc();
	}

}
