package com.eeit138.webshop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eeit138.webshop.model.PercentageBean;

@Repository
public interface PercentageRepository extends JpaRepository<PercentageBean, Integer> {
	public PercentageBean findFirstByPercentageOnOff(Integer percentageOnOff);
}
