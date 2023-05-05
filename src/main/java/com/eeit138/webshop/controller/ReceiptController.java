package com.eeit138.webshop.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eeit138.webshop.model.AccountBean;
import com.eeit138.webshop.model.CartList;
import com.eeit138.webshop.model.Category;
import com.eeit138.webshop.model.CouponBean;
import com.eeit138.webshop.model.FixedBean;
import com.eeit138.webshop.model.OrderBean;
import com.eeit138.webshop.model.OrderDetail;
import com.eeit138.webshop.model.PercentageBean;
import com.eeit138.webshop.model.ProductBean;
import com.eeit138.webshop.service.AccountService;
import com.eeit138.webshop.service.CartListService;
import com.eeit138.webshop.service.CategoryService;
import com.eeit138.webshop.service.DiscountsService;
import com.eeit138.webshop.service.LogisticsService;
import com.eeit138.webshop.service.OrderDetailService;
import com.eeit138.webshop.service.OrderService;
import com.eeit138.webshop.service.PaymentService;
import com.eeit138.webshop.service.ProductService;
import com.eeit138.webshop.service.ProductStatusService;
import com.eeit138.webshop.service.ReceiptService;

@Controller
public class ReceiptController {
	
	private OrderDetailService OrderDetailService;
	private CartListService cartListService;
	private ProductService productService;
	private CategoryService categoryService;
	private AccountService accountService;
	private OrderService orderService;
	private DiscountsService discountService;
	private PaymentService PS;
	private LogisticsService LS;
	
	@Autowired
	public ReceiptController(ProductService productService,
						     CategoryService categoryService,
						     ProductStatusService productStatusService,
						     CartListService cartListService,
						     ReceiptService receiptService,
						     OrderDetailService OrderDetailService,
						     AccountService accountService,
						     OrderService orderService,
						     DiscountsService discountService,
						     PaymentService PS,
							 LogisticsService LS) {
		
		this.OrderDetailService = OrderDetailService;
		this.cartListService = cartListService;
		this.productService = productService;
		this.categoryService = categoryService;
		this.accountService = accountService;
		this.orderService = orderService;
		this.discountService = discountService;
		this.PS = PS;
		this.LS = LS;
	}

	@PostMapping("/myCartList")
	public ModelAndView myCartListPage(ModelAndView mv, 
			HttpServletRequest request, HttpSession session) {
		int accountId = (Integer)request.getSession().getAttribute("accountId");
		 
		List<CartList> CartLists = cartListService.findByAccountId(accountId);
		Date orderid = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String odid = "ajen"+sdf.format(orderid);
		for(CartList CartList:CartLists) {
			OrderDetail od = new OrderDetail();
			od.setAccountId(CartList.getAccountId());
			od.setProductId(CartList.getProductId());
			od.setQuantity(CartList.getQuantity());
			od.setProduct(CartList.getProduct());
			ProductBean pd = productService.findById(CartList.getProductId());
			od.setPrice(pd.getPrice()*CartList.getQuantity());			
			od.setOrderid(odid);
			OrderDetailService.save(od);
		}
		cartListService.deleteByAccountId(accountId);
		List<OrderDetail> OrderDetails = OrderDetailService.findByOrderid(odid);
		String itemstr = "";
		for(OrderDetail OrderDetail:OrderDetails) {
			itemstr += OrderDetail.getProduct().getName()+"x"+OrderDetail.getQuantity()+"共"+OrderDetail.getPrice()+"元#";
		}
		OrderBean order = new OrderBean();
		order.setMerchantTradeNo(odid);
		order.setMerchantTradeDate(orderid);
		order.setAccountId(accountId);
		order.setItemName(itemstr);
		orderService.save(order);
		session.setAttribute("orderid", order.getMerchantTradeNo());
		AccountBean account = accountService.findById(accountId);
		request.getSession().setAttribute("numberInCart", 0);
		mv.getModel().put("OrderDetail", OrderDetailService.findByOrderid((String)session.getAttribute("orderid")));
		mv.getModel().put("account",account);
		mv.setViewName("redirect:/orderck");
		return mv;
	}
	
	@GetMapping("/orderck")
	public ModelAndView orderck(ModelAndView mv, 
			HttpServletRequest request, HttpSession session) {
		int accountId = (Integer)request.getSession().getAttribute("accountId");
		String orderid = (String)session.getAttribute("orderid");
		OrderBean ob = orderService.findByMerchantTradeNo(orderid);
		PercentageBean percentage = discountService.findFirstByPercentageOnOff(1);
		CouponBean Coupon = discountService.findFirstByCouponOnOff(1);
		FixedBean Fix = discountService.findFirstByfixedOnOff(1);
		mv.getModel().put("OrderBean",ob);
		mv.getModel().put("percentage",percentage);
		mv.getModel().put("Coupon",Coupon);
		mv.getModel().put("Fix",Fix);
		mv.getModel().put("OrderDetail", OrderDetailService.findByOrderid(orderid));
		mv.getModel().put("account",accountService.findById(accountId));
		mv.setViewName("order");
		return mv;
	}
	
	@PostMapping("/ordercke")
	public ModelAndView ordercke(ModelAndView mv, @ModelAttribute(name = "OrderBean")OrderBean OrderBean,
			HttpServletRequest request, HttpSession session) {
		int accountId = (Integer)request.getSession().getAttribute("accountId");
		mv.getModel().put("account",accountService.findById(accountId));
		orderService.save(OrderBean);
		mv.setViewName("pickship");
		return mv;
	}
	
	@GetMapping("/pickship")
	public ModelAndView pickship(ModelAndView mv, 
			HttpServletRequest request, HttpSession session) {
		mv.setViewName("pickship");
		return mv;
	}
	
	@PostMapping("/pickship")
	public ModelAndView pickship(ModelAndView mav, @RequestParam(name = "ddd") String ddd,
			HttpServletRequest request, HttpSession session) {
		System.out.println(ddd);
		String orderid = (String)session.getAttribute("orderid");
		LS.initial();
		LS.cmprChkMacValue();	
		String s = LS.postExpressMap(ddd, orderid);
		mav.getModel().put("ls", s);
		mav.setViewName("pickshipment");
		return mav;
	}
	
	@PostMapping("/checkout")
	public ModelAndView checkout(ModelAndView mav, @RequestParam(name = "merchantTradeNo") String merchantTradeNo,
			HttpServletRequest request, HttpSession session) {
		OrderBean od = orderService.findByMerchantTradeNo(merchantTradeNo);
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String dateToStr = dateFormat.format(od.getMerchantTradeDate());
		String intToStr = od.getTotalAmount().toString();
		PS.initial();
		PS.cmprChkMacValue();	
		String s = PS.genAioCheckOutALL(od.getMerchantTradeNo(),dateToStr ,intToStr, od.getItemName());
		mav.getModel().put("ps", s);
		mav.setViewName("paypage");
		return mav;
	}
	
	@PostMapping("/tradenow")
	public ModelAndView tradenow(ModelAndView mav, 
			@RequestParam(name = "merchantTradeNo") String merchantTradeNo,
			HttpServletRequest request, HttpSession session) {
		OrderBean od = orderService.findByMerchantTradeNo(merchantTradeNo);
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String dateToStr = dateFormat.format(od.getMerchantTradeDate());
		String intToStr = od.getTotalAmount().toString();
		AccountBean ac = accountService.findById(od.getAccountId());
		LS.initial();
		LS.cmprChkMacValue();	
		String s = LS.postCreateCVS(merchantTradeNo,
				dateToStr,
				od.getLogisticsSubType(),
				od.getcVSStoreID(),
				ac.getPhone(),
				intToStr,
				ac.getAname()
				);
		mav.getModel().put("ls", s);
		mav.setViewName("pickshipment");
		return mav;
	}
	
	@ModelAttribute(name = "categoriesList")
	public List<Category> getCategoriesList() {
		List<Category> categoriesList = categoryService.findAll();
		return categoriesList;
	}
	
	@PostMapping("/catchship")
	public ModelAndView catchship(ModelAndView mv,
			@RequestParam(name="ExtraData")String ExtraData,
			@RequestParam(name="CVSStoreID")String CVSStoreID,
			@RequestParam(name="CVSStoreName")String CVSStoreName,
			@RequestParam(name="CVSAddress")String CVSAddress,
			@RequestParam(name="LogisticsSubType")String LogisticsSubType,
			HttpServletRequest request, HttpSession session) {
		OrderBean od = orderService.findByMerchantTradeNo(ExtraData);
		int AccountId = od.getAccountId();
		AccountBean ad = accountService.findById(AccountId);
		session.setAttribute("accountId", AccountId);
		session.setAttribute("ac", ad.getAc());
		session.setAttribute("status", "ok");
		od.setcVSStoreID(CVSStoreID);
		od.setcVSStoreName(CVSStoreName);
		od.setcVSAddress(CVSAddress);
		od.setLogisticsSubType(LogisticsSubType);
		orderService.save(od);
//		int accountId = (Integer)request.getSession().getAttribute("accountId");
		mv.getModel().put("OrderBean",od);
		mv.getModel().put("OrderDetail", OrderDetailService.findByOrderid(ExtraData));
		mv.getModel().put("account",ad);
		mv.setViewName("pickend");
		return mv;
	}
	
	@PostMapping("/catchpay")
	public ModelAndView catchpay(ModelAndView mv,
			@RequestParam(name="MerchantTradeNo")String MerchantTradeNo,
			@RequestParam(name="PaymentType")String PaymentType,
			@RequestParam(name="TradeNo")String TradeNo,
			@RequestParam(name="RtnCode")String RtnCode,
			@RequestParam(name="RtnMsg")String RtnMsg,
			HttpServletRequest request, HttpSession session) {
		OrderBean od = orderService.findByMerchantTradeNo(MerchantTradeNo);
		int AccountId = od.getAccountId();
		AccountBean ad = accountService.findById(AccountId);
		session.setAttribute("accountId", AccountId);
		session.setAttribute("ac", ad.getAc());
		session.setAttribute("status", "ok");
		od.setPaymentType(PaymentType);
		od.setTradeNo(TradeNo);
		od.setRtnCode(Integer.parseInt(RtnCode));
		od.setTradeDesc(RtnMsg);
		orderService.save(od);
		mv.getModel().put("OrderBean",od);
		mv.getModel().put("OrderDetail", OrderDetailService.findByOrderid(MerchantTradeNo));
		mv.getModel().put("account",ad);
		mv.setViewName("payend");
		return mv;
	}
	
	@PostMapping("/catchend")
	public ModelAndView catchend(ModelAndView mv,
			@RequestParam(name="MerchantTradeNo")String MerchantTradeNo,
			@RequestParam(name="RtnMsg")String RtnMsg,
			@RequestParam(name="AllPayLogisticsID")String AllPayLogisticsID,
			HttpServletRequest request, HttpSession session) {
		OrderBean od = orderService.findByMerchantTradeNo(MerchantTradeNo);
		int AccountId = od.getAccountId();
		AccountBean ad = accountService.findById(AccountId);
		session.setAttribute("accountId", AccountId);
		session.setAttribute("ac", ad.getAc());
		session.setAttribute("status", "ok");
		od.setAllPayLogisticsID(AllPayLogisticsID);
		od.setRtnMsgL(RtnMsg);
		orderService.save(od);
		List<OrderBean> ods = orderService.findByAccountIdOrderByMerchantTradeDateDesc(AccountId);
		mv.getModel().put("OrderBeans",ods);
		mv.getModel().put("OrderDetail", OrderDetailService.findByOrderid(MerchantTradeNo));
		mv.getModel().put("account",ad);
		mv.setViewName("account_order");
		return mv;
	}
	
	@GetMapping("/account_order")
	public ModelAndView account_order(ModelAndView mv,
			@RequestParam(name="id")int id,
			HttpServletRequest request, HttpSession session) {
		AccountBean ad = accountService.findById(id);
		List<OrderBean> ods = orderService.findByAccountIdOrderByMerchantTradeDateDesc(id);
		mv.getModel().put("OrderBeans",ods);
		mv.getModel().put("account",ad);
		mv.setViewName("account_order");
		return mv;
	}
}
