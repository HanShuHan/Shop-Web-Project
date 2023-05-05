package com.eeit138.webshop.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eeit138.webshop.model.CouponBean;
import com.eeit138.webshop.service.DiscountsService;


@Controller
public class CouponController {
	
	@Autowired
	private DiscountsService service;
	
//	新增優惠券
	@PostMapping(value = "/addCoupons")
	public ModelAndView addCoupons(ModelAndView mav, @Valid @ModelAttribute(name = "coupons") CouponBean msg,
			BindingResult rs) {
		
		if (!rs.hasErrors()) {
			service.CouponInsert(msg);
			CouponBean newMsg = new CouponBean();
			mav.getModel().put("coupons", newMsg);
			
		}
		
		mav.setViewName("redirect:/viewCoupons");

		return mav;
	}

//	修改優惠券	
	@PostMapping("/updateCoupons")
	public ModelAndView updateCoupons(ModelAndView mav, @Valid @ModelAttribute(name="coupons") CouponBean msg, BindingResult result) {

		if(!result.hasErrors()) {
			 service.CouponInsert(msg);
			 mav.setViewName("redirect:/viewCoupons");
		}
		
		return mav;
	}

//	刪除優惠券	
	@GetMapping("/deleteCoupons")
	public ModelAndView deleteCoupons(ModelAndView mav, @RequestParam(name = "id") Integer id) {
			 service.CouponDelete(id);
			 mav.setViewName("redirect:/viewCoupons");
		
		return mav;
	}
}
