package com.eeit138.webshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.eeit138.webshop.dao.CouponRepository;
import com.eeit138.webshop.dao.FixedRepository;
import com.eeit138.webshop.dao.PercentageRepository;
import com.eeit138.webshop.model.CouponBean;
import com.eeit138.webshop.model.FixedBean;
import com.eeit138.webshop.model.PercentageBean;


@Service
public class DiscountsService {
	
	@Autowired
	private FixedRepository FixedDao;
	@Autowired
	private PercentageRepository PercentageDao;
	@Autowired
	private CouponRepository CouponDao;
	
//	----------------------------------------------------------------------------------------
	
	public void FixedInsert(FixedBean messages) {
		FixedDao.save(messages);
	}
	
	public void PercentageInsert(PercentageBean messages) {
		PercentageDao.save(messages);
	}
	
	public void CouponInsert(CouponBean messages) {
		CouponDao.save(messages);
	}
	
//	----------------------------------------------------------------------------------------
	
	public FixedBean FixedFindById(Integer id) {
		Optional<FixedBean> op = FixedDao.findById(id);
	    
		if(op.isPresent()) {
			return op.get();
		}
		  
		  return null;
	}
	
	public PercentageBean PercentageFindById(Integer id) {
		Optional<PercentageBean> op = PercentageDao.findById(id);
	    
		if(op.isPresent()) {
			return op.get();
		}
		  
		  return null;
	}
	
	public CouponBean CouponFindById(Integer id) {
		Optional<CouponBean> op = CouponDao.findById(id);
	    
		if(op.isPresent()) {
			return op.get();
		}
		  
		  return null;
	}
	
//	----------------------------------------------------------------------------------------
	
	public void FixedDelete(Integer id) {
		FixedDao.deleteById(id);
	}
	
	public void PercentageDelete(Integer id) {
		PercentageDao.deleteById(id);
	}
	
	public void CouponDelete(Integer id) {
		CouponDao.deleteById(id);
	}

//	----------------------------------------------------------------------------------------
	
	public List<FixedBean> FixedFindAllMessages(){
		List<FixedBean> messages = FixedDao.findAll();
		
		return messages;
	}
	
	public List<PercentageBean> PercentageFindAllMessages(){
		List<PercentageBean> messages = PercentageDao.findAll();
		
		return messages;
	}
	
	public List<CouponBean> CouponFindAllMessages(){
		List<CouponBean> messages = CouponDao.findAll();
		
		return messages;
	}

//	----------------------------------------------------------------------------------------
	
	public Page<FixedBean> FixedFindByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber -1, 999, Sort.Direction.DESC,"fixedId");
		
		return FixedDao.findAll(pgb);
	}
	
	public Page<PercentageBean> PercentageFindByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber -1, 999, Sort.Direction.DESC,"percentageId");
		
		return PercentageDao.findAll(pgb);
	}
	
	public Page<CouponBean> CouponFindByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber -1, 999, Sort.Direction.DESC,"couponId");
		
		return CouponDao.findAll(pgb);
	}
	
	public FixedBean findFirstByfixedOnOff(Integer fixedOnOff) {
		FixedBean FixedBean = FixedDao.findFirstByfixedOnOff(fixedOnOff);
		return FixedBean;
	}
	public PercentageBean findFirstByPercentageOnOff(Integer percentageOnOff) {
		PercentageBean PercentageBean = PercentageDao.findFirstByPercentageOnOff(percentageOnOff);
		return PercentageBean;
	}
	public CouponBean findFirstByCouponOnOff(Integer CouponOnOff) {
		CouponBean CouponBean = CouponDao.findFirstByCouponOnOff(CouponOnOff);
		return CouponBean;
	}

}
