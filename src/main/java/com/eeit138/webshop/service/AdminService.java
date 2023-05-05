package com.eeit138.webshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.eeit138.webshop.dao.AdminRepository;
import com.eeit138.webshop.model.AdminBean;



@Service
public class AdminService {
	
	@Autowired
	private AdminRepository dao;
	
	public AdminBean insert(AdminBean AdminBean) {
		return dao.save(AdminBean);
	}
	
	public AdminBean findByAc(String ac) {
		return dao.findByAc(ac);
	}
	
	public AdminBean findById(Integer id) {
		Optional<AdminBean> op = dao.findById(id);
	    
		if(op.isPresent()) {
			return op.get();
		}
		  
		  return null;
	}
	
	public void delete(Integer id) {
		dao.deleteById(id);
	}
	
	public List<AdminBean> findAll(){
		List<AdminBean> AdminBeans = dao.findAll();
		
		return AdminBeans;
	}
	public AdminBean update(AdminBean AdminBean){
		AdminBean a = dao.save(AdminBean);
		
		return a;
	}
	
	public Page<AdminBean> findByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber -1, 100, Sort.Direction.DESC,"id");
		
		return dao.findAll(pgb);
	}


	public Page<AdminBean> findAll(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber -1, 3, Sort.Direction.DESC,"added");
		
		return dao.findAll(pgb);
	}




	


}
