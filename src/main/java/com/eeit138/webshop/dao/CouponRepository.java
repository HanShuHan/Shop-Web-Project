package com.eeit138.webshop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eeit138.webshop.model.CouponBean;

@Repository
public interface CouponRepository extends JpaRepository<CouponBean, Integer> {
	public CouponBean findFirstByCouponOnOff(Integer couponOnOff);
}
