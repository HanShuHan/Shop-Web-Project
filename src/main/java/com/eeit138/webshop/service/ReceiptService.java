package com.eeit138.webshop.service;

import com.eeit138.webshop.model.Receipt;

public interface ReceiptService {

	Receipt save(Receipt receipt);
	Receipt findById(Integer id);
}
