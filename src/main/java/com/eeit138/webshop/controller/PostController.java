package com.eeit138.webshop.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eeit138.webshop.model.Post;
import com.eeit138.webshop.service.PostService;

@Controller
public class PostController {

	@Autowired
	private PostService service;

	// 新增
	@PostMapping(value = "/Post")
	public ModelAndView addNewPost(ModelAndView mav, @Valid @ModelAttribute(name = "addPosts") Post post) {
		service.insert(post);
		mav.setViewName("redirect:/barindex");
		return mav;
	}

	// 刪除
	@GetMapping("deletePost")
	public ModelAndView deletePost(ModelAndView mav, @RequestParam(name = "id") Integer id) {
		service.delete(id);
		mav.setViewName("redirect:/barindex");
		return mav;
	}

	// 編輯留言_點擊進去
	@GetMapping("/editArticle")
	public ModelAndView editMessage(ModelAndView mav, @RequestParam(name = "id") Integer id) {
		Post post = service.findById(id);
		mav.getModel().put("post", post);
		mav.setViewName("b_article_update");
		return mav;
	}

	// 編輯留言_完成送出
	@PostMapping("/editArticle")
	public ModelAndView editMessage(ModelAndView mav, @Valid @ModelAttribute(name = "post") Post post) {
			service.insert(post);
			int id = post.getId();
			Post npost = service.findById(id);
			mav.getModel().put("post", npost);
			mav.setViewName("b_article_single");
		return mav;
	}
	
	@GetMapping("/oneAR")
	public ModelAndView arfindByOne(ModelAndView mav, @RequestParam(name = "id") Integer id) {
		Post post = service.findById(id);
		mav.getModel().put("post", post);
		mav.setViewName("b_article_single");
		return mav;
	}
	
	@GetMapping("/blog_single")
	public ModelAndView blog_single(ModelAndView mav, @RequestParam(name = "id") Integer id) {
		Post post = service.findById(id);
		mav.getModel().put("post", post);
		mav.setViewName("blog_single");
		return mav;
	}
	
}
