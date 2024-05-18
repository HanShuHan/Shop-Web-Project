package com.eeit138.webshop.controller;

import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eeit138.webshop.model.CouponBean;
import com.eeit138.webshop.model.FixedBean;
import com.eeit138.webshop.model.PercentageBean;
import com.eeit138.webshop.service.DiscountsService;


@Controller
public class DiscountsPageController {

	private Blob fixedPhoto;
	
	@Autowired
	private DiscountsService service;
	
	//所有新增
	@GetMapping("/addDiscounts")
	public String addDiscounts() {
		return "addDiscounts";
	}
	//所有列表
	@GetMapping("/viewDiscounts")
	public String viewDiscounts(HttpSession session) {
		if (session.getAttribute("ad") == null) {
			return "redirect:/admin/login";
		}
		
		return "b_discount_index";
	}
	
//	----------------------------------------------------------------------------------------
//	新增固定金額
	@GetMapping("/addFixeds")	
		public ModelAndView addFixedPage(ModelAndView mav) {
			
			mav.setViewName("b_discount_add_f");
			FixedBean FixedBean = new FixedBean();			
			mav.getModel().put("fixeds", FixedBean);
			
			return mav;
		}
//	新增%數	
	@GetMapping("/addPercentages")	
	public ModelAndView addPercentagePage(ModelAndView mav) {
		
		mav.setViewName("b_discount_add_p");
		PercentageBean msg = new PercentageBean();			
		mav.getModel().put("percentages", msg);
		
		return mav;
	}
//	新增優惠券	
	@GetMapping("/addCoupons")	
	public ModelAndView addCouponPage(ModelAndView mav) {
		
		mav.setViewName("b_discount_add_c");
		CouponBean msg = new CouponBean();			
		mav.getModel().put("coupons", msg);
		
		return mav;
	}
	
//	----------------------------------------------------------------------------------------
//	查看固定金額		
	@GetMapping("/viewFixeds")
	public ModelAndView viewFixedPage(ModelAndView mav,@RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
		mav.setViewName("b_discount_index_f");
		Page<FixedBean> page = service.FixedFindByPage(pageNumber);
		
		mav.getModel().put("page", page);
		
		return mav;
	}
//	查看%數	
	@GetMapping("/viewPercentages")
	public ModelAndView viewPercentagePage(ModelAndView mav,@RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
		mav.setViewName("b_discount_index_p");
		Page<PercentageBean> page = service.PercentageFindByPage(pageNumber);
		
		mav.getModel().put("page", page);
		
		return mav;
	}
//	查看優惠券	
	@GetMapping("/viewCoupons")
	public ModelAndView viewCouponPage(ModelAndView mav,@RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
		mav.setViewName("b_discount_index_c");
		Page<CouponBean> page = service.CouponFindByPage(pageNumber);
		
		mav.getModel().put("page", page);
		
		return mav;
	}

//	----------------------------------------------------------------------------------------
//  修改固定金額	
	@GetMapping("/updateFixeds")
	public ModelAndView updateFixeds(ModelAndView mav, @RequestParam(name = "id") Integer id) {
		
		FixedBean msg = service.FixedFindById(id);
		fixedPhoto = msg.getFixedPhoto();
		
		mav.getModel().put("fixeds", msg);
		mav.setViewName("b_discount_update_f");

		return mav;
	}
//	修改固定金額	
	@PostMapping("/updateFixeds")
	public ModelAndView updateFixeds(ModelAndView mav, @Valid @ModelAttribute(name="fixeds") FixedBean msg, BindingResult result) {

		if(msg.getFixedImage().isEmpty())
			msg.setFixedPhoto(fixedPhoto);
		
		else {
			
			try {
				SerialBlob blob = new SerialBlob(msg.getFixedImage().getBytes());
				msg.setFixedPhoto(blob);
				
			} catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		
		if(!result.hasErrors()) {
			 service.FixedInsert(msg);
			 mav.setViewName("redirect:/viewFixeds");
		}
		
		return mav;
	}
//  修改%數	
	@GetMapping("/updatePercentages")
	public ModelAndView updatePercentages(ModelAndView mav, @RequestParam(name = "id") Integer id) {
		PercentageBean msg = service.PercentageFindById(id);

		mav.getModel().put("percentages", msg);
		
		mav.setViewName("b_discount_update_p");

		return mav;
	}
//  修改優惠券		
	@GetMapping("/updateCoupons")
	public ModelAndView updateCoupons(ModelAndView mav, @RequestParam(name = "id") Integer id) {
		CouponBean msg = service.CouponFindById(id);

		mav.getModel().put("coupons", msg);
		
		mav.setViewName("b_discount_update_c");

		return mav;
	}

//	----------------------------------------------------------------------------------------
//  固定金額照片	
	@GetMapping("/showImageFixed/{fixedId}")
	public ResponseEntity<byte[]> showImageFixed(@PathVariable("fixedId") Integer id,
											HttpServletRequest request){
		FixedBean fixed = service.FixedFindById(id);
		
		byte[]imageBytes = null;
		Blob blob = fixed.getFixedPhoto();
		
		try {
			imageBytes = blob.getBytes(1, (int)blob.length());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<byte[]>(imageBytes,HttpStatus.OK);
	}
//  %數固定金額照片	
	@GetMapping("/showImagePercentage/{percentageId}")
	public ResponseEntity<byte[]> showImagePercentage(@PathVariable("percentageId") Integer id,
											HttpServletRequest request){
		PercentageBean fixed = service.PercentageFindById(id);
		
		byte[]imageBytes = null;
		Blob blob = fixed.getPercentagePhoto();
		
		try {
			imageBytes = blob.getBytes(1, (int)blob.length());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<byte[]>(imageBytes,HttpStatus.OK);
	}
}








