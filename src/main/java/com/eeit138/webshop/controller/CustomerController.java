package com.eeit138.webshop.controller;


import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eeit138.webshop.model.AccountBean;
import com.eeit138.webshop.model.CustomerBean;
import com.eeit138.webshop.service.AccountService;
import com.eeit138.webshop.service.CustomerReplyService;



@Controller
public class CustomerController {
	
	@Autowired
	private CustomerReplyService service;
	@Autowired
	private AccountService dao;
	
	@GetMapping("/viewReply")
	public ModelAndView viewReply(ModelAndView mav, @RequestParam(name = "id") Integer id, HttpSession session) {
		
		if (session.getAttribute("status") == null) {
			mav.setViewName("redirect:/register");
			return mav;
		}
		
		List<CustomerBean> replys = service.findAllByAcidOrderByAddedAsc(id);
		
		mav.getModel().put("newReply", new CustomerBean());
		mav.getModel().put("replys", replys);
		mav.setViewName("account_contact");
		
		return mav;
	}
	
	@PostMapping(value="/cusReply")
	public ModelAndView cusReply(ModelAndView mav,@ModelAttribute(name = "newReply") CustomerBean newReply, @RequestParam(name = "id") Integer id, HttpSession session) {
		
		if (session.getAttribute("status") == null) {
			mav.setViewName("redirect:/register");
			return mav;
		}
		
		newReply.setId(newReply.getId() + 1);
		newReply.setAdded(new Date());
		service.save(newReply);
		
		mav.setViewName("redirect:/viewReply?id="+id);
		
		return mav;
	}
	
	
	@GetMapping("/b_reply_single")
	public ModelAndView b_reply_single(ModelAndView mav, @RequestParam(name = "id") Integer id) {
		CustomerBean reply = service.findById(id);
		int acid = reply.getAccountid();
		AccountBean Account = dao.findById(acid);
		
		mav.getModel().put("reply", reply);
		mav.getModel().put("ac", Account);
		mav.setViewName("b_reply_single");
		
		return mav;
	}
	
	
	@PostMapping("/b_reply_single")
	public ModelAndView editMessage(ModelAndView mav, @ModelAttribute(name="reply") CustomerBean reply) {
		reply.setReplyadded(new Date());
		service.save(reply);
		
		mav.getModel().put("id", reply.getId());
		mav.setViewName("redirect:/b_reply_single");
		
		return mav;
		
	}
	
	@GetMapping("/deleteCustomer")
	public ModelAndView deleteMessage(ModelAndView mav, @RequestParam("id") Integer id) {
		service.delete(id);
		mav.setViewName("redirect:/breindex");
		
		return mav;
	}
	

}
