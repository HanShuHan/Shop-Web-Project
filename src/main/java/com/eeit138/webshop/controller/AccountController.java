package com.eeit138.webshop.controller;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eeit138.webshop.model.AccountBean;
import com.eeit138.webshop.model.AdminBean;
import com.eeit138.webshop.model.Category;
import com.eeit138.webshop.service.AccountService;
import com.eeit138.webshop.service.AdminService;
import com.eeit138.webshop.service.CartListService;
import com.eeit138.webshop.service.CategoryService;

@Controller
public class AccountController {
	
	@Autowired
	private AccountService dao;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private AdminService addao;
	@Autowired
	private CartListService cartListService;
	@Autowired
	private AdminService adminService;
	private Blob productImage;
	
	public AccountController(AccountService dao) {
		this.dao = dao;
	}
	
	@PostMapping(value = "/register")
	public ModelAndView register(@ModelAttribute(name = "accountBean") AccountBean account,
			ModelAndView mav) {
		
		dao.save(account);
		String nameForLogin = account.getAc();
		String passwordForLogin = account.getPw();
		mav.setViewName("redirect:/register?nameForLogin=" + nameForLogin
				+ "&passwordForLogin=" + passwordForLogin);
		return mav;
	}
	
	@PostMapping(value = "/login")
	public ModelAndView login(@ModelAttribute(name = "accountBean") AccountBean account,
			ModelAndView mav,  HttpSession session,
			RedirectAttributes redirAttr) {
		
		String ac = account.getAc();
		String pw = account.getPw();
		AccountBean ckac = dao.findByAc(ac);
		String location = "";
		
		if(ckac != null) {
			
			if(ckac.getPw().equals(pw)) {
				//
				session.setAttribute("accountId", ckac.getAcid());
				session.setAttribute("ac", ac);
				session.setAttribute("status", "ok");
				//
				int numberInCart = cartListService.findByAccountId(ckac.getAcid()).size();
				session.setAttribute("numberInCart", numberInCart);
				
				//
				if(session.getAttribute("goToCart") != null) {
					
					session.setAttribute("goToCart", null);
					mav.setViewName("redirect:/addToCart");
				}
				else {
//					//
//					mav.setViewName("redirect:/index");
//					//
//					String location = (String) session.getAttribute("pageLocation");
//					if(location.equals("shop"))
//						mav.setViewName("redirect:/shop");
//					else if(location.equals("productPage")) {
//						Integer pId = (Integer) session.getAttribute("productID");
//						mav.setViewName("redirect:/customerProduct/" + pId);
//					}
//					//
//					session.setAttribute("pageLocation", "");
					location = (String) session.getAttribute("pageLocation");
					switch (location) {
					
						case "shop":
//							String nameLike = (String) session.getAttribute("nameLike");
//							String type1 = (String) session.getAttribute("type1");
//							String type2 = (String) session.getAttribute("type2");
//							String type3 = (String) session.getAttribute("type3");
//							String type4 = (String) session.getAttribute("type4");
//							String priceOrder = (String) session.getAttribute("priceOrder");
//							String priceLowerBound = (String) session.getAttribute("priceLowerBound");
//							String priceUpperBound = (String) session.getAttribute("priceUpperBound");
//							int eachPageNum = (int) session.getAttribute("eachPageNum");
//							int page = (int) session.getAttribute("page");
//							int currentPage = (int) session.getAttribute("currentPage");
							//
							session.setAttribute("nameLike", null);
							session.setAttribute("type1", null);
							session.setAttribute("type2", null);
							session.setAttribute("type3", null);
							session.setAttribute("type4", null);
							session.setAttribute("priceOrder", null);
							session.setAttribute("priceLowerBound", null);
							session.setAttribute("priceUpperBound", null);
							session.setAttribute("eachPageNum", null);
							session.setAttribute("page", null);
							session.setAttribute("currentPage", null);
							//
							mav.setViewName("redirect:/shop");
//							mav.setViewName("redirect:/shop?nameLike=" + nameLike
//									+ "&type1=" + type1
//									+ "&type2=" + type2
//									+ "&type3=" + type3
//									+ "&type4=" + type4
//									+ "&priceOrder=" + priceOrder
//									+ "&priceLowerBound=" + priceLowerBound
//									+ "&priceUpperBound=" + priceUpperBound
//									+ "&eachPageNum=" + eachPageNum
//									+ "&page=" + page
//									+ "&currentPage=" + currentPage
//									);
							break;
							
						case "productPage":
							Integer pId = (Integer) session.getAttribute("productID");
							mav.setViewName("redirect:/customerProduct/" + pId);
							break;
							
						default:
							mav.setViewName("redirect:/index");
							break;
					}
				}
				
			} else {
				mav.getModel().put("entryFalse", "wrong");
				mav.setViewName("/register");
			}	
			
		} else {
			mav.getModel().put("entryFalse", "wrong");
			mav.setViewName("/register");
		}
		
		return mav;
	}
	
	@GetMapping(value = "/logout")
	public ModelAndView logout(ModelAndView mav,  HttpSession session) {		
			session.removeAttribute("ac");
			session.removeAttribute("accountId");
			session.removeAttribute("status");
			mav.setViewName("redirect:/index");		
		return mav;
	}
	
	@PostMapping(value = "/admin")
	public ModelAndView admin(@ModelAttribute(name = "adminBean") AdminBean adminBean, ModelAndView mav,  HttpSession session) {
		String ad = adminBean.getAc();
		String pw = adminBean.getPw();
		String rank = adminBean.getRank();
		AdminBean ckad = addao.findByAc(ad);
		if(ckad.getPw().equals(pw)) {
			mav.setViewName("/index_b");
			session.setAttribute("adminId", ckad.getId());
			session.setAttribute("rank", rank);
			session.setAttribute("ad", ad);
			session.setAttribute("adstatus", "ok");
			
		} else {
			mav.setViewName("/register");
		}		
		return mav;
	}
	
	@GetMapping(value = "/adlogout")
	public ModelAndView adlogout(ModelAndView mav,  HttpSession session) {		
			session.removeAttribute("ad");
			session.removeAttribute("adminId");
			session.removeAttribute("adstatus");
			session.removeAttribute("rank");
			mav.setViewName("redirect:/index");		
		return mav;
	}
	
	@GetMapping("/deleteAC")
	public ModelAndView deleteMessagePage(ModelAndView mav, @RequestParam(name = "id") Integer id) {
		dao.deleteById(id);
		mav.setViewName("redirect:/bacindex");
		return mav;
	}
	
	@GetMapping("/oneAC")
	public ModelAndView findByOne(ModelAndView mav, @RequestParam(name = "id") Integer id) {
		AccountBean AccountBean = dao.findById(id);
		mav.getModel().put("AccountBean", AccountBean);
		mav.setViewName("b_account_single");
		return mav;
	}
	
	@GetMapping("/password")
	public ModelAndView password(HttpSession session, ModelAndView mv) {
		
		Integer accountId = (Integer) session.getAttribute("accountId");
		AccountBean account = dao.findById(accountId);
		String passWord = account.getPw();
		
		mv.setViewName("account_password");
		mv.getModel().put("passWord", passWord);
		return mv;
	}
	
	@PostMapping("/cpassword")
	public ModelAndView cpassword(ModelAndView mav, @RequestParam(name = "id") Integer id, @RequestParam(name = "pwd")String pw, @RequestParam(name = "npwd")String npw) {
		AccountBean ac = dao.findById(id);
		String oldpw = ac.getPw();
		System.out.println(oldpw);
		String pwd = pw;
		String npwd = npw;
		System.out.println(pwd);
		System.out.println(npwd);
		if(oldpw.equals(pwd)) {
			ac.setPw(npwd);
			dao.save(ac);
			mav.setViewName("redirect:/account?id="+id);
			return mav;
		} else {
			mav.setViewName("cpassword");
			return mav;
		}
		
	}
	
	@GetMapping("/account")
	public ModelAndView account(ModelAndView mav, @RequestParam(name = "id") Integer id,HttpSession session) {

		if(session.getAttribute("status") != null) {
			AccountBean AccountBean = dao.findById(id);
			mav.getModel().put("AccountBean", AccountBean);
			mav.setViewName("account");
			return mav;
		} else {
			mav.setViewName("register");
			return mav;
		}
	}
	
	@RequestMapping("/updateAc")
	public ModelAndView updateAc(ModelAndView mav, @RequestParam(name = "id") Integer id) {
		AccountBean AccountBean = dao.findById(id);
		productImage = AccountBean.getCoverImage();
		mav.getModel().put("AccountBean", AccountBean);
		mav.setViewName("account_update");
		return mav;
	}
	
	@PostMapping(value = "/updateAc")
	public ModelAndView updateAc(ModelAndView mav, @ModelAttribute(name = "AccountBean") AccountBean AccountBean) {

		if(AccountBean.getImage().isEmpty())
			AccountBean.setCoverImage(productImage);
		else {
			try {
					SerialBlob blob = new SerialBlob(AccountBean.getImage().getBytes());
					AccountBean.setCoverImage(blob);
					dao.save(AccountBean);	
			} catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		int id = AccountBean.getAcid();
		AccountBean nAccountBean = dao.findById(id);
		mav.getModel().put("AccountBean", nAccountBean);
		mav.setViewName("account");
		return mav;
	}
	
	@RequestMapping("/updateAccountBean")
	public ModelAndView updateAccountBean(ModelAndView mav, @RequestParam(name = "id") Integer id) {
		AccountBean AccountBean = dao.findById(id);
		productImage = AccountBean.getCoverImage();
		mav.getModel().put("AccountBean", AccountBean);
		mav.setViewName("b_account_update");
		return mav;
	}
	
	@PostMapping(value = "/updateAccountBean")
	public ModelAndView updateAccountBean(ModelAndView mav, @ModelAttribute(name = "AccountBean") AccountBean AccountBean) {

		try {
				SerialBlob blob = new SerialBlob(AccountBean.getImage().getBytes());
				AccountBean.setCoverImage(blob);
				dao.save(AccountBean);	
		} catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}
		int id = AccountBean.getAcid();
		AccountBean nAccountBean = dao.findById(id);
		mav.getModel().put("AccountBean", nAccountBean);
		mav.setViewName("b_account_single");
		return mav;
	}
	
	@GetMapping("/acimage/{id}")
	public ResponseEntity<byte[]> showImage(@PathVariable("id") Integer id,
											HttpServletRequest request){
		AccountBean AccountBean = dao.findById(id);
		byte[]imageBytes = null;
		Blob blob = AccountBean.getCoverImage();
		try {
			imageBytes = blob.getBytes(1, (int)blob.length());
		} catch (SQLException e) {
			e.printStackTrace();
		}			
		return new ResponseEntity<byte[]>(imageBytes,HttpStatus.OK);
	}
	
	@ModelAttribute(name = "categoriesList")
	public List<Category> getCategoriesList() {
		List<Category> categoriesList = categoryService.findAll();
		return categoriesList;
	}
	
	@ResponseBody
	@GetMapping("/autoLoginRequest")
	public Map<String, String> autoLoginResponse(){

		AccountBean firstAccount = dao.findAll().get(0);
		String accountName = firstAccount.getAc();
		String accountPassword = firstAccount.getPw();
		
		Map<String, String> account = new HashMap<String, String>();
		account.put("name", accountName);
		account.put("password", accountPassword);
		
		return account;
	}
	
	@ResponseBody
	@GetMapping("/adminAutoLoginRequest")
	public Map<String, String> adminAutoLoginResponse(@RequestParam(name = "num") int num){
		
		AdminBean adminAccount = adminService.findAll().get(num);
		String accountName = adminAccount.getAc();
		String accountPassword = adminAccount.getPw();
		
		Map<String, String> account = new HashMap<String, String>();
		account.put("name", accountName);
		account.put("password", accountPassword);
		
		return account;
	}
	
	@ResponseBody
	@GetMapping("/findNewestMember")
	public Map<String, String> findNewestMemberResponse(){
		
		AccountBean adminAccount = dao.findTop1ByOrderByAddedDesc();
		String accountName = adminAccount.getAc();
//		String accountPassword = adminAccount.getPw();
		
		Map<String, String> account = new HashMap<String, String>();
		account.put("name", accountName);
//		account.put("password", accountPassword);
		
		return account;
	}
	

}
