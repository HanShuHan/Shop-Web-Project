package com.eeit138.webshop.dao;



import org.springframework.data.jpa.repository.JpaRepository;

import com.eeit138.webshop.model.AdminBean;



public interface AdminRepository extends JpaRepository<AdminBean, Integer>{
	AdminBean findByAc(String ac);
}
