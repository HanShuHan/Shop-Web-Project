package com.eeit138.webshop.controller;

import javax.sql.rowset.serial.SerialBlob;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eeit138.webshop.model.PercentageBean;
import com.eeit138.webshop.service.DiscountsService;

@Controller
public class PercentageController {
	
	@Autowired
	private DiscountsService service;
//	新增%數	
	@PostMapping(value = "/addPercentages")
	public ModelAndView addPercentages(ModelAndView mav, @Valid @ModelAttribute(name = "percentages") PercentageBean msg,
			BindingResult rs) {

		try {
			SerialBlob blob = new SerialBlob(msg.getPercentageImage().getBytes());
			msg.setPercentagePhoto(blob);
			
		} catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}
		
		if (!rs.hasErrors()) {
			service.PercentageInsert(msg);
			PercentageBean newMsg = new PercentageBean();
			mav.getModel().put("percentages", newMsg);
			
		}
		
		mav.setViewName("redirect:/viewPercentages");

		return mav;
	}
//	修改%數	
	@PostMapping("/updatePercentages")
	public ModelAndView updatePercentages(ModelAndView mav, @Valid @ModelAttribute(name="percentages") PercentageBean msg, BindingResult result) {
		
		mav.setViewName("b_discount_update_p");

		try {
			SerialBlob blob = new SerialBlob(msg.getPercentageImage().getBytes());
			msg.setPercentagePhoto(blob);
			
		} catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}
		
		if(!result.hasErrors()) {
			 service.PercentageInsert(msg);
			 mav.setViewName("redirect:/viewPercentages");
		}
		
		return mav;
	}
//	刪除%數	
	@GetMapping("/deletePercentages")
	public ModelAndView deletePercentages(ModelAndView mav, @RequestParam(name = "id") Integer id) {
			 service.PercentageDelete(id);
			 mav.setViewName("redirect:/viewPercentages");
		
		return mav;
	}
}
