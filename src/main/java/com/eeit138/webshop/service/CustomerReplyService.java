package com.eeit138.webshop.service;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.eeit138.webshop.dao.CustomerBeanRepository;
import com.eeit138.webshop.model.CustomerBean;




@Service
public class CustomerReplyService {
	
	@Autowired
	private CustomerBeanRepository dao;

	
	public void save(CustomerBean reply) {
		dao.save(reply);
	}
	
	
	
	public CustomerBean findById(Integer id) {
		Optional<CustomerBean> op = dao.findById(id);
	    
		if(op.isPresent()) {
			return op.get();
		}
		  
		  return null;
	}
	
	
	public void delete(Integer id) {
		dao.deleteById(id);
	}
	
	
	public List<CustomerBean> findAll(){
		List<CustomerBean> messages = dao.findAll();
		
		return messages;
	}
	
	public Page<CustomerBean> findByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber -1, 8, Sort.Direction.DESC,"added");
		
		return dao.findAll(pgb);
	}
	
	public List<CustomerBean> findByAcidOrderByAddedDesc(Integer acid){
		List<CustomerBean> replys = dao.findByAcidOrderByAddedDesc(acid);
		return replys;
	}
	
	public void savereply(int acid, int id) {
		dao.savereply(acid, id);
	};

}
