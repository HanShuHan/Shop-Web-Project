package com.eeit138.webshop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eeit138.webshop.model.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer>{

}
