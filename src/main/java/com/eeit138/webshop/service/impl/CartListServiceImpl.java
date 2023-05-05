package com.eeit138.webshop.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eeit138.webshop.dao.CartListRepository;
import com.eeit138.webshop.model.CartList;
import com.eeit138.webshop.model.ProductBean;
import com.eeit138.webshop.service.CartListService;

@Service
@Transactional
public class CartListServiceImpl implements CartListService {

	private CartListRepository cartListDao;
	
	@Autowired
	public CartListServiceImpl(CartListRepository cartListDao) {
		this.cartListDao = cartListDao;
	}

	@Override
	public CartList save(CartList cartList) {
		// TODO Auto-generated method stub
		return cartListDao.save(cartList);
	}

	@Override
	public CartList findByProduct(ProductBean product) {
		// TODO Auto-generated method stub
		return cartListDao.findByProduct(product);
	}
	
	@Override
	public List<CartList> findAllByProduct(ProductBean product) {
		// TODO Auto-generated method stub
		return cartListDao.findAllByProduct(product);
	}

	@Override
	public List<CartList> findAll() {
		// TODO Auto-generated method stub
		return cartListDao.findAll();
	}

	@Override
	public CartList findById(Integer id) {
		// TODO Auto-generated method stub
		return cartListDao.findById(id).get();
	}

	@Override
	public void deleteById(Integer id) {
		// TODO Auto-generated method stub
		cartListDao.deleteById(id);
	}
	
	@Override
	public void deleteByAccountId(Integer id) {
		cartListDao.deleteByAccountId(id);
	}

	@Override
	public CartList findByProductIdAndAccountId(Integer productId, Integer userId) {
		// TODO Auto-generated method stub
		return cartListDao.findByProductIdAndAccountId(productId, userId);
	}

	@Override
	public List<CartList> findByAccountId(Integer id) {
		// TODO Auto-generated method stub
		return cartListDao.findByAccountId(id);
	}

}
