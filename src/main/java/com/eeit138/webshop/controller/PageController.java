package com.eeit138.webshop.controller;


import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eeit138.webshop.dto.ProductDto;
import com.eeit138.webshop.model.AccountBean;
import com.eeit138.webshop.model.AdminBean;
import com.eeit138.webshop.model.Category;
import com.eeit138.webshop.model.CouponBean;
import com.eeit138.webshop.model.CustomerBean;
import com.eeit138.webshop.model.FixedBean;
import com.eeit138.webshop.model.OrderBean;
import com.eeit138.webshop.model.OrderDetail;
import com.eeit138.webshop.model.PercentageBean;
import com.eeit138.webshop.model.Post;
import com.eeit138.webshop.model.ProductBean;
import com.eeit138.webshop.model.ProductStatus;
import com.eeit138.webshop.service.AccountService;
import com.eeit138.webshop.service.AdminService;
import com.eeit138.webshop.service.CartListService;
import com.eeit138.webshop.service.CategoryService;
import com.eeit138.webshop.service.CustomerReplyService;
import com.eeit138.webshop.service.DiscountsService;
import com.eeit138.webshop.service.OrderDetailService;
import com.eeit138.webshop.service.OrderService;
import com.eeit138.webshop.service.PostService;
import com.eeit138.webshop.service.ProductService;
import com.eeit138.webshop.service.ProductStatusService;
import com.eeit138.webshop.util.PageUtil;

@Controller
public class PageController {
	
	private ProductService productService;
	private CategoryService categoryService;
	private ProductStatusService productStatusService;
	private CartListService cartListService;
	private AdminService adminService;
	private AccountService accountService;
	private PostService postService;
	private CustomerReplyService customerReplyService;
	private DiscountsService discountService;
	private OrderService orderService;
	private OrderDetailService orderDetailService;
	
	@Autowired
	public PageController(ProductService productService,
						  CategoryService categoryService,
						  ProductStatusService productStatusService,
						  CartListService cartListService,
						  AdminService adminService,
						  AccountService accountService,
						  PostService postService,
						  CustomerReplyService customerReplyService,
						  DiscountsService discountService,
						  OrderService orderService,
						  OrderDetailService orderDetailService) {
		
		this.productService = productService;
		this.categoryService = categoryService;
		this.productStatusService = productStatusService;
		this.cartListService = cartListService;
		this.adminService = adminService;
		this.accountService = accountService;
		this.postService = postService;
		this.customerReplyService = customerReplyService;
		this.discountService = discountService;
		this.orderService = orderService;
		this.orderDetailService = orderDetailService;
	}
	
	@GetMapping("/")
	public ModelAndView home(ModelAndView mv,	HttpServletRequest request) {
		
		List<ProductBean> allProducts = productService.findAllByOrderByAddedTimeDesc();
		List<ProductBean> products = new LinkedList<ProductBean>();
		int index = 1;
		
		for(ProductBean p : allProducts) {
			if(p.getProductStatus().getId() == 1 && index <= 9) {
				products.add(p);
				index++;
			}
		}
			
		PercentageBean percentage = discountService.findFirstByPercentageOnOff(1);
		CouponBean Coupon = discountService.findFirstByCouponOnOff(1);
		FixedBean Fix = discountService.findFirstByfixedOnOff(1);
//		System.out.println("-------------------------------");
//		System.out.println(percentage.getPercentageName());
//		System.out.println(Coupon.getCouponName());
//		System.out.println(Fix.getFixedName());
//		System.out.println("-------------------------------");
		mv.getModel().put("disp", percentage);	
		mv.getModel().put("disc", Coupon);	
		mv.getModel().put("disf", Fix);	
		mv.getModel().put("products", products);		
		mv.setViewName("/index");
		return mv;
	}
	
	@GetMapping("/index")
	public ModelAndView index(ModelAndView mv,	HttpServletRequest request) {
		List<ProductBean> allProducts;
		allProducts = productService.findTop9ByOrderByAddedTimeDesc();
		PercentageBean percentage = discountService.findFirstByPercentageOnOff(1);
		CouponBean Coupon = discountService.findFirstByCouponOnOff(1);
		FixedBean Fix = discountService.findFirstByfixedOnOff(1);
		System.out.println("-------------------------------");
		System.out.println(percentage.getPercentageName());
		System.out.println(Coupon.getCouponName());
		System.out.println(Fix.getFixedName());
		System.out.println("-------------------------------");
		mv.getModel().put("disp", percentage);	
		mv.getModel().put("disc", Coupon);	
		mv.getModel().put("disf", Fix);	
		mv.getModel().put("products", allProducts);		
		mv.setViewName("/index");
		return mv;
	}
	
	@GetMapping("/shop")
	public ModelAndView shopPage(
			@RequestParam(name = "productType", defaultValue = "全部") String productType,
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(name = "nameLike", defaultValue = "") String nameLike,
			@RequestParam(name = "type1", defaultValue = "") String type1,
			@RequestParam(name = "type2", defaultValue = "") String type2,
			@RequestParam(name = "type3", defaultValue = "") String type3,
			@RequestParam(name = "type4", defaultValue = "") String type4,
			@RequestParam(name = "priceOrder", defaultValue = "") String priceOrder,
			@RequestParam(name = "priceLowerBound", defaultValue = "") String priceLowerBound,
			@RequestParam(name = "priceUpperBound", defaultValue = "") String priceUpperBound,
			@RequestParam(name = "eachPageNum", defaultValue = "9") int eachPageNum,
			RedirectAttributes ra,
			ModelAndView mv,
			HttpServletRequest request) {
		
		// 回傳 priceLowerBound, priceUpperBound
		mv.getModel().put("priceLowerBound", priceLowerBound);
		mv.getModel().put("priceUpperBound", priceUpperBound);
		// 預設 priceLowerBound, priceUpperBound
		if(priceLowerBound.equals(""))
			priceLowerBound = "0";
		if(priceUpperBound.equals(""))
			priceUpperBound = "9999999";
		
		List<ProductBean> allProducts;
		List<ProductBean> products = new LinkedList<>();
		List<String> types = new LinkedList<>();
		PageUtil pageUtil = new PageUtil();
		int eachPage = eachPageNum;
		int index = 0;
		int validItems = 0;
		types.add(type1);
		types.add(type2);
		types.add(type3);
		types.add(type4);
		
		if(priceOrder.equals("")) {
			
			boolean findAllTypes = type1.equals("") && type2.equals("") && type3.equals("") && type4.equals("");		
			if(findAllTypes) {
				allProducts = productService.findAllByNameLikeAndPriceBoundaries(nameLike, priceLowerBound, priceUpperBound);
				for(ProductBean p : allProducts) {
					index++;
					if((index > (page - 1) * eachPage) && (index <= page * eachPage) && p.getProductStatus().getId() == 1)
						products.add(p);
					if(p.getProductStatus().getId() == 1)
						validItems++;
				}
			}
			else {
				allProducts = productService.findByTypesAndNameLikeAndPriceBoundaries(type1, type2, type3, type4, nameLike, priceLowerBound, priceUpperBound);
				for(ProductBean p : allProducts) {
					index++;
					if((index > (page - 1) * eachPage) && (index <= page * eachPage) && p.getProductStatus().getId() == 1)
						products.add(p);
					if(p.getProductStatus().getId() == 1)
						validItems++;
				}
			}		
		}
		else {
			boolean findAllTypes = type1.equals("") && type2.equals("") && type3.equals("") && type4.equals("");		
			if(findAllTypes) {
				if(priceOrder.equals("低至高"))
					allProducts = productService.findAllByNameLikeAndPriceBoundariesOrderByPriceAsc(nameLike, priceLowerBound, priceUpperBound);
				else
					allProducts = productService.findAllByNameLikeAndPriceBoundariesOrderByPriceDesc(nameLike, priceLowerBound, priceUpperBound);

				for(ProductBean p : allProducts) {
					index++;
					if((index > (page - 1) * eachPage) && (index <= page * eachPage) && p.getProductStatus().getId() == 1)
						products.add(p);
					if(p.getProductStatus().getId() == 1)
						validItems++;
				}
			}
			else {
				if(priceOrder.equals("低至高"))
					allProducts = productService.findByTypesAndNameLikeAndPriceBoundariesOrderByPriceAsc(type1, type2, type3, type4, nameLike, priceLowerBound, priceUpperBound);
				else
					allProducts = productService.findByTypesAndNameLikeAndPriceBoundariesOrderByPriceDesc(type1, type2, type3, type4, nameLike, priceLowerBound, priceUpperBound);
					
				for(ProductBean p : allProducts) {
					index++;
					if((index > (page - 1) * eachPage) && (index <= page * eachPage) && p.getProductStatus().getId() == 1)
						products.add(p);
					if(p.getProductStatus().getId() == 1)
						validItems++;
				}
			}
		}
		List<ProductBean> allProductsByAddedTimeDesc = productService.findAllByOrderByAddedTimeDesc();
		List<ProductBean> newProducts = new LinkedList<ProductBean>();
		int num = 1;
		
		for(ProductBean p : allProductsByAddedTimeDesc) {
			if(p.getProductStatus().getId() == 1 && num <= 5) {
				newProducts.add(p);
				num++;
			}
		}
		
		mv.getModel().put("products", products);
		mv.getModel().put("adproducts", newProducts);
		int pages = pageUtil.makePages(validItems, eachPage);
		mv.getModel().put("pages", pages);
		mv.getModel().put("productType", productType);
		mv.getModel().put("pagE", page);
		mv.getModel().put("currentPage", currentPage);
		mv.getModel().put("eachPageNum", eachPageNum);
		mv.getModel().put("nameLike", nameLike);
		mv.getModel().put("types", types);		
		mv.getModel().put("priceOrder", priceOrder);		
		mv.setViewName("/shop");
		mv.getModel().put("categoriesList", categoryService.findAll());			
		if(request.getSession().getAttribute("accountId")!=null) {
			int accountId = (Integer)request.getSession().getAttribute("accountId");
			int numberInCart = cartListService.findByAccountId(accountId).size();
			request.getSession().setAttribute("numberInCart", numberInCart);
		} 		
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
	
	@ModelAttribute(name = "categoriesList")
	public List<Category> getCategoriesList() {
		List<Category> categoriesList = categoryService.findAll();
		return categoriesList;
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
	
	@GetMapping("/addProduct")
	public ModelAndView addProductPage(ModelAndView mv) {
		
		mv.setViewName("b_product_add");
		mv.getModel().put("productBean", new ProductBean());
		mv.getModel().put("categories", categoryService.findAll());
		
		return mv;
	}
	
	@GetMapping("/register")
	public ModelAndView register(
			@RequestParam(name = "goToCart", required = false) boolean goToCart,
			@RequestParam(name = "productID", required = false) Integer productID,
			@RequestParam(name = "entryFalse", required = false) String entryFalse,
			@RequestParam(name = "pageLocation", defaultValue = "") String pageLocation,
			@RequestParam(name = "nameLike", defaultValue = "") String nameLike,
			@RequestParam(name = "type1", defaultValue = "") String type1,
			@RequestParam(name = "type2", defaultValue = "") String type2,
			@RequestParam(name = "type3", defaultValue = "") String type3,
			@RequestParam(name = "type4", defaultValue = "") String type4,
			@RequestParam(name = "priceOrder", defaultValue = "") String priceOrder,
			@RequestParam(name = "priceLowerBound", defaultValue = "") String priceLowerBound,
			@RequestParam(name = "priceUpperBound", defaultValue = "") String priceUpperBound,
			@RequestParam(name = "eachPageNum", defaultValue = "9") int eachPageNum,
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(name = "nameForLogin", defaultValue = "") String nameForLogin,
			@RequestParam(name = "passwordForLogin", defaultValue = "") String passwordForLogin,
			ModelAndView mav, HttpServletRequest request) {
		
		mav.getModel().put("accountBean", new AccountBean());
		mav.getModel().put("nameForLogin", nameForLogin);
		mav.getModel().put("passwordForLogin", passwordForLogin);
		mav.setViewName("register");
		
		request.getSession().setAttribute("pageLocation", pageLocation);
		request.getSession().setAttribute("productID", productID);
		//
		request.getSession().setAttribute("nameLike", nameLike);
		request.getSession().setAttribute("type1", type1);
		request.getSession().setAttribute("type2", type2);
		request.getSession().setAttribute("type3", type3);
		request.getSession().setAttribute("type4", type4);
		request.getSession().setAttribute("priceOrder", priceOrder);
		request.getSession().setAttribute("priceLowerBound", priceLowerBound);
		request.getSession().setAttribute("priceUpperBound", priceUpperBound);
		request.getSession().setAttribute("eachPageNum", eachPageNum);
		request.getSession().setAttribute("page", page);
		request.getSession().setAttribute("currentPage", currentPage);
		//
		if(goToCart == true)
			request.getSession().setAttribute("goToCart", true);
		
		return mav;
	}
	
	@GetMapping("/badindex")
	public ModelAndView b_admin_index(ModelAndView mav, @RequestParam(name="p",defaultValue = "1")Integer pageNumber) {
		mav.setViewName("b_admin_index");				
		Page<AdminBean> page = adminService.findByPage(pageNumber);		
		mav.getModel().put("page", page);	
		return mav;
	}
	
	@GetMapping("/bacindex")
	public ModelAndView b_account_index(ModelAndView mav, HttpServletRequest request) {
		mav.setViewName("b_account_index");				
		List<AccountBean> accounts = accountService.findAll();		
		mav.getModel().put("accounts", accounts);	
		return mav;
	}
	
	@GetMapping("/barindex")
	public ModelAndView b_article_index(ModelAndView mav, HttpServletRequest request) {
		mav.setViewName("b_article_index");				
		List<Post> posts = postService.findAll();		
		mav.getModel().put("posts", posts);	
		return mav;
	}
	
	@GetMapping("/baradd")
	public ModelAndView b_article_add(ModelAndView mav) {
		mav.setViewName("b_article_add");
		mav.getModel().put("Post", new Post());
		return mav;
	}
	
	@GetMapping("/badadd")
	public ModelAndView emp(ModelAndView mav) {
		mav.setViewName("b_admin_add");
		mav.getModel().put("AdminBean", new AdminBean());
		return mav;
	}
	
	
	@GetMapping("/bprindex")
	public ModelAndView b_product_index(ModelAndView mv, HttpServletRequest request) {
		
//		List<ProductBean> products = new LinkedList<ProductBean>();
		List<ProductBean> allProducts;
		allProducts = productService.findAllByOrderByAddedTimeDesc();
//		for(ProductBean p : allProducts) {
//			if(p.getProductStatus() != null)
//				products.add(p);
//		}
			
		mv.getModel().put("products", allProducts);

		List<ProductStatus> productStatusList = productStatusService.findAll();
		mv.getModel().put("productStatusList", productStatusList);	
		
		mv.setViewName("/b_product_index");
		
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/changeProductStatus")
	public String changeProductStatusPage(@RequestBody ProductDto dto) {
		
		Integer statusId = dto.getProductStatusId();
		Integer productId = dto.getId();
		ProductBean product = productService.findById(productId);
		ProductStatus newStatus;
		
		if(statusId == 0) {
			newStatus = productStatusService.findById(1);
			product.setProductStatus(newStatus);
		}
		else {
			newStatus = productStatusService.findById(0);
			product.setProductStatus(newStatus);
		}
		
		productService.updateProductStatus(product);
		System.out.println("-----------"+newStatus.getStatus());
		return newStatus.getStatus();
	}
	
	@GetMapping("/borindex")
	public ModelAndView borindex(ModelAndView mv, HttpServletRequest request) {
		List<OrderBean> OrderBeans = orderService.findAll();
		mv.getModel().put("OrderBeans", OrderBeans);		
		mv.setViewName("/b_order_index");
		return mv;
	}
	
	@GetMapping("/bordelete")
	public ModelAndView bordelete(ModelAndView mv, HttpServletRequest request, @RequestParam(name = "id")String MerchantTradeNo) {
		orderService.deleteByMerchantTradeNo(MerchantTradeNo);
		orderDetailService.deleteByOrderid(MerchantTradeNo);
		mv.setViewName("redirect:/borindex");
		return mv;
	}
	
	@GetMapping("/oneOR")
	public ModelAndView oneOR(ModelAndView mav, @RequestParam(name = "id") String id) {
		OrderBean OrderBean = orderService.findByMerchantTradeNo(id);
		List<OrderDetail> OrderDetail = orderDetailService.findByOrderid(id);
		int acid = OrderBean.getAccountId();
		AccountBean account = accountService.findById(acid);
		mav.getModel().put("account", account);
		mav.getModel().put("OrderBean", OrderBean);
		mav.getModel().put("OrderDetail", OrderDetail);
		mav.setViewName("b_order_single");
		return mav;
	}
	
	@GetMapping("/breindex")
	public ModelAndView b_reply_index(ModelAndView mv, HttpServletRequest request) {
		List<CustomerBean> replys;
		replys = customerReplyService.findAll();
		mv.getModel().put("replys", replys);		
		mv.setViewName("/b_reply_index");
		return mv;
	}
	
	@GetMapping("/about")
	public String about() {
		return "about";
	}
	
	@GetMapping("/contact")
	public String contact() {
		return "contact";
	}
	
	@GetMapping("/blog")
	public ModelAndView blog(ModelAndView mv, HttpServletRequest request) {
		List<Post> posts = postService.findAll();
		mv.getModel().put("blog", posts);
		mv.setViewName("/blog");
		return mv;
	}
	
	@GetMapping("/viewReply")
	public ModelAndView viewReply(ModelAndView mav, @RequestParam(name = "id") Integer id) {
		mav.setViewName("account_contact");
		mav.getModel().put("reply", new CustomerBean());
		List<CustomerBean> replys = customerReplyService.findByAcidOrderByAddedDesc(id);
		mav.getModel().put("replys", replys);
		return mav;
	}
	
	@PostMapping("/couponck")
	public ModelAndView couponck(ModelAndView mav, @RequestParam(name = "couponck")String couponck, HttpSession se) {
		if(couponck.equals(discountService.findFirstByCouponOnOff(1).getCouponName())) {
			String crs = "OK";
			se.setAttribute("crs", crs);
			mav.setViewName("redirect:/orderck");
			return mav;
		}
		
		return null;
	}
	
	@GetMapping("/index_b")
	public String index_b() {
		return "index_b";
	}
	@GetMapping("/paypage")
	public String paypage() {
		return "paypage";
	}
	@GetMapping("/pickshipment")
	public String paidpage() {
		return "pickshipment";
	}

}
