package com.eeit138.webshop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eeit138.webshop.model.ProductStatus;


@Repository
public interface ProducStatusRepository extends JpaRepository<ProductStatus, Integer>{

}
