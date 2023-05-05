package com.eeit138.webshop.dao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eeit138.webshop.model.Receipt;

@Repository
public interface ReceiptRepository extends JpaRepository<Receipt, Integer>{

}
