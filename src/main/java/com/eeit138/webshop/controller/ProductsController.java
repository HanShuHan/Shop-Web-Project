package com.eeit138.webshop.controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eeit138.webshop.model.CartList;
import com.eeit138.webshop.model.Category;
import com.eeit138.webshop.model.OrderDetail;
import com.eeit138.webshop.model.ProductBean;
import com.eeit138.webshop.model.ProductStatus;
import com.eeit138.webshop.service.CartListService;
import com.eeit138.webshop.service.CategoryService;
import com.eeit138.webshop.service.OrderDetailService;
import com.eeit138.webshop.service.ProductService;
import com.eeit138.webshop.service.ProductStatusService;
@Controller
//@MultipartConfig
public class ProductsController {

	private ProductService productService;
	private CategoryService categoryService;
	private ProductStatusService productStatusService;
	private CartListService cartListService;
	private OrderDetailService orderDetailService;
	
	private Blob[] productImages = new Blob[3];
	
	@Autowired
	public ProductsController(ProductService productService,
						  	  CategoryService categoryService,
							  ProductStatusService productStatusService,
							  CartListService cartListService,
							  OrderDetailService orderDetailService) {
		
		this.productService = productService;
		this.categoryService = categoryService;
		this.productStatusService = productStatusService;
		this.cartListService = cartListService;
		this.orderDetailService = orderDetailService;
	}

	@PostMapping("/addProduct")
	public String addProduct(@ModelAttribute(name = "productBean") ProductBean product,
							 ModelAndView mv) {
		
		if(!product.getImage1().getOriginalFilename().equals("")) {
			
			try {
				SerialBlob blob1 = new SerialBlob(product.getImage1().getBytes());
				product.setCoverImage1(blob1);
				
			} catch (SerialException e) {
				e.printStackTrace();
				
			} catch (SQLException e) {
				e.printStackTrace();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		if(!product.getImage2().getOriginalFilename().equals("")) {
			
			try {
				SerialBlob blob2 = new SerialBlob(product.getImage2().getBytes());
				product.setCoverImage2(blob2);
				
			} catch (SerialException e) {
				e.printStackTrace();
				
			} catch (SQLException e) {
				e.printStackTrace();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		if(!product.getImage3().getOriginalFilename().equals("")) {
			
			try {
				SerialBlob blob3 = new SerialBlob(product.getImage3().getBytes());
				product.setCoverImage3(blob3);
				
			} catch (SerialException e) {
				e.printStackTrace();
				
			} catch (SQLException e) {
				e.printStackTrace();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		Category category = categoryService.findById(product.getCategoryId());
		product.setType(category.getType());
		productService.save(product);
		
		return "redirect:/bprindex";
	}
	
	@GetMapping("/showImage1/{productId}")
	public ResponseEntity<byte[]> showImage1(@PathVariable("productId") Integer id,
										     HttpServletRequest request) {
		
		ProductBean product = productService.findById(id);
		
		byte[] imageBytes = null;
		Blob blob = product.getCoverImage1();
		try {
			imageBytes = blob.getBytes(1, (int) blob.length());
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<byte[]>(imageBytes, HttpStatus.OK);
	}
	
	@GetMapping("/showImage2/{productId}")
	public ResponseEntity<byte[]> showImage2(@PathVariable("productId") Integer id,
										     HttpServletRequest request) {
		
		ProductBean product = productService.findById(id);
		
		byte[] imageBytes = null;
		Blob blob = product.getCoverImage2();
		try {
			imageBytes = blob.getBytes(1, (int) blob.length());
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<byte[]>(imageBytes, HttpStatus.OK);
	}
	
	@GetMapping("/showImage3/{productId}")
	public ResponseEntity<byte[]> showImage3(@PathVariable("productId") Integer id,
										     HttpServletRequest request) {
		
		ProductBean product = productService.findById(id);
		
		byte[] imageBytes = null;
		Blob blob = product.getCoverImage3();
		try {
			imageBytes = blob.getBytes(1, (int) blob.length());
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<byte[]>(imageBytes, HttpStatus.OK);
	}
	
	
	@GetMapping("/product/{id}")
	public ModelAndView productPage(@PathVariable(name = "id") Integer id,
									ModelAndView mv) {
		
		mv.getModel().put("product", productService.findById(id));
		mv.setViewName("product-pages/product");
		
		return mv;
	}
	
	@GetMapping("/customerProduct/{id}")
	public ModelAndView customerProductPage(@PathVariable(name = "id") Integer id,
			ModelAndView mv) {
		
		mv.getModel().put("product", productService.findById(id));
		mv.setViewName("product-pages/customerProduct");
		
		return mv;
	}
	
	@RequestMapping("/editProduct")
	public ModelAndView editProduct(@RequestParam(value = "productId") Integer id,
							  	    ModelAndView mv) {
		
		ProductBean product = productService.findById(id);
		product.setCategoryId(product.getCategory().getId());
		product.setProductStatusId(product.getProductStatus().getId());
		
		productImages[0] = product.getCoverImage1();
		productImages[1] = product.getCoverImage2();
		productImages[2] = product.getCoverImage3();
		
		mv.setViewName("b_product_update");
		mv.getModel().put("product", product);

		return mv;
	}
	
	@ModelAttribute(name = "categories")
	public Map<Integer, String> getCategories() {
		
		Map<Integer, String> categories = new HashMap<Integer, String>();
		List<Category> categoriesList = categoryService.findAll();
		for(Category c : categoriesList)
			categories.put(c.getId(), c.getType());
		
		return categories;
	}
	
	@ModelAttribute(name = "productStatuses")
	public Map<Integer, String> getProductStatuses() {
		
		Map<Integer, String> productStatuses = new HashMap<Integer, String>();
		List<ProductStatus> productStatusesList = productStatusService.findAll();
			System.out.println(productStatusesList);
		for(ProductStatus s : productStatusesList)
			productStatuses.put(s.getId(), s.getStatus());
		
		return productStatuses;
	}
	
	@PostMapping("/editProduct")
	public ModelAndView updateProduct(ModelAndView mav, @ModelAttribute(name = "product") ProductBean product) throws SQLException {
		
		SerialBlob blob;
		
		if(product.getImage1().isEmpty())
			product.setCoverImage1(productImages[0]);
		
		else {
			try {
				blob = new SerialBlob(product.getImage1().getBytes());
				product.setCoverImage1(blob);
				
			} catch (SerialException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		if(product.getImage2().isEmpty())
			product.setCoverImage2(productImages[1]);
		
		else {
			try {
				blob = new SerialBlob(product.getImage2().getBytes());
				product.setCoverImage2(blob);
				
			} catch (SerialException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		if(product.getImage3().isEmpty())
			product.setCoverImage3(productImages[2]);
		
		else {
			try {
				blob = new SerialBlob(product.getImage3().getBytes());
				product.setCoverImage3(blob);
				
			} catch (SerialException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		Category category = categoryService.findById(product.getCategoryId());
		product.setType(category.getType());
		productService.save(product);
		int id = product.getProductId();
		ProductBean nproduct = productService.findById(id);
		mav.getModel().put("product", nproduct);
		mav.setViewName("b_product_single");
		return mav;
	}
	
	@GetMapping("/deleteProduct")
	public String deleteProduct(@RequestParam(name = "id") Integer id) {
		
		ProductBean product = productService.findById(id);
//		product.setProductStatus(null);
		List<CartList> cartLists = cartListService.findAllByProduct(product);
		for(CartList c : cartLists)
			c.setProduct(null);
		List<OrderDetail> orderDetails = orderDetailService.findAllByProduct(product);
		for(OrderDetail c : orderDetails)
			c.setProduct(null);
		
		productService.deleteById(id);

		return "redirect:/bprindex";
	}
	
	@ResponseBody
	@GetMapping("/checkToDeleteProduct")
	public boolean checkToDeleteProduct(@RequestParam(name = "productId") Integer productId) {
		
		ProductBean product = productService.findById(productId);
//		product.setProductStatus(null);
		int cartListsBoundNumber = cartListService.findAllByProduct(product).size();
		int orderDetailsBoundNumber = orderDetailService.findAllByProduct(product).size();
		
		if(cartListsBoundNumber > 0 || orderDetailsBoundNumber > 0)
			return false;
		else {
			
			productService.deleteById(productId);
			return true;
		}
		
	}
	
	@GetMapping("/onePR")
	public ModelAndView findByOne(ModelAndView mav, @RequestParam(name = "id") Integer id) {
		ProductBean product = productService.findById(id);
		mav.getModel().put("product", product);
		mav.setViewName("b_product_single");
		return mav;
	}
	
	@ModelAttribute(name = "categoriesList")
	public List<Category> getCategoriesList() {
		List<Category> categoriesList = categoryService.findAll();
		return categoriesList;
	}
	
	@GetMapping("/productDetail")
	public ModelAndView productDetailPage(
			@RequestParam(name = "productId") Integer productId,
			ModelAndView mv) {
		
		mv.setViewName("productDetail");
		ProductBean product = productService.findById(productId);
		String detail = product.getDetail2();
		mv.getModel().put("detail", detail);
		mv.getModel().put("productId", productId);
		
		return mv;
	}
}
