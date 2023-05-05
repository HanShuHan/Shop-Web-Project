package com.eeit138.webshop.service.impl;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eeit138.webshop.dao.ProducRepository;
import com.eeit138.webshop.dao.ReceiptRepository;
import com.eeit138.webshop.model.Receipt;
import com.eeit138.webshop.service.ReceiptService;

@Transactional
@Service
public class ReceiptServiceImpl implements ReceiptService {

	private ReceiptRepository receiptDao;
	
	@Autowired
	public ReceiptServiceImpl(ProducRepository productDao,
							  ReceiptRepository receiptDao) {
		
		this.receiptDao = receiptDao;
	}

	@Override
	public Receipt save(Receipt receipt) {
		return receiptDao.save(receipt);
	}
	
	@Override
	public Receipt findById(Integer id) {
		return receiptDao.findById(id).get();
	}

}
