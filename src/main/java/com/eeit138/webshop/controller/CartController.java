package com.eeit138.webshop.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eeit138.webshop.dto.CartListDto;
import com.eeit138.webshop.dto.ProductDto;
import com.eeit138.webshop.model.CartList;
import com.eeit138.webshop.model.Category;
import com.eeit138.webshop.model.OrderDetail;
import com.eeit138.webshop.model.ProductBean;
import com.eeit138.webshop.service.CartListService;
import com.eeit138.webshop.service.CategoryService;
import com.eeit138.webshop.service.ProductService;
import com.eeit138.webshop.service.ProductStatusService;
import com.eeit138.webshop.service.ReceiptService;

@Controller
public class CartController {

	private ProductService productService;
	private CartListService cartListService;
	private CategoryService categoryService;
	
	@Autowired
	public CartController(ProductService productService,
						  CategoryService categoryService,
						  ProductStatusService productStatusService,
						  CartListService cartListService,
						  ReceiptService receiptService) {
		
		this.productService = productService;
		this.cartListService = cartListService;
		this.categoryService = categoryService;
	}
	
	@ResponseBody
	@PostMapping("/addToCart")
	public int addToCart(@RequestBody ProductDto productDto,
			HttpServletRequest request) {
		
		Integer productId = productDto.getId();
		Integer userId = productDto.getUserId();
		ProductBean product = productService.findById(productId);
		
		if(cartListService.findByProductIdAndAccountId(productId, userId) == null) {
			
			CartList cartList = new CartList();
			cartList.setProductId(productId);
			cartList.setAccountId(userId);
			cartList.setProduct(product);
			cartListService.save(cartList);
			
			int numberInCart = cartListService.findByAccountId(userId).size();
			request.getSession().setAttribute("numberInCart", numberInCart);
			return numberInCart;
		}
		
		return -1;
	}
	
	@GetMapping("/addToCart")
	public String addToCartByDirect(HttpSession session) {
		
		Integer productID = (Integer) session.getAttribute("productID");
		Integer userId = (Integer) session.getAttribute("accountId");
		ProductBean product = productService.findById(productID);
		
		if(cartListService.findByProductIdAndAccountId(productID, userId) == null) {
			
			CartList cartList = new CartList();
			cartList.setProductId(productID);
			cartList.setAccountId(userId);
			cartList.setProduct(product);
			cartListService.save(cartList);
			//
			int numberInCart = cartListService.findByAccountId(userId).size();
			session.setAttribute("numberInCart", numberInCart);
		}
		
		return "redirect:/myCartList/accountId/"+ userId;
	}
	
	@GetMapping("/myCartList/accountId/{id}")
	public ModelAndView myCartListPage(@PathVariable(name = "id") Integer id, ModelAndView mv) {
		
		mv.setViewName("cart");
		mv.getModel().put("cartLists", cartListService.findByAccountId(id));
		mv.getModel().put("OrderDetail", new OrderDetail());
		
		return mv;
	}
	
//	@PostMapping("/myCartList")
//	public void myCartListPage(@ModelAttribute(name = "receipt") Receipt receipt) {
//		
//		receiptService.save(receipt);
//	}
	@ResponseBody
	@PostMapping("/updateMyCartList")
	public int updateMyCartListPage(@RequestBody CartListDto cartListDto) {
		
		// 更改訂單內容數量
		Integer listId = cartListDto.getId();
		Integer newQuantity = cartListDto.getQuantity();
		
		CartList cartList = cartListService.findById(listId);
		cartList.setQuantity(newQuantity);
		cartListService.save(cartList);
		
		return newQuantity;
	}
	@ResponseBody
	@PostMapping("/deleteOneCartList")
	public int  deleteOneCartListPage(
			@RequestBody CartListDto cartListDto,
			HttpServletRequest request) {
		
	// 刪除訂單
			cartListService.deleteById(cartListDto.getId());
			// 傳回購物車的商品數量
			Integer userId = cartListDto.getUserId();
			int numberInCart = cartListService.findByAccountId(userId).size();
			request.getSession().setAttribute("numberInCart", numberInCart);
			
			return numberInCart;
	}
	@ModelAttribute(name = "categoriesList")
	public List<Category> getCategoriesList() {
		List<Category> categoriesList = categoryService.findAll();
		return categoriesList;
	}
}
