package com.eeit138.webshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.eeit138.webshop.dao.PostRepository;
import com.eeit138.webshop.model.Post;


// 資料CRUD的處裡 並回傳給VIEW
@Service
public class PostService {

	@Autowired
	private PostRepository dao;
	
	// 新增
	public void insert(Post post) {
		dao.save(post);
	}
	
	// 單筆查詢id
	public Post findById(Integer id) {
		Optional<Post> post = dao.findById(id);
		if (post.isPresent()) {
			return post.get();
		}
		return null;
	}
	
	// 刪除
	public void delete(Integer id) {
		dao.deleteById(id);
	}
	
	// 全部查詢
	public List<Post> findAll() {
		List<Post> posts = dao.findAll();
		return posts;
	}

	// 頁數
	public Page<Post> findByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.DESC, "id");
		return dao.findAll(pgb);
	}
	
}
