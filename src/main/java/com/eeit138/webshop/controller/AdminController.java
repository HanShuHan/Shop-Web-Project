package com.eeit138.webshop.controller;

import java.sql.Blob;
import java.sql.SQLException;


import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eeit138.webshop.model.AdminBean;
import com.eeit138.webshop.service.AdminService;


@Controller
public class AdminController {

	private Blob[] productImages = new Blob[1];
	@Autowired
	private AdminService service;
//新增
	@PostMapping(value = "/addAdminBean")
	public ModelAndView postNewAdminBean(ModelAndView mav, @Valid @ModelAttribute(name = "AdminBean") AdminBean AdminBean, BindingResult rs) {

		try {service.insert(AdminBean);
			if (!rs.hasErrors()) {
				
				service.insert(AdminBean);
				AdminBean newAdminBean = new AdminBean();
				mav.getModel().put("AdminBean", newAdminBean);
				
			}
			
			SerialBlob blob = new SerialBlob(AdminBean.getImage().getBytes());
			System.out.println("----------------------------"+AdminBean.getImage().getBytes().length);
			AdminBean.setAdImage(blob);
			
		} catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}

		AdminBean lastestAdminBean = service.insert(AdminBean);
		mav.getModel().put("lastestAdminBean", lastestAdminBean);

		mav.setViewName("redirect:/badindex");

		return mav;
	}

	@GetMapping("/deleteAdminBean")
	public ModelAndView deleteMessagePage(ModelAndView mav, @RequestParam(name = "id") Integer id) {
		service.delete(id);
		mav.setViewName("redirect:/badindex");
		return mav;
	}
//查
	@GetMapping(value = "/AdminBeans")
	public ModelAndView findByEName(ModelAndView mav, @RequestParam(name = "id") Integer id) {
		AdminBean AdminBean = service.findById(id);
		mav.getModel().put("AdminBean", AdminBean);
		mav.setViewName("b_admin_index");

		return mav;

	}
	
	//單筆
	@GetMapping("/one")
	public ModelAndView findByOne(ModelAndView mav, @RequestParam(name = "id") Integer id) {
		AdminBean AdminBean = service.findById(id);
		mav.getModel().put("AdminBean", AdminBean);
		mav.setViewName("b_admin_single");
		return mav;
	}
	//updateAdminBean取值
	@RequestMapping("/updateAdminBean")
	public ModelAndView putAdminBean(ModelAndView mav, @RequestParam(name = "id") Integer id) {
		AdminBean AdminBean = service.findById(id);
		productImages[0] = AdminBean.getAdImage();
		mav.getModel().put("AdminBean", AdminBean);
		mav.setViewName("b_admin_update");
		return mav;
	}
	//updateAdminBean傳值
	@PostMapping("/updateAdminBean")
	public ModelAndView editAdminBean(ModelAndView mav,@ModelAttribute(name = "AdminBean") AdminBean AdminBean) {

			AdminBean.setAdImage(productImages[0]);
			AdminBean lastestAdminBean = service.insert(AdminBean);
			mav.getModel().put("AdminBean", lastestAdminBean);
			mav.setViewName("b_admin_single");
			return mav;
	}
	





//圖片顯示
	
	@GetMapping("/showImage/{id}")
	public ResponseEntity<byte[]> showImage(@PathVariable("id") Integer id,
											HttpServletRequest request){
		AdminBean AdminBean = service.findById(id);
		byte[]imageBytes = null;
		Blob blob = AdminBean.getAdImage();
		try {
			imageBytes = blob.getBytes(1, (int)blob.length());
		} catch (SQLException e) {
			e.printStackTrace();
		}			
		return new ResponseEntity<byte[]>(imageBytes,HttpStatus.OK);
	}

}