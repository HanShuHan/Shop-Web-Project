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

import com.eeit138.webshop.model.FixedBean;
import com.eeit138.webshop.service.DiscountsService;

@Controller
public class FixedController {
	
	@Autowired
	private DiscountsService service;
//	新增固定金額
	@PostMapping(value = "/addFixeds")
		public ModelAndView addFixeds(ModelAndView mav, @Valid @ModelAttribute(name = "fixeds") FixedBean msg,
				BindingResult rs) {
	
			try {
				SerialBlob blob = new SerialBlob(msg.getFixedImage().getBytes());
				msg.setFixedPhoto(blob);
				
			} catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
			
			if (!rs.hasErrors()) {
				service.FixedInsert(msg);
				FixedBean newMsg = new FixedBean();
				mav.getModel().put("fixeds", newMsg);
				
			}
			
			mav.setViewName("redirect:/viewFixeds");
	
			return mav;
		}
//	刪除固定金額	
	@GetMapping("/deleteFixeds")
	public ModelAndView deleteFixeds(ModelAndView mav, @RequestParam(name = "id") Integer id) {
			 service.FixedDelete(id);
			 mav.setViewName("redirect:/viewFixeds");
		
		return mav;
	}
	
}
