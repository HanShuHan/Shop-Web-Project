package com.eeit138.webshop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eeit138.webshop.model.FixedBean;

@Repository
public interface FixedRepository extends JpaRepository<FixedBean, Integer> {
	public FixedBean findFirstByfixedOnOff(Integer fixedOnOff);
}
